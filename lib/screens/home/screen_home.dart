import 'dart:async';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:money_manager/screens/home/login_page.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> _letters = [];
  String _displayedText = '';
  bool _showSubheading = false;

  @override
  void initState() {
    super.initState();

    // Initialize the main heading text and split it into letters
    _letters = "PocketGuard".split('');

    // Start the letter animation
    _startLetterAnimation();
  }

  void _startLetterAnimation() {
    // Delay to show each letter
    Timer.periodic(const Duration(milliseconds: 250), (timer) {
      if (_displayedText.length < _letters.length) {
        setState(() {
          _displayedText += _letters[_displayedText.length];
        });
      } else {
        timer.cancel(); // Stop the timer when all letters are shown
        // Show the subheading after the main heading has fully displayed
        setState(() {
          _showSubheading = true;
        });
      }
    });
  }

  void _navigateToLogin() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => LoginScreen()),
        );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            // Background image displayed immediately
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/home.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned.fill(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                child: Container(
                  color: Colors.black.withOpacity(0),
                ),
              ),
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Display the animated main heading
                  InkWell(
                    onTap: _navigateToLogin,
                    child: Text(
                      _displayedText,
                      style: const TextStyle(
                        fontSize: 50,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        shadows: [
                          Shadow(
                            offset: Offset(2.0, 2.0),
                            blurRadius: 5.0,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 4),
                  // Show subheading only after the main heading is complete
                  if (_showSubheading)
                    Text(
                      "Turning Every Penny into Possibility!",
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.red[900],
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
