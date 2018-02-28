package Mojolicious::Plugin::Audacious;
use Mojolicious::Plugin -base;

our $VERSION = 0.301;

use Mojar::Audacious;

sub register {
  my ($self, $app, $config) = @_;
  my $name = $config->{name} // 'audacious';

  $app->helper($name => sub {
    my ($self) = @_;
    state $audacious = Mojar::Audacious->new;
    return $audacious;
  })
}

1;
__END__

=head1 NAME

Mojolicious::Plugin::Audacious - Control your Audacious audio player

=head1 SYNOPSIS

  # Mojolicious
  $self->plugin('Audacious');
  $self->audacious->...

  # Mojolicious::Lite
  plugin 'Audacious';
  app->audacious->...

  $status = $self->audacious->status;
  $self->audacious->new_play_list
    ->add($audio_file)
    ->play;

=head1 DESCRIPTION

Mojolicious::Plugin::Audacious is a L<Mojolicious> plugin to provide control of
an Audacious audio player directly from your app, from a controller, even from a
template if that's your choice.

=head1 COPYRIGHT AND LICENSE

Copyright 2018 Nic Sandfield

This program is free software, you can redistribute it and/or modify it under
the terms of the Artistic License version 2.0.

=head1 SEE ALSO

L<Mojar::Audacious>.
