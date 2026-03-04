import 'package:flutter/material.dart';
import 'package:practice/W7_small_Homework/data/repositories/songs/song_repository.dart';
import 'package:practice/W7_small_Homework/model/songs/song.dart';
import 'package:practice/W7_small_Homework/ui/states/player_state.dart';
import 'package:practice/W7_small_Homework/ui/states/settings_state.dart';
import 'package:practice/W7_small_Homework/ui/theme/theme.dart';
import 'package:provider/provider.dart';



class LibraryContent extends StatelessWidget {
  const LibraryContent({super.key});

  @override
  Widget build(BuildContext context) {
    // Read the settings state
    final settingsState = context.read<AppSettingsState>();
    // Watch the player state
    final playerState = context.watch<PlayerState>();
    // Read the song repository
    final songs = context.read<SongRepository>().fetchSongs();
    return Container(
       color: settingsState.theme.backgroundColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 16),
          Text("Library", style: AppTextStyles.heading),

          SizedBox(height: 50),

          Expanded(
            child: ListView.builder(
              itemCount: songs.length,
              itemBuilder: (context, index) => SongTile(
                song: songs[index],
                isPlaying: playerState.currentSong == songs[index],
                onTap: () {
                  playerState.start(songs[index]);
                },
              ),
            ),
          ),
        ],
      ),
    ); 
  }
}

class SongTile extends StatelessWidget {
  const SongTile({
    super.key,
    required this.song,
    required this.isPlaying,
    required this.onTap,
  });

  final Song song;
  final bool isPlaying;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      title: Text(song.title),
      trailing: Text(
        isPlaying ? "Playing" : "",
        style: TextStyle(color: Colors.amber),
      ),
    );
  }
}
