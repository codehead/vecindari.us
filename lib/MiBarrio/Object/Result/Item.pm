package MiBarrio::Object::Result::Item;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';


=head1 NAME

MiBarrio::Object::Result::Item

=cut

__PACKAGE__->table("item");

=head1 ACCESSORS

=head2 itemtype

  data_type: 'integer'
  extra: {unsigned => 1}
  is_nullable: 0

=head2 subtype

  data_type: 'integer'
  extra: {unsigned => 1}
  is_nullable: 0

=head2 name

  data_type: 'varchar'
  is_nullable: 0
  size: 100

=head2 adapted

  data_type: 'tinyint'
  is_nullable: 1

=head2 district

  data_type: 'varchar'
  is_nullable: 1
  size: 100

=head2 neighborhood

  data_type: 'varchar'
  is_nullable: 1
  size: 100

=head2 zip

  data_type: 'varchar'
  is_nullable: 1
  size: 10

=head2 locality

  data_type: 'varchar'
  is_nullable: 1
  size: 50

=head2 region

  data_type: 'varchar'
  is_nullable: 1
  size: 50

=head2 latitude

  data_type: 'double precision'
  is_nullable: 1

=head2 schedule

  data_type: 'longtext'
  is_nullable: 1

=head2 id

  data_type: 'varchar'
  is_nullable: 0
  size: 45

=head2 longitude

  data_type: 'double precision'
  is_nullable: 1

=head2 url

  data_type: 'varchar'
  is_nullable: 1
  size: 150

=cut

__PACKAGE__->add_columns(
  "itemtype",
  { data_type => "integer", extra => { unsigned => 1 }, is_nullable => 0 },
  "subtype",
  { data_type => "integer", extra => { unsigned => 1 }, is_nullable => 0 },
  "name",
  { data_type => "varchar", is_nullable => 0, size => 100 },
  "adapted",
  { data_type => "tinyint", is_nullable => 1 },
  "district",
  { data_type => "varchar", is_nullable => 1, size => 100 },
  "neighborhood",
  { data_type => "varchar", is_nullable => 1, size => 100 },
  "zip",
  { data_type => "varchar", is_nullable => 1, size => 10 },
  "locality",
  { data_type => "varchar", is_nullable => 1, size => 50 },
  "region",
  { data_type => "varchar", is_nullable => 1, size => 50 },
  "latitude",
  { data_type => "double precision", is_nullable => 1 },
  "schedule",
  { data_type => "longtext", is_nullable => 1 },
  "id",
  { data_type => "varchar", is_nullable => 0, size => 45 },
  "longitude",
  { data_type => "double precision", is_nullable => 1 },
  "url",
  { data_type => "varchar", is_nullable => 1, size => 150 },
);
__PACKAGE__->set_primary_key("id", "itemtype");


# Created by DBIx::Class::Schema::Loader v0.07002 @ 2011-05-08 16:46:28
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:yPz3St3LhaS+ZNPUA0qgAg

__PACKAGE__->belongs_to(
  "type",
  "MiBarrio::Object::Result::Type",
  { "foreign.id" => "self.itemtype" },
  { is_deferrable => 1, on_delete => "CASCADE", on_update => "CASCADE" },
);

__PACKAGE__->has_many(
	"item_subtypes",
	"MiBarrio::Object::Result::ItemSubtype",
	{"foreign.item_id"=>"self.id"},
	{ cascade_copy => 0, cascade_delete => 0 },
);

__PACKAGE__->many_to_many(subtypes=>'item_subtypes','subtype');

sub near {
	my($self,$point,$radius,$cond);
	$cond||={};
	
}

# You can replace this text with custom content, and it will be preserved on regeneration
1;
