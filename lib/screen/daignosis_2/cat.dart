import 'package:bridze/screen/daignosis_2/go.dart';
import 'package:flutter/material.dart';
import 'dart:async';

class CatPage extends StatefulWidget {
  const CatPage({Key? key}) : super(key: key);

  @override
  CatPageState createState() => CatPageState();
}

class CatPageState extends State<CatPage> {
  @override
  void initState() {
    super.initState();

    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const GoPage()));
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
                  "assets/images/cat.png",
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
