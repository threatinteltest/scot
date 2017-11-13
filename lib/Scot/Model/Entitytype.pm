package Scot::Model::Entitytype;

use lib '../../../lib';
use Moose;
use namespace::autoclean;

=head1 Name

Scot::Model::Entity

=head1 Description

Entitytype tracks the user defined entity types
in the future we may store data about entity types
in here too

=cut

extends 'Scot::Model';
with    qw(
    Meerkat::Role::Document
    Scot::Role::Entriable
    Scot::Role::Hashable
    Scot::Role::Times
);

=head1 Attributes

=over 4


=item B<type>

The name of the EntityType, e.g. "ipaddr", "threat_group", etc.

=cut

has type  => (
    is          => 'ro',
    isa         => 'Str',
    required    => 1,
    default     => '',
);

=item B<status>

valid statuses = active | disabled

=cut

has status  => (
    is          => 'ro',
    isa         => 'Str',
    required    => 1,
    default     => 'active',
);

=item B<order>

help us sort the order to look for entity types

=cut

has order   => (
    is          => 'ro',
    isa         => 'Int',
    required    => 1,
    default     => 100,
);

=item B<match>

The regular expression text to match an entity

=cut

has match   => (
    is          => 'ro',
    isa         => 'Str',
    required    => 1,
);

=item B<options>

options to pass to SCOT's entity extractor
typically { multiword => yes|no }

=cut

has options => (
    is          => 'ro',
    isa         => 'Hashref',
    required    => 1,
    default     => sub { { multiword => "no" } },
);

=item B<data>

hold data in a key value store about the entity type.
ideas for this include cached counts

=cut

has data    => (
    is      => 'ro',
    isa     => 'HashRef',
    traits  => [ 'Hash' ],
    required    => 1,
    default => sub {{}},
);

__PACKAGE__->meta->make_immutable;
1;

=back

=head1 Copyright

Copyright (c) 2017 Sandia National Laboratories.

=head1 Author

Todd Bruner.  

=cut
