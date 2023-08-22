import 'package:flutter/material.dart';

class CalendarApp extends StatefulWidget {
  const CalendarApp({Key? key}) : super(key: key);

  @override
  CalendarAppState createState() => CalendarAppState();
}

class CalendarAppState extends State<CalendarApp> {
  var selectedProvince;
  var selectedCity;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'assets/images/desktop1.png',
            fit: BoxFit.cover,
            width: 1440,
            height: 1024,
          ),
          Center(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 60),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/torizzi.png',
                        width: 50,
                        height: 50,
                      ),
                      const SizedBox(width: 15),
                      const Text(
                        "토리찌가 도와줄게 !",
                        style: TextStyle(
                          fontFamily: 'BMJUA',
                          fontSize: 40,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  "링크를 접속해서 프로그램을 예약할 수 있어요",
                  style: TextStyle(
                    fontFamily: 'BMJUA',
                    fontSize: 35,
                    color: Color(0xFF96B9DB),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  width: 400,
                  height: 70,
                  decoration: BoxDecoration(
                    color: const Color(0xFFE5C1C5),
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 30,
                      ),
                      if (selectedProvince != null)
                        Container(
                          width: 400,
                          height: 70,
                          margin: const EdgeInsets.symmetric(vertical: 10),
                          decoration: BoxDecoration(
                            color: const Color(0xFF96B9DB),
                            borderRadius: BorderRadius.circular(50.0),
                          ),
                        ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 150,
                ),
                const Text(
                  "링크를 클릭하여 사이트에 방문해 예약하거나, 전화번호로 전화해 예약해주세요 :)",
                  style: TextStyle(fontSize: 25, fontFamily: 'BMJUA'),
                ),
                const SizedBox(
                  height: 50,
                ),
                Container(
                  width: 300,
                  height: 70,
                  decoration: BoxDecoration(
                    color: const Color(0xFFE5C1C5),
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                  child: const Center(
                    child: Text(
                      "아린이를 위한 온라인 플랫폼",
                      style: TextStyle(
                        fontFamily: 'BMJUA',
                        fontSize: 30,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 80,
                ),
                Container(
                  width: 300,
                  height: 70,
                  decoration: BoxDecoration(
                    color: const Color(0xFFE5C1C5),
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                  child: const Center(
                    child: Text(
                      "부모님을 위한 온라인 플랫폼",
                      style: TextStyle(
                        fontFamily: 'BMJUA',
                        fontSize: 30,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    home: CalendarApp(),
  ));
}
