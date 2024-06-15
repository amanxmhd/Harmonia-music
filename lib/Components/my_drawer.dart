import 'package:flutter/material.dart';
import '../Pages/home_page.dart';
import '../Pages/intro_page.dart';
import '../Pages/profile_page.dart';
import '../Pages/favorite_page.dart';
import '../Pages/rate_app.dart';  // Import the FavoritePage

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.surface,
      child: Column(
        children: [
          DrawerHeader(
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
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                      border: Border.all(
                        color: Colors.grey.shade600,
                        width: 3.0,
                      ),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 15,
                          offset: Offset(0, 5),
                        ),
                      ],
                    ),
                    child: AnimatedIcon(
                      icon: AnimatedIcons.play_pause,
                      progress: const AlwaysStoppedAnimation(1.0),
                      size: 30,
                      color: Theme.of(context).colorScheme.inversePrimary,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'HARMONIA',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      letterSpacing: 3,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25, top: 25),
            child: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: const ListTile(
                title: Text(
                  "H O M E",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                leading: Icon(Icons.home),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25, top: 0),
            child: InkWell(
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HomePage(),
                  ),
                );
              },
              child: const ListTile(
                title: Text(
                  "P L A Y L I S T S",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                leading: Icon(Icons.queue_music),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25, top: 0),
            child: InkWell(
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ProfilePage(),
                  ),
                );
              },
              child: const ListTile(
                title: Text(
                  "P R O F I L E",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                leading: Icon(Icons.person),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25, top: 0),
            child: InkWell(
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const FavoritePage(),
                  ),
                );
              },
              child: const ListTile(
                title: Text(
                  "F A V O R I T E",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                leading: Icon(Icons.favorite),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25, top: 0),
            child: InkWell(
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const RateMyAppPage(),
                  ),
                );
              },
              child: const ListTile(
                title: Text(
                  "R A T E  T H E  A P P",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                leading: Icon(Icons.star_border),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25, top: 0),
            child: InkWell(
              onTap: () {},
              child: const ListTile(
                title: Text(
                  "R E C E N T",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                leading: Icon(Icons.history),
              ),
            ),
          ),
          Expanded(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: InkWell(
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const IntroPage(),
                      ),
                    );
                  },
                  child: const ListTile(
                    title: Text(
                      "Log Out",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    leading: Icon(Icons.logout),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
