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
    dynamic_config => 0,
    'meta-spec'    => {version => 2},
    prereqs        => {runtime => {requires => {perl => '5.016'}}},
    resources      => {
      bugtracker => 'http://github.com/niczero/mojar-audio/issues',
      homepage   => 'http://niczero.github.io/mojar',
      license    => 'http://www.opensource.org/licenses/artistic-license-2.0',
      repository => 'http://github.com/niczero/mojar-audio',
    },
    no_index => {directory => [qw(test)]}
  },
  PREREQ_PM => {
    'Mojolicious' => 9.15,
    'Net::DBus'   => '1.2.0',
  },
  EXE_FILES => ['script/generate-dbus-methods'],
  test => {TESTS => 'test/*.t'}
);
