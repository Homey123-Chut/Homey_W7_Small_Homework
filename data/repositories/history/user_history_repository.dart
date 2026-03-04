abstract class UserHistoryRepository {

  List<String> getRecentSongIds();

  void addSongId(String songId);
}