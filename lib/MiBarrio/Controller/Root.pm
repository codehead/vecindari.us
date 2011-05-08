package MiBarrio::Controller::Root;
use Moose;
use namespace::autoclean;
use URI::Escape;
use LWP::UserAgent;
use JSON::XS;
use Cache::FileCache;

BEGIN { extends 'Catalyst::Controller' }

#
# Sets the actions in this controller to be registered with no prefix
# so they function identically to actions created in MyApp.pm
#
__PACKAGE__->config(namespace => '');

=head1 NAME

MiBarrio::Controller::Root - Root Controller for MiBarrio

=head1 DESCRIPTION

[enter your description here]

=head1 METHODS

=head2 index

The root page (/)

=cut

sub index :Path :Args(0) {
    my ( $self, $c ) = @_;
}

=head2 default

Standard 404 error page

=cut

sub default :Path {
    my ( $self, $c ) = @_;
    $c->response->body( 'Page not found' );
    $c->response->status(404);
}

=head2 end

Attempt to render a view, if needed.

=cut

sub end : ActionClass('RenderView') {
        my($self,$c)=@_;
        #die "forced debug" if $c->debug && $c->req->params->{dump_info};
        return 1 if $c->req->method eq 'HEAD';
        return 1 if scalar @{ $c->error } && !$c->stash->{template};
        return 1 if $c->response->status =~ /^(?:401|204|3\d\d)$/;
        unless ( $c->response->content_type ) {
                $c->response->content_type('text/html; charset="UTF-8"');
        }
        return 1 if $c->response->body ne '';
        if ($c->config->{view}) {
               print STDERR "Forwarding to ".$c->config->{view};
                $c->forward( $c->config->{view} );
        } else {
                my ($comp) = $c->comp( '^' . ref($c) . '::(V|View)::' );
                $c->forward( ref $comp );
        }
}
=head1 AUTHOR

arturo

=head1 LICENSE

This library is free software. You can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

__PACKAGE__->meta->make_immutable;

my $ua = LWP::UserAgent->new();
my $json = JSON::XS->new();
my $cache = Cache::FileCache->new({namespace=>'mibarrio'});

sub cerca : Local {
	my($self,$c)=@_;
}

sub ajax_pois : Local {
	my($self,$c)=@_;
	my $RADIUS = 200;
	my($lat,$lon)=($c->CGI->param('lat'),$c->CGI->param('lon'));
	my @ret = $c->model('DB::Item')->near($lat,$lon,$RADIUS);
	my $data;
	foreach my $rec (@ret) {
		push @{$data->{$rec->itemtype}}, $rec;
	}
	$c->stash(data=>$data);
}

sub ajax_air_quality : Local {
	my($self,$c)=@_;
	my($lat,$lon)=($c->CGI->param('lat'),$c->CGI->param('lon'));
	my @ret = $c->model('DB::Item')->near($lat,$lon,0,{itemtype=>17});
	if(@ret) {
		my $station = shift(@ret);
		my $content = $cache->get($station->id);
		if(!$content) {
			my $response = $ua->get($station->url);
			if($response->is_success) {
				$content = $response->decoded_content;
				$cache->set($station->id,$content);
			}
		}
		if($content=~m,(<TABLE><CENTER>.*?</CENTER></TABLE>),is) {
			$content = $1;
		}
		$c->stash(
			station=>$station,
			content=>$content,
		);
	}	
} 

1;
