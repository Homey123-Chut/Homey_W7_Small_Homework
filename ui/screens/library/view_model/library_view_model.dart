import 'package:flutter/widgets.dart';
import 'package:practice/W7_small_Homework/model/songs/song.dart';
import 'package:practice/W7_small_Homework/ui/states/settings_state.dart';

import '../../../../data/repositories/songs/song_repository.dart';
import '../../../states/player_state.dart';

class LibraryViewModel extends ChangeNotifier {
   final SongRepository songRepository;
  final AppSettingsState settingsState;
  final PlayerState playerState;

  List<Song> _songs = [];
  List<Song> get songs => _songs;

  Song? get currentSong => playerState.currentSong;

  LibraryViewModel({
    required this.songRepository,
    required this.settingsState,
    required this.playerState,
  }) {
    init();
    playerState.addListener(_onPlayerStateChanged);
  }

    void init() {
    _songs = songRepository.fetchSongs();
    notifyListeners();
  }

  void _onPlayerStateChanged() {
    notifyListeners();
  }

  void playSong(Song song) {
    playerState.start(song);
  }

  void stopSong() {
    playerState.stop();
  }

  bool isPlaying(Song song) => currentSong == song;

  @override
  void dispose() {
    playerState.removeListener(_onPlayerStateChanged);
    super.dispose();
  }

}