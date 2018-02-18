package Mojar::Audacious;
use Mojo::Base -base;

our $VERSION = 0.301;

use Carp qw(croak);
use Net::DBus ();
use Sub::Util qw(set_subname);

has dbus => sub {
  $ENV{DISPLAY} ||= ':0';
  eval {
    Net::DBus->session
      ->get_service('org.atheme.audacious')
      ->get_object('/org/atheme/audacious', 'org.atheme.audacious');
  }
  or do {
    my $e = "Failed to access DBUS ($@)";
    $e .= ' Audacious not running.' if $e =~ /Error.ServiceUnknown/;
    croak $e;
  }
};

sub _add_method {
  my ($titlecase, $cb) = @_;
  my $snakecase = join '_', map lc($_), grep length($_), split /([A-Z][^A-Z]*)/, $titlecase;

  no strict 'refs';
  no warnings 'redefine';
  *{"__PACKAGE__::$snakecase"} = set_subname "__PACKAGE__::$snakecase", $cb;
}

# Getters
_add_method $_, sub { shift->dbus->$_(@_) } for qw(
  AutoAdvance
  Balance
  ConfigGet
  GetActivePlaylist
  GetActivePlaylistName
  GetEq
  GetEqBand
  GetEqPreamp
  GetInfo
  GetPlayqueueLength
  GetTupleFields
  Info
  Length
  MainWinVisible
  NumberOfPlaylists
  Paused
  Playing
  PluginIsEnabled
  Position
  QueueGetListPos
  QueueGetQueuePos
  Recording
  Repeat
  SelectDisplayedPlaylist
  SelectPlayingPlaylist
  Shuffle
  SongFilename
  SongFrames
  SongLength
  SongTitle
  SongTuple
  Status
  StopAfter
  Stopped
  Time
  Version
  Volume
);

# Setters and Others
_add_method $_, sub { my $self = shift; $self->dbus->$_(@_); $self } for qw(
  Add
  AddList
  AddUrl
  Advance
  AdvanceAlbum
  Clear
  ConfigSet
  Delete
  DeleteActivePlaylist
  Eject
  EqualizerActivate
  Jump
  NewPlaylist
  OpenList
  OpenListToTemp
  Pause
  Play
  PlayActivePlaylist
  PlaylistAdd
  PlaylistEnqueueToTemp
  PlaylistInsUrlString
  PlayPause
  PlayqueueAdd
  PlayqueueClear
  PlayqueueIsQueued
  PlayqueueRemove
  PluginEnable
  Quit
  Record
  Reverse
  ReverseAlbum
  Seek
  SetActivePlaylist
  SetActivePlaylistName
  SetEq
  SetEqBand
  SetEqPreamp
  SetVolume
  ShowAboutBox
  ShowFilebrowser
  ShowJtfBox
  ShowMainWin
  ShowPrefsBox
  StartupNotify
  Stop
  ToggleAutoAdvance
  ToggleRepeat
  ToggleShuffle
  ToggleStopAfter
);

sub find_in_playlist {
  my ($self, $uri) = @_;

  my $i = 0;
  my $length = $self->length;
  ++$i while $i < $length and $self->song_filename($i) ne $uri;
  return $i < $length ? $i : undef;
}

1;
__DATA__
@@ aud-dbus.xml
<?xml version="1.0" encoding="utf-8"?>

<!--
 * aud-dbus.xml
 * Copyright 2007-2016 Ben Tucker, Yoshiki Yazawa, Matti Hämäläinen, and
 *                     John Lindgren
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions are met:
 *
 * 1. Redistributions of source code must retain the above copyright notice,
 *    this list of conditions, and the following disclaimer.
 *
 * 2. Redistributions in binary form must reproduce the above copyright notice,
 *    this list of conditions, and the following disclaimer in the documentation
 *    provided with the distribution.
 *
 * This software is provided "as is" and without any warranty, express or
 * implied. In no event shall the authors be liable for any damages arising from
 * the use of this software.
 -->

