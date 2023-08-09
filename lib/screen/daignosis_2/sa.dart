import 'dart:async';
import 'package:flutter/material.dart';

class SaPage extends StatefulWidget {
  const SaPage({Key? key}) : super(key: key);

  @override
  SaPageState createState() => SaPageState();
}

final appleItem = {
  "list": [
    {"image": "assets/images/tiger.png", "isSelected": false},
    {"image": "assets/images/ladder.png", "isSelected": false},
    {"image": "assets/images/lion.png", "isSelected": false},
    {"image": "assets/images/injection.png", "isSelected": false},
    {"image": "assets/images/peach.png", "isSelected": false},
    {"image": "assets/images/rice.png", "isSelected": false},
    {"image": "assets/images/drawers.png", "isSelected": false},
    {"image": "assets/images/doctor.png", "isSelected": false},
    {"image": "assets/images/deer.png", "isSelected": false},
    {"image": "assets/images/chips.png", "isSelected": false},
    {"image": "assets/images/car.png", "isSelected": false},
    {"image": "assets/images/box.png", "isSelected": false}
  ]
};

class SaPageState extends State<SaPage> {
  int remainingTime = 10;

  @override
  void initState() {
    super.initState();

    Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (remainingTime > 0) {
          remainingTime--;
        }
      });
      if (remainingTime == 0) {
        timer.cancel();
      }
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
              Padding(
                padding: const EdgeInsets.only(
                  left: 30.0,
                ),
                child: Text(
                  '$remainingTime',
                  style: const TextStyle(
                      fontSize: 40, color: Colors.red, fontFamily: 'BMJUA'),
                ),
              ),
            ],
          ),
          Positioned.fill(
            top: 100,
            left: 100,
            right: 100,
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
              ),
              itemCount: appleItem["list"]?.length,
              itemBuilder: (context, index) {
                final image = appleItem["list"]?[index]["image"] as String;
                final isSelected =
                    appleItem["list"]?[index]["isSelected"] as bool? ?? false;
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      appleItem["list"]?[index]["isSelected"] = !isSelected;
                    });
                  },
                  child: Container(
                    color: appleItem["list"]?[index]["isSelected"] == true
                        ? Colors.grey.withOpacity(0.5)
                        : null,
                    child: Column(
                      children: [
                        Image.asset(
                          image,
                          fit: BoxFit.cover,
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
