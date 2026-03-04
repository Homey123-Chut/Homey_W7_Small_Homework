import 'package:flutter/material.dart';
import 'package:practice/W7_small_Homework/model/songs/song.dart';
import 'package:practice/W7_small_Homework/ui/screens/library/view_model/library_view_model.dart';
import 'package:practice/W7_small_Homework/ui/theme/theme.dart';
import 'package:provider/provider.dart';



class LibraryContent extends StatelessWidget {
  const LibraryContent({super.key});

  @override
  Widget build(BuildContext context) {

    final viewModel = context.watch<LibraryViewModel>();
    final settings = viewModel.settingsState;

    return Container(
       color: settings.theme.backgroundColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 16),
          Text("Library", style: AppTextStyles.heading),

          SizedBox(height: 50),

          Expanded(
            child: ListView.builder(
              itemCount: viewModel.songs.length,
              itemBuilder: (context, index) => SongTile(
                song: viewModel.songs[index],
                isPlaying: viewModel.isPlaying(viewModel.songs[index]),
                onTap: () {
                  viewModel.playSong(viewModel.songs[index]);
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
