package MiBarrio::View::Mason;

use strict;
use warnings;

use parent 'Catalyst::View::Mason';

__PACKAGE__->config(
	use_match => 0,
	template_extension => '.html',
	escape_flags => {
		'h' => \&HTML::Mason::Escapes::basic_html_escape,
	},
);

=head1 NAME

MiBarrio::View::Mason - Mason View Component for MiBarrio

=head1 DESCRIPTION

Mason View Component for MiBarrio

=head1 SEE ALSO

L<MiBarrio>, L<HTML::Mason>

=head1 AUTHOR

arturo

=head1 LICENSE

This library is free software . You can redistribute it and/or modify it under
the same terms as perl itself.

=cut

1;
