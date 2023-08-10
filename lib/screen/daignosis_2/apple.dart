import 'package:bridze/screen/daignosis_2/sa.dart';
import 'package:flutter/material.dart';
import 'dart:async';

class ApplePage extends StatefulWidget {
  const ApplePage({Key? key}) : super(key: key);

  @override
  ApplePageState createState() => ApplePageState();
}

class ApplePageState extends State<ApplePage> {
  bool _showBlackout = false;
  bool _showApple = true; // Show the apple initially

  @override
  void initState() {
    super.initState();

    // Create a timer that triggers after 3 seconds
    Timer(const Duration(seconds: 3), () {
      setState(() {
        _showApple = false; // Hide the apple
        _showBlackout = true; // Show the blackout
      });

      // Delay navigation by a bit to allow blackout animation to finish
      Future.delayed(const Duration(milliseconds: 600), () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const SaPage()),
        );
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          AnimatedOpacity(
            duration: const Duration(milliseconds: 300),
            opacity: _showBlackout ? 1.0 : 0.0,
            child: Container(
              color: Colors.black,
            ),
          ),
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            child: _showApple
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                        child: Image.asset(
                          "assets/images/apple.png",
                          width: 300,
                          height: 300,
                        ),
                      ),
                    ],
                  )
                : const SizedBox.shrink(),
          ),
        ],
      ),
    );
  }
}
