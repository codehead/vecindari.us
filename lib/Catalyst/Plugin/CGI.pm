package Catalyst::Plugin::CGI;

use strict;
use base 'Class::Data::Inheritable';
use CGI;

our $VERSION = '1.00';

sub CGI {
	my $c = shift;
        if(my $cgi = $c->stash->{cgi}) {
                return $cgi;
        } else {
                $cgi = CGI->new($c->req->params);
                $c->stash->{cgi} = $cgi;
                return $cgi;
        }
}

1;