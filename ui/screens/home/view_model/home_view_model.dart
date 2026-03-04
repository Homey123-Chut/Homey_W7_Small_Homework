import 'package:flutter/material.dart';
import 'package:practice/W7_small_Homework/data/repositories/history/user_history_repository.dart';
import 'package:practice/W7_small_Homework/data/repositories/songs/song_repository.dart';
import 'package:practice/W7_small_Homework/model/songs/song.dart';
import 'package:practice/W7_small_Homework/ui/states/player_state.dart';
import 'package:practice/W7_small_Homework/ui/states/settings_state.dart';

class HomeViewModel extends ChangeNotifier {
  final SongRepository songRepository;
  final UserHistoryRepository historyRepository;
  final PlayerState playerState;
  final AppSettingsState settingsState;

  List<Song> _allSongs = [];
  List<Song> get allSongs => _allSongs;

  List<Song> _recentSongs = [];
  List<Song> get recentSongs => _recentSongs;

  List<Song> _recommendedSongs = [];
  List<Song> get recommendedSongs => _recommendedSongs;

  Song? get currentSong => playerState.currentSong;

  HomeViewModel({
    required this.songRepository,
    required this.historyRepository,
    required this.playerState,
    required this.settingsState,
  }) {
    init();
    playerState.addListener(_onPlayerStateChanged);
  }

  void init() {
    _allSongs = songRepository.fetchSongs();

    final recentIds = historyRepository.getRecentSongIds();
    _recentSongs = _allSongs.where((s) => recentIds.contains(s.id)).toList();
    _recommendedSongs = _allSongs.where((s) => !recentIds.contains(s.id)).toList();

    notifyListeners();
  }

  void _onPlayerStateChanged() {
    notifyListeners();
  }

  void playSong(Song song) {
    playerState.start(song);
    historyRepository.addSongId(song.id);
    init();
  }

  void stopSong() {
    playerState.stop();
    notifyListeners();
  }

  bool isPlaying(Song song) => currentSong == song;

  @override
  void dispose() {
    playerState.removeListener(_onPlayerStateChanged);
    super.dispose();
  }
}