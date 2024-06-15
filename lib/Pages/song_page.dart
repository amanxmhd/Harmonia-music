import 'package:flutter/material.dart';
import 'package:harmonia/Components/nue_box.dart';
import 'package:harmonia/Models/playlist_provider.dart';
import 'package:provider/provider.dart';

class SongPage extends StatefulWidget {

   const SongPage({super.key});

  @override
  State<SongPage> createState() => _SongPageState();
}

class _SongPageState extends State<SongPage> {
  int repeatMode = 0;

  String formatTime(Duration duration) {
    String twoDigitSeconds = duration.inSeconds.remainder(60).toString().padLeft(2, '0');
    String formattedTime = "${duration.inMinutes}:$twoDigitSeconds";
    return formattedTime;
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<PlaylistProvider>(
      builder: (context, value, child) {
        // Get the playlist
        final playlist = value.playlist;

        // Get the current song index
        final currentSong = playlist[value.currentSongIndex ?? 0];

        // Return the scaffold
        return Scaffold(
          backgroundColor: Theme.of(context).colorScheme.surface,
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  // App bar
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Back button
                      IconButton(
                        onPressed: () => Navigator.pop(context),
                        icon: const Icon(Icons.arrow_back),
                        iconSize: 30,
                        color: Colors.brown,
                      ),

                      // Title
                      const Text(
                        "H A R M O N I A",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      // Menu button
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.menu),
                        iconSize: 30,
                        color: Colors.brown,
                      ),
                    ],
                  ),

                  const SizedBox(height: 25),

                  // Album artwork
                  NueBox(
                    child: Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.asset(currentSong.albumArtImagePath),
                        ),
                        // Song and artist name and icon
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              // Song and artist name
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    currentSong.songName,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                    ),
                                  ),
                                  Text(
                                    currentSong.artistName,
                                    style: TextStyle(
                                      color: Colors.grey.shade900,
                                    ),
                                  ),
                                ],
                              ),

                              // Heart Icon
                              Icon(
                                Icons.favorite,
                                color: Colors.brown.shade400,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),

                  const SizedBox(height: 35),

                  // Song duration progress
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // Start time
                            Text(formatTime(value.currentDuration), style: const TextStyle(fontSize: 16)),

                            // Shuffle icon
                            IconButton(
                              onPressed: () {
                                // Implement shuffle functionality here
                              },
                              icon: const Icon(Icons.shuffle),
                              iconSize: 30,
                              color: Colors.brown,
                            ),

                            // Repeat icon
                            IconButton(
                              onPressed: () {
                                value.seek(Duration.zero); // Reset the current song to the beginning
                              },
                              icon: const Icon(Icons.repeat),
                              iconSize: 30,
                              color: Colors.brown,
                            ),

                            Text(formatTime(value.totalDuration), style: const TextStyle(fontSize: 16)),
                          ],
                        ),

                        // Song duration progress
                        SliderTheme(
                          data: SliderTheme.of(context).copyWith(
                            thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 8),
                          ),
                          child: Slider(
                            min: 0,
                            max: value.totalDuration.inSeconds.toDouble(),
                            value: value.currentDuration.inSeconds.toDouble(),
                            activeColor: Colors.brown.shade300,
                            onChanged: (newValue) {
                              value.seek(Duration(seconds: newValue.toInt()));
                            },
                            onChangeEnd: (newValue) {
                              value.seek(Duration(seconds: newValue.toInt()));
                            },
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 20),

                  // Playback controls
                  Row(
                    children: [
                      // Skip previous
                      Expanded(
                        child: GestureDetector(
                          onTap: value.playPrevious,
                          child: const NueBox(
                            child: Icon(Icons.skip_previous, size: 32),
                          ),
                        ),
                      ),

                      const SizedBox(width: 20),

                      // Play pause
                      Expanded(
                        flex: 2,
                        child: GestureDetector(
                          onTap: value.pauseOrResume,
                          child: NueBox(
                            child: Icon(value.isPlaying ? Icons.pause : Icons.play_arrow, size: 32),
                          ),
                        ),
                      ),

                      const SizedBox(width: 20),

                      // Skip Forward
                      Expanded(
                        child: GestureDetector(
                          onTap: value.playNextSong,
                          child: const NueBox(
                            child: Icon(Icons.skip_next, size: 32),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
