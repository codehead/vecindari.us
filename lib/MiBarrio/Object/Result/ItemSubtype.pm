package MiBarrio::Object::Result::ItemSubtype;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';


=head1 NAME

MiBarrio::Object::Result::ItemSubtype

=cut

__PACKAGE__->table("item_subtype");

=head1 ACCESSORS

=head2 item_id

  data_type: 'varchar'
  is_nullable: 0
  size: 45

=head2 subtype_id

  data_type: 'varchar'
  is_nullable: 0
  size: 45

=cut

__PACKAGE__->add_columns(
  "item_id",
  { data_type => "varchar", is_nullable => 0, size => 45 },
  "subtype_id",
  { data_type => "varchar", is_nullable => 0, size => 45 },
);
__PACKAGE__->set_primary_key("item_id", "subtype_id");


# Created by DBIx::Class::Schema::Loader v0.07002 @ 2011-05-08 20:41:37
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:47TTCM1Iy+GHKJ2nr4pAOw

__PACKAGE__->belongs_to(
  "item",
  "MiBarrio::Object::Result::Item",
  { "foreign.id" => "self.item_id" },
  { is_deferrable => 1, on_delete => "CASCADE", on_update => "CASCADE" },
);

__PACKAGE__->belongs_to(
  "subtype",
  "MiBarrio::Object::Result::Subtype",
  { "foreign.id" => "self.subtype_id" },
  { is_deferrable => 1, on_delete => "CASCADE", on_update => "CASCADE" },
);

# You can replace this text with custom content, and it will be preserved on regeneration
1;
