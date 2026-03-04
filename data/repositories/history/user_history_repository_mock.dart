import 'user_history_repository.dart';

class UserHistoryRepositoryMock implements UserHistoryRepository {
  final List<String> _history = [];

  @override
  List<String> getRecentSongIds() {
    return _history;
  }

  void addSongToHistory(String songId) {
    _history.add(songId);

    if (_history.length > 10) {
      _history.removeAt(0); 
    }
  }

  @override
  void addSongId(String songId) {
    addSongToHistory(songId);
  }
}