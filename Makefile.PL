use 5.010_001;
use strict;
use warnings;

use ExtUtils::MakeMaker;

WriteMakefile(
  NAME         => 'Mojar::Audio',
  VERSION_FROM => 'lib/Mojar/Audio.pm',
  ABSTRACT     => 'Audio tools for perl',
  AUTHOR       => 'Nic Sandfield <niczero@cpan.org>',
  LICENSE      => 'artistic_2',
  META_MERGE   => {
    requires  => {perl => 5.016_001},
    resources => {
      homepage   => 'http://niczero.github.io/mojar',
      license    => 'http://www.opensource.org/licenses/artistic-license-2.0',
      repository => 'http://github.com/niczero/mojar-audio',
      bugtracker => 'http://github.com/niczero/mojar-audio/issues'
    },
    no_index => {directory => [qw(test)]}
  },
  BUILD_REQUIRES => {'Test::More' => 0},
  CONFIGURE_REQUIRES => {'ExtUtils::MakeMaker' => 6.3},
  PREREQ_PM => {
    'Mojolicious' => 9.15,
    'Net::DBus' => '1.2.0'
  },
  EXE_FILES => [],
  test => {TESTS => 'test/*.t'}
);
