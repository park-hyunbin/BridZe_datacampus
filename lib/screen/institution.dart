import 'package:flutter/material.dart';

class CalendarApp extends StatefulWidget {
  const CalendarApp({Key? key}) : super(key: key);

  @override
  CalendarAppState createState() => CalendarAppState();
}

class CalendarAppState extends State<CalendarApp> {
  @override
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
                const Text("시/도 와 동/읍/리/면 을 선택하면 맞춤 기관이 제공됩니다.",
                    style: TextStyle(
                        fontFamily: 'BMJUA',
                        fontSize: 35,
                        color: Color(0xFF96B9DB))),
                const SizedBox(
                  height: 30,
                ),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  GestureDetector(
                    onTap: () {
                      // Handle 시/도 선택
                    },
                    child: Container(
                      width: 220,
                      height: 70,
                      decoration: BoxDecoration(
                        color: const Color(0xFF96B9DB),
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                      child: const Center(
                        child: Text("시/도 선택",
                            style: TextStyle(
                              fontFamily: 'BMJUA',
                              fontSize: 30,
                            )),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 100,
                  ),
                  GestureDetector(
                    onTap: () {
                      // Handle 동/읍/리/면 선택
                    },
                    child: Container(
                      width: 220,
                      height: 70,
                      decoration: BoxDecoration(
                        color: const Color(0xFF96B9DB),
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                      child: const Center(
                        child: Text(
                          "동/읍/리/면 선택",
                          style: TextStyle(
                            fontFamily: 'BMJUA',
                            fontSize: 30,
                          ),
                        ),
                      ),
                    ),
                  ),
                ]),
                const SizedBox(
                  height: 80,
                ),
                const Text("링크를 클릭하여 사이트를 방문해 예약하거나 전화번호로 전화해 예약해주세요 :)",
                    style: TextStyle(fontSize: 25, fontFamily: 'BMJUA')),
                const SizedBox(
                  height: 50,
                ),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    width: 300,
                    height: 70,
                    decoration: BoxDecoration(
                      color: const Color(0xFFE5C1C5),
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                    child: const Center(
                      child: Text(
                        "아린이 맞춤 오프라인 기관",
                        style: TextStyle(
                          fontFamily: 'BMJUA',
                          fontSize: 30,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 100,
                ),
                GestureDetector(
                  onTap: () {
                    // Handle 아린이 맞춤 온라인 플랫폼
                  },
                  child: Container(
                    width: 300,
                    height: 70,
                    decoration: BoxDecoration(
                      color: const Color(0xFFE5C1C5),
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                    child: const Center(
                      child: Text(
                        "아린이 맞춤 온라인 플랫폼",
                        style: TextStyle(
                          fontFamily: 'BMJUA',
                          fontSize: 30,
                        ),
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
