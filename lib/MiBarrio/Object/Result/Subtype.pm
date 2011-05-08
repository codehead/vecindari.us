package MiBarrio::Object::Result::Subtype;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';


=head1 NAME

MiBarrio::Object::Result::Subtype

=cut

__PACKAGE__->table("subtype");

=head1 ACCESSORS

=head2 id

  data_type: 'varchar'
  is_nullable: 0
  size: 45

=head2 es

  data_type: 'varchar'
  is_nullable: 1
  size: 100

=head2 ca

  data_type: 'varchar'
  is_nullable: 1
  size: 100

=head2 fr

  data_type: 'varchar'
  is_nullable: 1
  size: 100

=head2 en

  data_type: 'varchar'
  is_nullable: 1
  size: 100

=head2 parent

  data_type: 'varchar'
  is_nullable: 1
  size: 100

=head2 type

  data_type: 'integer'
  extra: {unsigned => 1}
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "id",
  { data_type => "varchar", is_nullable => 0, size => 45 },
  "es",
  { data_type => "varchar", is_nullable => 1, size => 100 },
  "ca",
  { data_type => "varchar", is_nullable => 1, size => 100 },
  "fr",
  { data_type => "varchar", is_nullable => 1, size => 100 },
  "en",
  { data_type => "varchar", is_nullable => 1, size => 100 },
  "parent",
  { data_type => "varchar", is_nullable => 1, size => 100 },
  "type",
  { data_type => "integer", extra => { unsigned => 1 }, is_nullable => 1 },
);
__PACKAGE__->set_primary_key("id");


# Created by DBIx::Class::Schema::Loader v0.07002 @ 2011-05-08 20:41:37
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:RIeWuwjGqvbSu5m5CFWR1w

__PACKAGE__->has_many(
	"subtype_items",
	"MiBarrio::Object::Result::ItemSubtype",
	{"foreign.subtype_id"=>"self.id"},
	{ cascade_copy => 0, cascade_delete => 0 },
);


# You can replace this text with custom content, and it will be preserved on regeneration
1;
