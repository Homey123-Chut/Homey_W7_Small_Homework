import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:practice/W7_small_Homework/model/songs/song.dart';
import 'package:practice/W7_small_Homework/ui/screens/home/view_model/home_view_model.dart';

class HomeContent extends StatelessWidget {
  const HomeContent({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<HomeViewModel>();
    final settings = viewModel.settingsState;

    return Container(
      color: settings.theme.backgroundColor,
      padding: const EdgeInsets.all(16),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          
            const Text("Home"),
            const SizedBox(height: 16),

            const Text("Song 1"),
            const SizedBox(height: 8),

            const Text("Song 2"),
            const SizedBox(height: 8),

             const Text("Song 3"),
            const SizedBox(height: 8),

            Row(
              children: [
                ElevatedButton(
                  onPressed: () {
                    if (viewModel.currentSong != null) {
                      viewModel.stopSong();
                    } else if (viewModel.allSongs.isNotEmpty) {
                      viewModel.playSong(viewModel.allSongs[0]);
                    }
                  },
                  child: Text(viewModel.currentSong != null ? "STOP" : "PLAY"),
                ),
                const SizedBox(width: 16),
                if (viewModel.currentSong != null)
                  Text("Playing: ${viewModel.currentSong!.title}", style: const TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),

            const SizedBox(height: 24),

            // Recent songs
            const Text("Your Recent Songs"),
            const SizedBox(height: 8),
            for (var song in viewModel.recentSongs)
              SongTile(
                song: song,
                isPlaying: viewModel.isPlaying(song),
                onTap: () => viewModel.playSong(song),
              ),


            const SizedBox(height: 24),

            // Recommended songs
           const Text("You Might Also Like"),
            const SizedBox(height: 8),
            for (var song in viewModel.recommendedSongs)
              SongTile(
                song: song,
                isPlaying: viewModel.isPlaying(song),
                onTap: () => viewModel.playSong(song),
              ),
          ],
        ),
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
      title: Text(song.title),
      trailing: Text(
        isPlaying ? "Playing" : "",
        style: const TextStyle(color: Colors.amber),
      ),
      onTap: onTap,
    );
  }
}