import 'package:flutter/widgets.dart';
import 'package:practice/W7_small_Homework/ui/states/settings_state.dart';

import '../../../../data/repositories/songs/song_repository.dart';
import '../../../states/player_state.dart';

class LibraryViewModel extends ChangeNotifier {
   final SongRepository songRepository;
  final AppSettingsState settingsState;
  final PlayerState playerState;

  LibraryViewModel({
    required this.songRepository,
    required this.settingsState,
    required this.playerState,
  });

}