<node name="/">
  <interface name="org.atheme.audacious">
    <!-- General Commands -->
    <!-- ++++++++++++++++ -->
    <!-- Audacious version -->
    <method name="Version">
      <arg type="s" direction="out" name="version" />
    </method>

    <method name="PluginIsEnabled">
      <arg type="s" direction="in" name="plugin" />
      <arg type="b" direction="out" name="enabled" />
    </method>

    <method name="PluginEnable">
      <arg type="s" direction="in" name="plugin" />
      <arg type="b" direction="in" name="enable" />
    </method>

    <method name="ConfigGet">
      <arg type="s" direction="in" name="section" />
      <arg type="s" direction="in" name="name" />
      <arg type="s" direction="out" name="value" />
    </method>

    <method name="ConfigSet">
      <arg type="s" direction="in" name="section" />
      <arg type="s" direction="in" name="name" />
      <arg type="s" direction="in" name="value" />
    </method>

    <!-- Quit Audacious -->
    <method name="Quit" />

    <!-- Show "Add Files" dialog -->
    <method name="ShowFilebrowser">
      <arg type="b" direction="in" name="show" />
    </method>

    <!-- Show "Open Files" dialog -->
    <!-- (same as "eject" button in a Winamp skin) -->
    <method name="Eject" />

    <!-- Main window visibility -->
    <method name="MainWinVisible">
      <arg type="b" direction="out" name="is_main_win" />
    </method>

    <!-- Toggle main window visibility -->
    <method name="ShowMainWin">
      <arg type="b" direction="in" name="show" />
    </method>

    <!-- Show preferences window -->
    <method name="ShowPrefsBox">
      <arg type="b" direction="in" name="show" />
    </method>

    <!-- Show about window -->
    <method name="ShowAboutBox">
      <arg type="b" direction="in" name="show" />
    </method>

    <!-- Show jump to file window -->
    <method name="ShowJtfBox">
      <arg type="b" direction="in" name="show" />
    </method>

    <!-- Send startup notification -->
    <method name="StartupNotify">
      <arg type="s" direction="in" name="id" />
    </method>

    <!-- Get names of available 'standard' tuple fields -->
    <method name="GetTupleFields">
      <!-- Return array of tuple field names -->
      <arg type="as" direction="out" name="fields" />
    </method>

    <!-- Playback Information/Manipulation -->
    <!-- +++++++++++++++++++++++++++++++++ -->
    <!-- Begin or resume playback -->
    <method name="Play" />

    <!-- Pause playback -->
    <method name="Pause" />

    <!-- Either play or pause -->
    <method name="PlayPause" />

    <!-- Stop playback -->
    <method name="Stop" />

    <!-- Is playback playing? -->
    <method name="Playing">
      <!-- Return true if playing, false otherwise -->
      <arg type="b" direction="out" name="is_playing" />
    </method>

    <!-- Is playback paused? -->
    <method name="Paused">
      <!-- Return true if paused, false otherwise -->
      <arg type="b" direction="out" name="is_paused" />
    </method>

    <!-- Is playback stopped? -->
    <method name="Stopped">
      <!-- Return true if stopped, false otherwise -->
      <arg type="b" direction="out" name="is_stopped" />
    </method>

    <!-- What is the playback status? -->
    <method name="Status">
      <!-- Return the status as a string: -->
      <!-- one of {"playing" "paused" "stopped"} -->
      <arg type="s" direction="out" name="status" />
    </method>

    <!-- Toggle recording of stream -->
    <method name="Record" />

    <!-- Is stream recording enabled? -->
    <method name="Recording">
      <arg type="b" direction="out" name="is_recording" />
    </method>

    <!-- What is the bitrate, frequency, and number of channels of the -->
    <!-- current audio format?  ("Info" and "GetInfo" are synonymous) -->
    <method name="Info">
      <arg type="i" direction="out" name="rate" />
      <arg type="i" direction="out" name="freq" />
      <arg type="i" direction="out" name="nch" />
    </method>

    <method name="GetInfo">
      <arg type="i" direction="out" name="rate" />
      <arg type="i" direction="out" name="freq" />
      <arg type="i" direction="out" name="nch" />
    </method>

    <!-- What is the current output position? -->
    <method name="Time">
      <!-- Position of song, in ms -->
      <arg type="u" direction="out" name="time" />
    </method>

    <!-- Seek to some absolute position in the current song -->
    <method name="Seek">
      <!-- Position of song, in ms, to seek to -->
      <arg type="u" direction="in" name="pos" />
    </method>

    <!-- Volume and Equalizer -->
    <!-- ++++++++++++++++++++ -->
    <!-- What is the playback volume? -->
    <method name="Volume">
      <!-- Volume of the left channel -->
      <arg type="i" direction="out" name="vl" />
      <!-- Volume of the right channel -->
      <arg type="i" direction="out" name="vr" />
    </method>

    <!-- Set the playback volume -->
    <method name="SetVolume">
      <!-- Volume of the left channel -->
      <arg type="i" direction="in" name="vl" />
      <!-- Volume of the right channel -->
      <arg type="i" direction="in" name="vr" />
    </method>

    <!-- Get the playback balance -->
    <method name="Balance">
      <!-- Balance between left and right channels -->
      <arg type="i" direction="out" name="balance" />
    </method>

    <!-- equalizer -->
    <method name="GetEq">
      <arg type="d" direction="out" name="preamp" />
      <arg type="ad" direction="out" name="bands" />
    </method>

    <method name="GetEqPreamp">
      <arg type="d" direction="out" name="preamp" />
    </method>

    <method name="GetEqBand">
      <arg type="i" direction="in" name="band" />
      <arg type="d" direction="out" name="value" />
    </method>

    <method name="SetEq">
      <arg type="d" direction="in" name="preamp" />
      <arg type="ad" direction="in" name="bands" />
    </method>

    <method name="SetEqPreamp">
      <arg type="d" direction="in" name="preamp" />
    </method>

    <method name="SetEqBand">
      <arg type="i" direction="in" name="band" />
      <arg type="d" direction="in" name="value" />
    </method>

    <!-- Activate/Deactivate Equalizer -->
    <method name="EqualizerActivate">
      <arg type="b" direction="in" name="active" />
    </method>

    <!-- Playlist Information/Manipulation -->
    <!-- +++++++++++++++++++++++++++++++++ -->
    <!-- Select playlist to control -->
    <method name="SelectDisplayedPlaylist" />

    <method name="SelectPlayingPlaylist" />

    <!-- Playlist position -->
    <method name="Position">
      <!-- Return position of current song in current playlist -->
      <arg type="u" direction="out" name="pos" />
    </method>

    <!-- Skip ahead one song in the current playlist -->
    <method name="Advance" />

    <!-- Skip ahead one album in the current playlist -->
    <method name="AdvanceAlbum" />

    <!-- Skip backwards one song in the current playlist -->
    <method name="Reverse" />

    <!-- Skip backwards one album in the current playlist -->
    <method name="ReverseAlbum" />

    <!-- Playlist length -->
    <method name="Length">
      <!-- Return length of current playlist -->
      <arg type="i" direction="out" name="length" />
    </method>

    <!-- Get a song's title -->
    <method name="SongTitle">
      <!-- Song position in the playlist -->
      <arg type="u" direction="in" name="pos" />
      <!-- Return title of desired song -->
      <arg type="s" direction="out" name="title" />
    </method>

    <!-- Get a song's filename -->
    <method name="SongFilename">
      <!-- Song position in the playlist -->
      <arg type="u" direction="in" name="pos" />
      <!-- Return filename of desired song -->
      <arg type="s" direction="out" name="filename" />
    </method>

    <!-- Get the length of some song, in seconds -->
    <method name="SongLength">
      <!-- Song position in the playlist -->
      <arg type="u" direction="in" name="pos" />
      <!-- Return length, in seconds, of desired song -->
      <arg type="i" direction="out" name="length" />
    </method>

    <!-- Get the length of some song, in frames -->
    <method name="SongFrames">
      <!-- Song position in the playlist -->
      <arg type="u" direction="in" name="pos" />
      <!-- Return length, in frames, of desired song -->
      <arg type="i" direction="out" name="length" />
    </method>

    <!-- Get the value of a tuple field of some song -->
    <method name="SongTuple">
      <!-- Song position in the playlist -->
      <arg type="u" direction="in" name="pos" />
      <!-- Tuple name -->
      <arg type="s" direction="in" name="tuple" />
      <!-- Return tuple value -->
      <arg type="v" direction="out" name="value" />
    </method>

    <!-- Jump to some position in the playlist -->
    <method name="Jump">
      <!-- Song position to jump to -->
      <arg type="u" direction="in" name="pos" />
    </method>

    <!-- Add (append) a file to the current playlist -->
    <!-- ("Add", "AddUrl", and "PlaylistAdd" are synonymous) -->
    <method name="Add">
      <!-- URI of file to add -->
      <arg type="s" direction="in" name="file" />
    </method>

    <method name="AddUrl">
      <arg type="s" direction="in" name="url" />
    </method>

    <method name="PlaylistAdd">
      <arg type="s" direction="in" name="list" />
    </method>

    <!-- Insert a file at the given position in the playlist -->
    <method name="PlaylistInsUrlString">
      <arg type="s" direction="in" name="url" />
      <arg type="i" direction="in" name="pos" />
    </method>

    <!-- Add a list of files -->
    <method name="AddList">
      <!-- Array of filenames to add -->
      <arg type="as" direction="in" name="filenames" />
    </method>

    <!-- Open a list of files -->
    <method name="OpenList">
      <!-- Array of filenames to open -->
      <arg type="as" direction="in" name="filenames" />
    </method>

    <!-- Open a file in a temporary playlist -->
    <method name="PlaylistEnqueueToTemp">
      <arg type="s" direction="in" name="url" />
    </method>

    <!-- Open a list of files in a temporary playlist -->
    <method name="OpenListToTemp">
      <!-- Array of filenames to open -->
      <arg type="as" direction="in" name="filenames" />
    </method>

    <!-- Delete some song from the playlist -->
    <method name="Delete">
      <!-- Position of song to delete -->
      <arg type="u" direction="in" name="pos" />
    </method>

    <!-- Clear the playlist -->
    <method name="Clear" />

    <!-- Query auto-advance status -->
    <method name="AutoAdvance">
      <arg type="b" direction="out" name="is_advance" />
    </method>

    <!-- Toggle auto-advance -->
    <method name="ToggleAutoAdvance" />

    <!-- Query repeat status -->
    <method name="Repeat">
      <arg type="b" direction="out" name="is_repeat" />
    </method>

    <!-- Toggle repeat -->
    <method name="ToggleRepeat" />

    <!-- Query shuffle status -->
    <method name="Shuffle">
      <arg type="b" direction="out" name="is_shuffle" />
    </method>

    <!-- Toggle shuffle -->
    <method name="ToggleShuffle" />

    <!-- Query stop-after-song status -->
    <method name="StopAfter">
      <arg type="b" direction="out" name="is_stopping" />
    </method>

    <!-- Toggle stop-after-song -->
    <method name="ToggleStopAfter" />

    <!-- Playlist Queue -->
    <!-- ++++++++++++++ -->
    <!-- Playqueue get playlist pos -->
    <method name="QueueGetListPos">
      <arg type="u" direction="in" name="qpos" />
      <arg type="u" direction="out" name="pos" />
    </method>

    <!-- Playqueue get playqueue pos -->
    <method name="QueueGetQueuePos">
      <arg type="u" direction="in" name="pos" />
      <arg type="u" direction="out" name="qpos" />
    </method>

    <method name="GetPlayqueueLength">
      <arg type="i" direction="out" name="length" />
    </method>

    <method name="PlayqueueAdd">
      <arg type="i" direction="in" name="pos" />
    </method>

    <method name="PlayqueueRemove">
      <arg type="i" direction="in" name="pos" />
    </method>

    <method name="PlayqueueClear" />

    <method name="PlayqueueIsQueued">
      <arg type="i" direction="in" name="pos" />
      <arg type="b" direction="out" name="is_queued" />
    </method>

    <!-- Add/Remove/Switch Playlists -->
    <!-- +++++++++++++++++++++++++++ -->
    <method name="NumberOfPlaylists">
      <arg type="i" direction="out" name="count" />
    </method>

    <method name="GetActivePlaylist">
      <arg type="i" direction="out" name="plnum" />
    </method>

    <method name="SetActivePlaylist">
      <arg type="i" direction="in" name="plnum" />
    </method>

    <method name="GetActivePlaylistName">
      <arg type="s" direction="out" name="plname" />
    </method>

    <method name="SetActivePlaylistName">
      <arg type="s" direction="in" name="plname" />
    </method>

    <method name="NewPlaylist" />

    <method name="DeleteActivePlaylist" />

    <method name="PlayActivePlaylist" />
  </interface>
