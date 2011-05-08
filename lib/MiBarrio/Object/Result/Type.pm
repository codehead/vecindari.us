package MiBarrio::Object::Result::Type;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';


=head1 NAME

MiBarrio::Object::Result::Type

=cut

__PACKAGE__->table("type");

=head1 ACCESSORS

=head2 id

  data_type: 'integer'
  extra: {unsigned => 1}
  is_nullable: 0

=head2 name

  data_type: 'varchar'
  is_nullable: 0
  size: 45

=cut

__PACKAGE__->add_columns(
  "id",
  { data_type => "integer", extra => { unsigned => 1 }, is_nullable => 0 },
  "name",
  { data_type => "varchar", is_nullable => 0, size => 45 },
);
__PACKAGE__->set_primary_key("id");


# Created by DBIx::Class::Schema::Loader v0.07002 @ 2011-05-08 16:46:28
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:33M4pnBhL3W6s/up7/nGSQ

__PACKAGE__->has_many(
	"items",
	"MiBarrio::Object::Result::Item",
	{"foreign.itemtype"=>"self.id"},
	{ cascade_copy => 0, cascade_delete => 0 },
);


# You can replace this text with custom content, and it will be preserved on regeneration
1;
