use Mojo::Base -strict;
use Test::More;
use Test::Mojo;

my $audacious;

use_ok 'Mojar::Audacious';
diag "Testing Mojar::Audacious $Mojar::Audacious::VERSION, Perl $], $^X";

subtest plugin => sub {
  my $t = Test::Mojo->new('Mojo::HelloWorld');
  ok $t->app->plugin('Audacious'), 'loaded plugin';

  ok $audacious = $t->app->audacious, 'shared audacious object';
  ok $audacious->sleep(0.001), 'slept briefly';
};

subtest signature => sub {
  no strict 'refs';
  my %sig = %{'Mojar::Audacious::'};
  ok $audacious->can('status'), 'has method: status';
  ok $audacious->can('play_active_playlist'), 'has method: play_active_playlist'
    or diag join "\n", sort keys %sig;
};

SKIP: {
  skip 'Start up Audacious to run these tests', 2
    unless eval { $audacious->dbus->Status };

  subtest getters => sub {
    ok defined($audacious->auto_advance), 'called auto_advance';
    ok defined($audacious->balance), 'called balance';
    ok defined($audacious->config_get('Abc', 'Xyz')), 'called config_get';
    ok defined($audacious->get_active_playlist), 'called get_active_playlist';
    ok defined($audacious->get_active_playlist_name), 'called get_active_playlist_name';
    ok defined($audacious->get_eq), 'called get_eq';
    ok defined($audacious->get_eq_preamp), 'called get_eq_preamp';
    ok defined($audacious->get_info), 'called get_info';
    ok defined($audacious->get_playqueue_length), 'called get_playqueue_length';
    ok defined($audacious->get_tuple_fields), 'called get_tuple_fields';
    ok defined($audacious->info), 'called info';
    ok defined($audacious->length), 'called length';
    ok defined($audacious->main_win_visible), 'called main_win_visible';
    ok defined($audacious->number_of_playlists), 'called number_of_playlists';
    ok defined($audacious->paused), 'called paused';
    ok defined($audacious->playing), 'called playing';
    ok defined($audacious->playqueue_is_queued(1)), 'called playqueue_is_queued';
#    ok defined($audacious->plugin_is_enabled('SomePlugin')), 'called plugin_is_enabled';
    ok defined($audacious->position), 'called position';
    ok defined($audacious->recording), 'called recording';
    ok defined($audacious->repeat), 'called repeat';
    ok defined($audacious->shuffle), 'called shuffle';
    ok defined($audacious->song_filename(1)), 'called song_filename';
    ok defined($audacious->song_length(1)), 'called song_length';
    ok defined($audacious->song_title(1)), 'called song_title';
    ok defined($audacious->status), 'called status';
    ok defined($audacious->stop_after), 'called stop_after';
    ok defined($audacious->stopped), 'called stopped';
    ok defined($audacious->time), 'called time';
    ok defined($audacious->version), 'called version';
    ok defined($audacious->volume), 'called volume';
  };

  subtest actions => sub {
    ok $audacious->show_about_box(1), 'called show_about_box';
    ok $audacious->sleep(1)->show_filebrowser(1), 'called show_filebrowser';
    ok $audacious->sleep(1)->show_jtf_box(1), 'called show_jtf_box';
    ok $audacious->sleep(1)->show_main_win(1), 'called show_main_win';
    ok $audacious->sleep(1)->show_prefs_box(1), 'called show_prefs_box';
  };

}

done_testing;
