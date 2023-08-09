import 'package:bridze/screen/daignosis_2/sa.dart';
import 'package:flutter/material.dart';
import 'dart:async';

class ApplePage extends StatefulWidget {
  const ApplePage({Key? key}) : super(key: key);

  @override
  ApplePageState createState() => ApplePageState();
}

class ApplePageState extends State<ApplePage> {
  @override
  void initState() {
    super.initState();

    // Create a timer that triggers after 5 seconds
    Timer(const Duration(seconds: 5), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const SaPage()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'assets/images/diagnosis_kid.png',
            fit: BoxFit.cover,
            width: 1440,
            height: 1024,
          ),
          Column(
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
          ),
        ],
      ),
    );
  }
}
