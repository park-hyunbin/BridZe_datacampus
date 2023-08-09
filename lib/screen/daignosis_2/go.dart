import 'dart:async';
import 'package:bridze/screen/daignosis_2/pumpkin.dart';
import 'package:flutter/material.dart';

class GoPage extends StatefulWidget {
  const GoPage({Key? key}) : super(key: key);

  @override
  GoPageState createState() => GoPageState();
}

final appleItem = {
  "list": [
    {"image": "assets/images/hedgehog.png", "isSelected": false},
    {"image": "assets/images/whale.png", "isSelected": false},
    {"image": "assets/images/train.png", "isSelected": false},
    {"image": "assets/images/sun.png", "isSelected": false},
    {"image": "assets/images/spider.png", "isSelected": false},
    {"image": "assets/images/rubberband.png", "isSelected": false},
    {"image": "assets/images/potato.png", "isSelected": false},
    {"image": "assets/images/pepper.png", "isSelected": false},
    {"image": "assets/images/meat.png", "isSelected": false},
    {"image": "assets/images/giraffe.png", "isSelected": false},
    {"image": "assets/images/gorilla.png", "isSelected": false},
    {"image": "assets/images/sweetpotato.png", "isSelected": false}
  ]
};

class GoPageState extends State<GoPage> {
  int remainingTime = 10;

  @override
  void initState() {
    super.initState();

    Timer(const Duration(seconds: 10), () {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => const PumpkinPage()));
    });

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
            top: 50,
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
                    width: 200,
                    height: 150,
                    color: appleItem["list"]?[index]["isSelected"] == true
                        ? Colors.pink.withOpacity(0.2)
                        : null,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          height: 150,
                          width: 150,
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
