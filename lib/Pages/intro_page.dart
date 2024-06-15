import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'home_page.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent, // Make the background transparent
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.brown.shade400,
              Theme.of(context).colorScheme.surface,
            ],
            stops: const [0.2, 1],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 350,
                height: 350,
                child: Image.asset('assets/images/HR.png'), // Add your asset image
              ),
              const SizedBox(height: 10),
              MaterialButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    PageTransition(
                      type: PageTransitionType.fade,
                      child: const HomePage(),
                    ),
                  );
                },
                color: Colors.brown.shade100,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(6.0),
                  child: Text(
                    'HARMONIA',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.1, // Adjust letter spacing
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