</node>
__END__

=head1 GETTER METHODS

=head2 auto_advance

=head2 balance

=head2 config_get

=head2 get_active_playlist

=head2 get_active_playlist_name

=head2 get_eq

=head2 get_eq_band

=head2 get_eq_preamp

=head2 get_info

=head2 get_playqueue_length

=head2 get_tuple_fields

=head2 info

=head2 length

=head2 main_win_visible

=head2 number_of_playlists

=head2 paused

=head2 playing

=head2 plugin_is_enabled

=head2 position

=head2 queue_get_list_pos

=head2 queue_get_queue_pos

=head2 recording

=head2 repeat

=head2 select_displayed_playlist

=head2 select_playing_playlist

=head2 shuffle

=head2 song_filename

=head2 song_frames

=head2 song_length

=head2 song_title

=head2 song_tuple

=head2 status

=head2 stop_after

=head2 stopped

=head2 time

=head2 version

=head2 volume

=head1 SETTER METHODS

=head2 add

=head2 add_list

=head2 add_url

=head2 advance

=head2 advance_album

=head2 clear

=head2 config_set

=head2 delete

=head2 delete_active_playlist

=head2 eject

=head2 equalizer_activate

=head2 jump

=head2 new_playlist

=head2 open_list

=head2 open_list_to_temp

=head2 pause

=head2 play

=head2 play_active_playlist

=head2 playlist_add

=head2 playlist_enqueue_to_temp

=head2 playlist_ins_url_string

=head2 play_pause

=head2 playqueue_add

=head2 playqueue_clear

=head2 playqueue_is_queued

=head2 playqueue_remove

=head2 plugin_enable

=head2 quit

=head2 record

=head2 reverse

=head2 reverse_album

=head2 seek

=head2 set_active_playlist

=head2 set_active_playlist_name

=head2 set_eq

=head2 set_eq_band

=head2 set_eq_preamp

=head2 set_volume

=head2 show_about_box

=head2 show_filebrowser

=head2 show_jtf_box

=head2 show_main_win

=head2 show_prefs_box

=head2 startup_notify

=head2 stop

=head2 toggle_auto_advance

=head2 toggle_repeat

=head2 toggle_shuffle

=head2 toggle_stop_after

