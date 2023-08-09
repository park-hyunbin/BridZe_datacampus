import 'package:bridze/screen/daignosis_2/ho.dart';
import 'package:flutter/material.dart';
import 'dart:async';

class PumpkinPage extends StatefulWidget {
  const PumpkinPage({Key? key}) : super(key: key);

  @override
  PumpkinPageState createState() => PumpkinPageState();
}

class PumpkinPageState extends State<PumpkinPage> {
  @override
  void initState() {
    super.initState();

    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const HoPage()));
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
                  "assets/images/pumpkin.png",
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
