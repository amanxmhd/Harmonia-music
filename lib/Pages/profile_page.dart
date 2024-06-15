import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown[400],
        title: const Text('PROFILE',
          style: TextStyle(
              fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.brown.shade400,
              Theme.of(context).colorScheme.surface,
            ],
            stops: const [0.3, 0.9],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(45.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const CircleAvatar(
                radius: 80,
                backgroundImage: AssetImage('assets/images/pp1.jpg'), // Add the path to the user's profile picture
              ),
              const SizedBox(height: 20),
              const Text(
                'amanxmhd',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'amanxmhd@gmail.com',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey.shade900,
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Favorite Genres',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              // Add a list of the user's favorite music genres
              const Wrap(
                spacing: 10,
                children: <Widget>[
                  Chip(
                    label: Text('Pop'),
                    backgroundColor: Colors.grey,
                  ),
                  Chip(
                    label: Text('Hip Hop'),
                    backgroundColor: Colors.grey,
                  ),
                  Chip(
                    label: Text('Electronic'),
                    backgroundColor: Colors.grey,
                  ),
                  // Add more chips for other genres as needed
                ],
              ),
              const SizedBox(height: 20),
              const Text(
                'Recent Plays',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              // Add a list of recently played songs or albums
              // You can use ListView or Wrap depending on the layout you prefer
              Expanded(
                child: ListView(
                  shrinkWrap: true,
                  children: const <Widget>[
                    ListTile(
                      leading: Icon(Icons.music_note),
                      title: Text('Fireflies'),
                      subtitle: Text('OWL CITY'),
                    ),
                    ListTile(
                      leading: Icon(Icons.music_note),
                      title: Text('Kabira'),
                      subtitle: Text('Arijit Singh'),
                    ),
                    // Add more ListTiles for additional songs
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
