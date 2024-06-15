import 'package:flutter/material.dart';
import 'package:harmonia/Models/playlist_provider.dart';
import 'package:harmonia/Themes/theme_provider.dart';
import 'package:provider/provider.dart';
import 'Pages/intro_page.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
        ChangeNotifierProvider(create: (context) => PlaylistProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: IntroPage(),  // Set IntroScreen as the initial screen
      theme: Provider.of<ThemeProvider>(context).themeData,
    );
  }
}

// Owner© @amanxmhd
