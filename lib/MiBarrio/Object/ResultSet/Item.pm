package MiBarrio::Object::ResultSet::Item;
use strict;
use warnings;
use base qw(MiBarrio::Object::ResultSet);

sub near {
	my($self,$lat,$lon,$radius,$cond)=@_;
	$cond||={};
	return $self->search($cond,{
		'+columns' => [qw(id name latitude longitude itemtype url schedule)],
		select => [ { ''=>qq{(((acos(sin(($lat * pi() / 180)) * sin((latitude * pi() / 180)) + cos(($lat * pi() / 180)) * cos((latitude * pi() / 180)) * cos(($lon  - longitude) * pi() / 180)) ) * 180 / pi()) * 60 * 1.1515 * 1.609344 * 1000)}, -as=>'distance' } ],
		as => [qw(dist)],
		$radius>0 ? (having => {'distance' => {'<',$radius} }) : (),
		order_by => [qw(itemtype distance)],
	});
}

1;
