import 'package:flutter/material.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FAVORITE',
        style: TextStyle(
          fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.transparent, // Making app bar transparent
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.brown.shade400,
                Theme.of(context).colorScheme.surface,
              ],
              stops: const [0.5, 1.3],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
        ),
      ),
      body: Container(
        color: Theme.of(context).colorScheme.surface,
        child: ListView(
          padding: const EdgeInsets.all(10.0),
          children: [
            // Example of favorite songs
            _buildFavoriteCard(context, 'Reverie', 'ILLENIUM'),
            _buildFavoriteCard(context, 'Yellow', 'COLDPLAY'),
            // Add more songs here
          ],
        ),
      ),
    );
  }

  Widget _buildFavoriteCard(BuildContext context, String title, String subtitle) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      elevation: 5,
      child: ListTile(
        leading: Container(
          padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
            border: Border.all(
              color: Colors.grey.shade600,
              width: 2.0,
            ),
            boxShadow: const [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 20,
                offset: Offset(0, 5),
              ),
            ],
          ),
          child: Icon(
            Icons.music_note,
            color: Theme.of(context).colorScheme.primary,
            size: 30,
          ),
        ),
        title: Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Theme.of(context).colorScheme.onSurface,
          ),
        ),
        subtitle: Text(subtitle),
        trailing: Icon(
          Icons.favorite,
          color: Colors.brown[400],
        ),
      ),
    );
  }
}
