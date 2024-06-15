import 'package:flutter/material.dart';

class RateMyAppPage extends StatelessWidget {
  const RateMyAppPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rate My App',
          style: TextStyle(
              fontWeight: FontWeight.bold),
        ),
        flexibleSpace: Container(
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
        ),
      ),
      body: Container(
        color: Theme.of(context).colorScheme.surface,
        child: ListView(
          padding: const EdgeInsets.all(10.0),
          children: [
            _buildRateMyAppCard(context),
          ],
        ),
      ),
    );
  }

  Widget _buildRateMyAppCard(BuildContext context) {
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
            Icons.star,
            color: Theme.of(context).colorScheme.primary,
            size: 30,
          ),
        ),
        title: const Text(
          'Rate My App',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: const Text(
          'Enjoying the app? Please take a moment to rate it!',
        ),
      ),
    );
  }
}
