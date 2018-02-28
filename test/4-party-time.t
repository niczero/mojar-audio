use Mojo::Base -strict;
use Test::More;

use_ok 'Mojar::Audacious';
ok my $audacious = Mojar::Audacious->new, 'got an Audacious';

SKIP: {
  skip 'set RELEASE to enable this test (developer only!)', 1
    unless $ENV{RELEASE};

  subtest party => sub {
    my $status = $audacious->status;
    if ($status eq 'playing') {
      ok $audacious->pause
        ->sleep(0.5)
        ->play,
        'pause...play';
    }
    elsif ($status eq 'stopped') {
      ok $audacious->play
        ->sleep(0.5)
        ->stop,
        'play...stop';
    }
    elsif ($status eq 'paused') {
      ok $audacious->pause
        ->sleep(0.5)
        ->pause,
        'pause...pause';
    }
    else {
      fail 'No status found';
    }
  };

}

done_testing;
