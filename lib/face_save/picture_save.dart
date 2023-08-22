import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Diagnosis App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const DiagnosisScreen(),
    );
  }
}

class DiagnosisScreen extends StatelessWidget {
  const DiagnosisScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      extendBodyBehindAppBar: true,
      body: Stack(children: <Widget>[
        Image.asset(
          'assets/images/diagnosis_home.png',
          fit: BoxFit.cover,
          width: 1440,
          height: 1024,
        ),
        Padding(
          padding: const EdgeInsets.only(
            top: 40,
            left: 20,
          ),
          child: Column(
            children: <Widget>[
              const Text(
                '감정을 나타내는 표정들',
                style: TextStyle(
                  fontFamily: 'BMJUA',
                  fontSize: 40,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              const Text(
                '부모님이 참고해주세요!',
                style: TextStyle(
                  fontFamily: 'BMJUA',
                  fontSize: 24,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 50,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(
                      flex: 1,
                      child: Container(
                        width: 300,
                        height: 200,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.black,
                            width: 2.0,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 40),
                    Flexible(
                      flex: 1,
                      child: Container(
                        width: 300,
                        height: 200,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.black,
                            width: 2.0,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 40,
                    ),
                    Flexible(
                      flex: 1,
                      child: Container(
                        width: 300,
                        height: 200,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.black,
                            width: 2.0,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                    flex: 1,
                    child: Container(
                      width: 300,
                      height: 200,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black,
                          width: 2.0,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 40),
                  Flexible(
                    flex: 1,
                    child: Container(
                      width: 300,
                      height: 200,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black,
                          width: 2.0,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                width: 700,
                height: 70,
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(254, 202, 202, 1.0),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Center(
                  child: Text(
                    "감정과 표정을 잘 알아야 유대관계와 정서에 좋아요",
                    style: TextStyle(
                      fontFamily: "BMJUA",
                      fontSize: 27,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
