import 'package:flutter/material.dart';
import 'dart:async';

class CatPage extends StatefulWidget {
  const CatPage({Key? key}) : super(key: key);

  @override
  CatPageState createState() => CatPageState();
}

class CatPageState extends State<CatPage> {
  bool _showBlackout = false;
  bool _showCat = true; // Show the apple initially

  @override
  void initState() {
    super.initState();

    // Create a timer that triggers after 3 seconds
    Timer(const Duration(seconds: 3), () {
      setState(() {
        _showCat = false;
        _showBlackout = true;
      });

      // Delay navigation by a bit to allow blackout animation to finish
      Future.delayed(const Duration(milliseconds: 600), () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const GoPage()),
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
            child: _showCat
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                        child: Image.asset(
                          "assets/images/cat.png",
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
