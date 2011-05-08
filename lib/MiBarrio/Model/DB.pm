package MiBarrio::Model::DB;
use Moose;
use namespace::autoclean;

extends 'Catalyst::Model::DBIC::Schema';

# You must override these parameters in mibarrio_local.conf

__PACKAGE__->config(
    schema_class => 'MiBarrio::Object',
    connect_info => {
        dsn => 'dbi:mysql:mibarrio',
        user => 'username',
        password => 'password',
        {
                mysql_enable_utf8 => 1,
        },
    }
);

=head1 NAME

MiBarrio::Model::DB - Catalyst Model

=head1 DESCRIPTION

Catalyst Model.

=head1 AUTHOR

arturo

=head1 LICENSE

This library is free software. You can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

__PACKAGE__->meta->make_immutable;

1;
