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

foreach my $rec ($db->resultset('Item')->near($lat,$lon,0,{itemtype=>17})) {
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
