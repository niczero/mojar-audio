package Mojar::Audacious;
use Mojo::Base -base;

our $VERSION = 0.201;

use Carp qw(croak);
use Net::DBus ();

has dbus => sub {
  $ENV{DISPLAY} = ':0';
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

# Begin generated

sub version {
  my $self = shift;
  $self->dbus->Version(@_);
}

sub plugin_is_enabled {
  my $self = shift;
  $self->dbus->PluginIsEnabled(@_);
}

sub plugin_enable {
  my $self = shift;
  $self->dbus->PluginEnable(@_);
  $self;
}

sub config_get {
  my $self = shift;
  $self->dbus->ConfigGet(@_);
}

sub config_set {
  my $self = shift;
  $self->dbus->ConfigSet(@_);
  $self;
}

sub quit {
  my $self = shift;
  $self->dbus->Quit(@_);
  $self;
}

sub eject {
  my $self = shift;
  $self->dbus->Eject(@_);
  $self;
}

sub main_win_visible {
  my $self = shift;
  $self->dbus->MainWinVisible(@_);
}

sub show_main_win {
  my $self = shift;
  $self->dbus->ShowMainWin(@_);
  $self;
}

sub startup_notify {
  my $self = shift;
  $self->dbus->StartupNotify(@_);
  $self;
}

sub get_tuple_fields {
  my $self = shift;
  $self->dbus->GetTupleFields(@_);
}

sub play {
  my $self = shift;
  $self->dbus->Play(@_);
  $self;
}

sub pause {
  my $self = shift;
  $self->dbus->Pause(@_);
  $self;
}

sub play_pause {
  my $self = shift;
  $self->dbus->PlayPause(@_);
  $self;
}

sub stop {
  my $self = shift;
  $self->dbus->Stop(@_);
  $self;
}

sub playing {
  my $self = shift;
  $self->dbus->Playing(@_);
}

sub paused {
  my $self = shift;
  $self->dbus->Paused(@_);
}

sub stopped {
  my $self = shift;
  $self->dbus->Stopped(@_);
}

sub status {
  my $self = shift;
  $self->dbus->Status(@_);
}

sub record {
  my $self = shift;
  $self->dbus->Record(@_);
  $self;
}

sub recording {
  my $self = shift;
  $self->dbus->Recording(@_);
}

sub info {
  my $self = shift;
  $self->dbus->Info(@_);
}

sub time {
  my $self = shift;
  $self->dbus->Time(@_);
}

sub seek {
  my $self = shift;
  $self->dbus->Seek(@_);
  $self;
}

sub volume {
  my $self = shift;
  $self->dbus->Volume(@_);
}

sub set_volume {
  my $self = shift;
  $self->dbus->SetVolume(@_);
  $self;
}

sub balance {
  my $self = shift;
  $self->dbus->Balance(@_);
}

sub position {
  my $self = shift;
  $self->dbus->Position(@_);
}

sub select_displayed_playlist {
  my $self = shift;
  $self->dbus->SelectDisplayedPlaylist(@_);
}

sub select_playing_playlist {
  my $self = shift;
  $self->dbus->SelectPlayingPlaylist(@_);
}

sub advance {
  my $self = shift;
  $self->dbus->Advance(@_);
  $self;
}

sub advance_album {
  my $self = shift;
  $self->dbus->AdvanceAlbum(@_);
  $self;
}

sub reverse {
  my $self = shift;
  $self->dbus->Reverse(@_);
  $self;
}

sub reverse_album {
  my $self = shift;
  $self->dbus->ReverseAlbum(@_);
  $self;
}

sub length {
  my $self = shift;
  $self->dbus->Length(@_);
}

sub song_title {
  my $self = shift;
  $self->dbus->SongTitle(@_);
}

sub song_filename {
  my $self = shift;
  $self->dbus->SongFilename(@_);
}

sub song_length {
  my $self = shift;
  $self->dbus->SongLength(@_);
}

sub song_frames {
  my $self = shift;
  $self->dbus->SongFrames(@_);
}

sub song_tuple {
  my $self = shift;
  $self->dbus->SongTuple(@_);
}

sub jump {
  my $self = shift;
  $self->dbus->Jump(@_);
  $self;
}

sub add {
  my $self = shift;
  $self->dbus->Add(@_);
  $self;
}

sub add_url {
  my $self = shift;
  $self->dbus->AddUrl(@_);
  $self;
}

sub add_list {
  my $self = shift;
  $self->dbus->AddList(@_);
  $self;
}

sub open_list {
  my $self = shift;
  $self->dbus->OpenList(@_);
  $self;
}

sub open_list_to_temp {
  my $self = shift;
  $self->dbus->OpenListToTemp(@_);
  $self;
}

sub delete {
  my $self = shift;
  $self->dbus->Delete(@_);
  $self;
}

sub clear {
  my $self = shift;
  $self->dbus->Clear(@_);
  $self;
}

sub auto_advance {
  my $self = shift;
  $self->dbus->AutoAdvance(@_);
}

sub toggle_auto_advance {
  my $self = shift;
  $self->dbus->ToggleAutoAdvance(@_);
  $self;
}

sub repeat {
  my $self = shift;
  $self->dbus->Repeat(@_);
}

sub toggle_repeat {
  my $self = shift;
  $self->dbus->ToggleRepeat(@_);
  $self;
}

sub shuffle {
  my $self = shift;
  $self->dbus->Shuffle(@_);
}

sub toggle_shuffle {
  my $self = shift;
  $self->dbus->ToggleShuffle(@_);
  $self;
}

sub stop_after {
  my $self = shift;
  $self->dbus->StopAfter(@_);
}

sub toggle_stop_after {
  my $self = shift;
  $self->dbus->ToggleStopAfter(@_);
  $self;
}

sub show_prefs_box {
  my $self = shift;
  $self->dbus->ShowPrefsBox(@_);
  $self;
}

sub show_about_box {
  my $self = shift;
  $self->dbus->ShowAboutBox(@_);
  $self;
}

sub show_jtf_box {
  my $self = shift;
  $self->dbus->ShowJtfBox(@_);
  $self;
}

sub show_filebrowser {
  my $self = shift;
  $self->dbus->ShowFilebrowser(@_);
  $self;
}

sub queue_get_list_pos {
  my $self = shift;
  $self->dbus->QueueGetListPos(@_);
}

sub queue_get_queue_pos {
  my $self = shift;
  $self->dbus->QueueGetQueuePos(@_);
}

sub get_info {
  my $self = shift;
  $self->dbus->GetInfo(@_);
}

sub get_playqueue_length {
  my $self = shift;
  $self->dbus->GetPlayqueueLength(@_);
}

sub playlist_ins_url_string {
  my $self = shift;
  $self->dbus->PlaylistInsUrlString(@_);
  $self;
}

sub playlist_add {
  my $self = shift;
  $self->dbus->PlaylistAdd(@_);
  $self;
}

sub playqueue_add {
  my $self = shift;
  $self->dbus->PlayqueueAdd(@_);
  $self;
}

sub playqueue_remove {
  my $self = shift;
  $self->dbus->PlayqueueRemove(@_);
  $self;
}

sub playqueue_clear {
  my $self = shift;
  $self->dbus->PlayqueueClear(@_);
  $self;
}

sub playqueue_is_queued {
  my $self = shift;
  $self->dbus->PlayqueueIsQueued(@_);
}

sub playlist_enqueue_to_temp {
  my $self = shift;
  $self->dbus->PlaylistEnqueueToTemp(@_);
  $self;
}

sub get_eq {
  my $self = shift;
  $self->dbus->GetEq(@_);
}

sub get_eq_preamp {
  my $self = shift;
  $self->dbus->GetEqPreamp(@_);
}

sub get_eq_band {
  my $self = shift;
  $self->dbus->GetEqBand(@_);
}

sub set_eq {
  my $self = shift;
  $self->dbus->SetEq(@_);
  $self;
}

sub set_eq_preamp {
  my $self = shift;
  $self->dbus->SetEqPreamp(@_);
  $self;
}

sub set_eq_band {
  my $self = shift;
  $self->dbus->SetEqBand(@_);
  $self;
}

sub equalizer_activate {
  my $self = shift;
  $self->dbus->EqualizerActivate(@_);
  $self;
}

sub number_of_playlists {
  my $self = shift;
  $self->dbus->NumberOfPlaylists(@_);
}

sub get_active_playlist {
  my $self = shift;
  $self->dbus->GetActivePlaylist(@_);
}

sub set_active_playlist {
  my $self = shift;
  $self->dbus->SetActivePlaylist(@_);
  $self;
}

sub get_active_playlist_name {
  my $self = shift;
  $self->dbus->GetActivePlaylistName(@_);
}

sub set_active_playlist_name {
  my $self = shift;
  $self->dbus->SetActivePlaylistName(@_);
  $self;
}

sub new_playlist {
  my $self = shift;
  $self->dbus->NewPlaylist(@_);
  $self;
}

sub delete_active_playlist {
  my $self = shift;
  $self->dbus->DeleteActivePlaylist(@_);
  $self;
}

sub play_active_playlist {
  my $self = shift;
  $self->dbus->PlayActivePlaylist(@_);
  $self;
}

# End generated

sub find_in_playlist {
  my ($self, $uri) = @_;

  my $i = 0;
  my $length = $self->length;
  while ($i < $length and $self->song_filename($i) ne $uri) {
    ++$i;
  }
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
