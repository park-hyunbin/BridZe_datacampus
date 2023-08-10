import 'package:bridze/screen/daignosis_2/ho.dart';
import 'package:flutter/material.dart';
import 'dart:async';

class PumpkinPage extends StatefulWidget {
  const PumpkinPage({Key? key}) : super(key: key);

  @override
  PumpkinPageState createState() => PumpkinPageState();
}

class PumpkinPageState extends State<PumpkinPage> {
  bool _showBlackout = false;
  bool _showPumpkin = true;

  @override
  void initState() {
    super.initState();

    // Create a timer that triggers after 3 seconds
    Timer(const Duration(seconds: 3), () {
      setState(() {
        _showPumpkin = false;
        _showBlackout = true;
      });

      // Delay navigation by a bit to allow blackout animation to finish
      Future.delayed(const Duration(milliseconds: 600), () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const HoPage()),
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
            child: _showPumpkin
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
