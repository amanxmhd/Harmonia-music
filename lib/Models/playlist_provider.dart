import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:harmonia/Models/song.dart';

class PlaylistProvider extends ChangeNotifier {
  // Playlist of Songs
  final List<Song> _playlist = [
    // song 1
    Song(
      songName: 'Fireflies',
      artistName: 'OWL CITY',
      albumArtImagePath: "assets/images/song11.jpg",
      audioPath: "audio/fireflies.mp3",
    ),

    // song 2
    Song(
      songName: 'Atlantis',
      artistName: 'SEAFRET',
      albumArtImagePath: "assets/images/song4.jpg",
      audioPath: "audio/atlantis.mp3",
    ),

    Song(
      songName: 'Hadal Ahbek',
      artistName: 'Issam Alnajjar',
      albumArtImagePath: "assets/images/song30.jpg",
      audioPath: "audio/hadalahbek.mp3",
    ),
    // song 3
    Song(
      songName: 'Good Things Fall Apart',
      artistName: 'ILLENIUM',
      albumArtImagePath: "assets/images/song2.jpg",
      audioPath: "audio/illenium.mp3",
    ),

    // song 4
    Song(
      songName: 'Siyah',
      artistName: 'ABDUL HANNAN',
      albumArtImagePath: "assets/images/song8.webp",
      audioPath: "audio/siyah.mp3",
    ),

    // song 5
    Song(
      songName: 'Insane',
      artistName: 'AP DHILLON',
      albumArtImagePath: "assets/images/song6.jpg",
      audioPath: "audio/insane.mp3",
    ),


    Song(
      songName: 'unforgettable',
      artistName: 'FRENCH MONTANA',
      albumArtImagePath: "assets/images/song14.jpg",
      audioPath: "audio/french.mp3",
    ),

    Song(
      songName: 'StarDust',
      artistName: 'THIARAJXTT',
      albumArtImagePath: "assets/images/song13.jpg",
      audioPath: "audio/stardust.mp3",
    ),

    Song(
      songName: 'Viva La Vida',
      artistName: 'COLDPLAY',
      albumArtImagePath: "assets/images/song5.webp",
      audioPath: "audio/coldplay.mp3",
    ),

    Song(
      songName: 'I Always Fall',
      artistName: 'Eli Wilson',
      albumArtImagePath: "assets/images/song22.jpg",
      audioPath: "audio/ialwaysfall.mp3",
    ),

    Song(
      songName: 'All of the Stars',
      artistName: 'Ed Sheeran',
      albumArtImagePath: "assets/images/song23.png",
      audioPath: "audio/ed.mp3",
    ),

    Song(
      songName: 'Another Love',
      artistName: 'Tom Odell',
      albumArtImagePath: "assets/images/song24.jpg",
      audioPath: "audio/anotherlove.mp3",
    ),

    Song(
      songName: 'Drivers License',
      artistName: 'Olivia Rodrigo',
      albumArtImagePath: "assets/images/song25.jpg",
      audioPath: "audio/olivia.mp3",
    ),

    Song(
      songName: 'Roses',
      artistName: 'Gashi',
      albumArtImagePath: "assets/images/song26.jpg",
      audioPath: "audio/roses.mp3",
    ),

    Song(
      songName: '52 Bars',
      artistName: 'Karan Aujila',
      albumArtImagePath: "assets/images/song27.jpg",
      audioPath: "audio/52bars.mp3",
    ),

    Song(
      songName: 'Sun Toh Lo',
      artistName: 'Avanti Nagral',
      albumArtImagePath: "assets/images/song28.jpg",
      audioPath: "audio/suntohlo.mp3",
    ),

    Song(
      songName: 'Jee Ni Lagda',
      artistName: 'Karan Aujila',
      albumArtImagePath: "assets/images/song29.jpg",
      audioPath: "audio/karan1.mp3",
    ),


  ];

  // Current song playing index
  int? _currentSongIndex;

  /*
  A U D I O P L A Y E R
  */

  // AUDIO PLAYER
  final AudioPlayer _audioPlayer = AudioPlayer();

  // DURATIONS
  Duration _currentDuration = Duration.zero;
  Duration _totalDurations = Duration.zero;

  // CONSTRUCTORS
  PlaylistProvider() {
    listenToDuration();
  }

  // Initially not playing
  bool _isplaying = false;

  // Play the song
  void play() async {
    final String path = playlist[_currentSongIndex!].audioPath;
    await _audioPlayer.stop(); // Stop current song
    await _audioPlayer.play(AssetSource(path)); // Play the new song
    _isplaying = true;
    notifyListeners();
  }

  // Pause the song
  void pause() async {
    await _audioPlayer.pause();
    _isplaying = false;
    notifyListeners();
  }

  // Resume playing
  void resume() async {
    await _audioPlayer.resume();
    _isplaying = true;
    notifyListeners();
  }

  // Pause or resume
  void pauseOrResume() async {
    if (_isplaying) {
      pause();
    } else {
      resume();
    }
    notifyListeners();
  }

  // Seek to a specific position in the current song
  void seek(Duration position) async {
    await _audioPlayer.seek(position);
  }

  // Play next song
  void playNextSong() {
    if (_currentSongIndex != null) {
      if (currentSongIndex! < _playlist.length - 1) {
        // Go to the next song if it's not the last one
        currentSongIndex = _currentSongIndex! + 1;
      } else {
        // If it's the last song, loop back to the first song
        currentSongIndex = 0;
      }
    }
  }
// Play previous song
  void playPrevious() {
    // If more than two seconds have passed
    if (_currentDuration.inSeconds > 2) {
      seek(Duration.zero);
    } else {
      if (_currentSongIndex! > 0) {
        currentSongIndex = _currentSongIndex! - 1;
      } else {
        // If it's the first song, loop back to the last one
        currentSongIndex = _playlist.length - 1;
      }
    }
  }


  // Listen to duration
  void listenToDuration() {
    // Listen for total duration
    _audioPlayer.onDurationChanged.listen((newDuration) {
      _totalDurations = newDuration;
      notifyListeners();
    });

    // Listen for current duration
    _audioPlayer.onPositionChanged.listen((newPosition) {
      _currentDuration = newPosition;
      notifyListeners();
    });

    // Listen for song completion
    _audioPlayer.onPlayerComplete.listen((event) {
      playNextSong();
    });
  }

  // Dispose audio player
  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  /*
  G E T T E R S
  */
  int? get currentSongIndex => _currentSongIndex;
  List<Song> get playlist => _playlist;
  bool get isPlaying => _isplaying;
  Duration get currentDuration => _currentDuration;
  Duration get totalDuration => _totalDurations;

  /*
  S E T T E R S
  */
  set currentSongIndex(int? newIndex) {
    // Update current song index
    _currentSongIndex = newIndex;
    if (newIndex != null) {
      play(); // Play the song at the new index
    }

    // Update UI
    notifyListeners();
  }
}
