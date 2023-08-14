import 'package:bridze/list/city.dart';
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
                  "시/도를 선택해주세요",
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
                    color: const Color(0xFF96B9DB),
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                  child: Column(
                    children: [
                      DropdownButton<String>(
                        value: selectedProvince,
                        onChanged: (newValue) {
                          setState(() {
                            selectedProvince = newValue!;
                            selectedCity = null;
                          });
                        },
                        items: <String>[
                          '서울특별시',
                          '경기도',
                          '강원도',
                          '충청북도',
                          '충청남도',
                          '전라북도',
                          '전라남도',
                          '경상북도',
                          '경상남도',
                          '제주특별자치도',
                        ].map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(
                              value,
                              style: const TextStyle(
                                fontFamily: 'BMJUA',
                                fontSize: 30,
                              ),
                            ),
                          );
                        }).toList(),
                      ),
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
                          child: DropdownButton<String>(
                            value: selectedCity,
                            onChanged: (newValue) {
                              setState(() {
                                selectedCity = newValue!;
                              });
                            },
                            items: citiesByProvince[selectedProvince]!
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(
                                  value,
                                  style: const TextStyle(
                                    fontFamily: 'BMJUA',
                                    fontSize: 30,
                                  ),
                                ),
                              );
                            }).toList(),
                          ),
                        ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 150,
                ),
                const Text(
                  "링크를 클릭하여 사이트를 방문해 예약하거나 전화번호로 전화해 예약해주세요 :)",
                  style: TextStyle(fontSize: 25, fontFamily: 'BMJUA'),
                ),
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
                  height: 80,
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

void main() {
  runApp(const MaterialApp(
    home: CalendarApp(),
  ));
}
