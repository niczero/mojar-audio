use Mojo::Base -strict;
use Test::More;

my $green_light = eval {
  use_ok 'Net::DBus';
  1;
};
SKIP: {
  skip 'Install libdbus-1-3 & libdbus-1-dev & Net::DBus to run these tests', 2
    unless $green_light;

  use_ok 'Mojar::Audacious';
  diag "Testing Mojar::Audacious $Mojar::Audacious::VERSION, Perl $], $^X";
}

done_testing;
