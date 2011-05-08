package Catalyst::Plugin::Setting;

use strict;
use base 'Class::Data::Inheritable';
use CGI;

our $VERSION = '1.00';

sub setting {
	my($c,$id,$default)=@_;
	if(my $entry = $c->model('MiBarrio::Setting')->find($id)) {
		return $entry->value()
	};
	return $default;
}

1;