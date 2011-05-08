#!/usr/bin/env perl
use strict;
use Config::General;
use MiBarrio::Object;
use Data::Dumper;

my $SCRIPT = $0; $SCRIPT=~s,^.*/,,;

my $cfg = Config::General->new('mibarrio_local.conf');
my %cfg = $cfg->getall();
my $db = MiBarrio::Object->connect(@{$cfg{'Model::DB'}->{connect_info}});


my $lat = 0+41.420197;
my $lon = 0+2.189553;
my $radius = 500;

foreach my $rec ($db->resultset('Item')->search({
},{
	'+columns' => [qw(id name latitude longitude itemtype url schedule)],
	select => [ { ''=>qq{(((acos(sin(($lat * pi() / 180)) * sin((latitude * pi() / 180)) + cos(($lat * pi() / 180)) * cos((latitude * pi() / 180)) * cos(($lon  - longitude) * pi() / 180)) ) * 180 / pi()) * 60 * 1.1515 * 1.609344 * 1000)}, -as=>'distance' } ],
	as => [qw(dist)],
	having => {'distance' => {'<',$radius} },
	order_by => [qw(itemtype distance)],
})) {
	#print Dumper($rec);
	printf("%s,%s (%s) %s %s %s [%s]\n",
		$rec->latitude,
		$rec->longitude,
		$rec->get_column('dist'),
		$rec->itemtype,
		$rec->id,
		$rec->name,
		$rec->url,
	);
	foreach my $subtype ($rec->subtypes) {
		print "* ",$subtype->es,"\n";
	}
};
