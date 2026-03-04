import 'package:flutter/material.dart';
import 'package:practice/W7_small_Homework/ui/screens/library/view_model/library_view_model.dart';
import 'package:practice/W7_small_Homework/ui/screens/library/widgets/library_content.dart';
import 'package:provider/provider.dart';
 
import '../../../data/repositories/songs/song_repository.dart';
import '../../states/player_state.dart';
import '../../states/settings_state.dart';

class LibraryScreen extends StatelessWidget {
  const LibraryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => LibraryViewModel(
        songRepository: context.read<SongRepository>(),
        settingsState: context.read<AppSettingsState>(),
        playerState: context.read<PlayerState>(),
      ),
      child: const LibraryContent(),
    );
  }
}

