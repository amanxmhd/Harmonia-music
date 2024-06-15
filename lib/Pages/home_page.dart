import 'package:flutter/material.dart';
import 'package:harmonia/Components/my_drawer.dart';
import 'package:harmonia/Models/playlist_provider.dart';
import 'package:harmonia/Pages/song_page.dart';
import 'package:provider/provider.dart';

import '../Models/song.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late PlaylistProvider playlistProvider;

  @override
  void initState() {
    super.initState();
    // Get playlist provider
    playlistProvider = Provider.of<PlaylistProvider>(context, listen: false);
  }

  void goToSong(int songIndex) {
    // Update current song index
    playlistProvider.currentSongIndex = songIndex;

    // Navigate to song page
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const SongPage()),
    );
  }

  Widget myDrawer() {
    return MyDrawer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        backgroundColor: Colors.brown.shade300,
        title: const Text("P L A Y L I S T"),
      ),
      drawer: myDrawer(),
      body: Consumer<PlaylistProvider>(
        builder: (context, value, child) {
          // Get the playlist
          final List<Song> playList = value.playlist;

          // Return list view UI
          return ListView.builder(
            itemCount: playList.length,
            itemBuilder: (context, index) {
              // Get individual song
              final Song song = playList[index];

              // Return list tile UI
              return ListTile(
                title: Text(song.songName),
                subtitle: Text(song.artistName),
                leading: Image.asset(song.albumArtImagePath),
                onTap: () => goToSong(index),
              );
            },
          );
        },
      ),
    );
  }
}
