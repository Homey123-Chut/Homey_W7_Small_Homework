import 'package:flutter/material.dart';
import 'package:practice/W7_small_Homework/ui/screens/home/widgets/home_content.dart';
import 'package:provider/provider.dart';
import 'view_model/home_view_model.dart';
import '../../../data/repositories/songs/song_repository.dart';
import '../../../data/repositories/history/user_history_repository.dart';
import '../../states/player_state.dart';
import '../../states/settings_state.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => HomeViewModel(
        songRepository: context.read<SongRepository>(),
        historyRepository: context.read<UserHistoryRepository>(),
        playerState: context.read<PlayerState>(),
        settingsState: context.read<AppSettingsState>(),
      ),
      
      child: const HomeContent(),
    );
  }
}