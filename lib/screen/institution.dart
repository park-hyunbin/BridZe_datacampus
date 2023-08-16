import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:bridze/list/city.dart';

class InstitutionRecommend extends StatefulWidget {
  const InstitutionRecommend({Key? key}) : super(key: key);

  @override
  InstitutionRecommendState createState() => InstitutionRecommendState();
}

class InstitutionRecommendState extends State<InstitutionRecommend> {
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
                const SizedBox(height: 30),
                const Text(
                  "시/도와 도시를 선택해주세요",
                  style: TextStyle(
                    fontFamily: 'BMJUA',
                    fontSize: 35,
                    color: Color(0xFF96B9DB),
                  ),
                ),
                const SizedBox(height: 50),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 300,
                      height: 70,
                      decoration: BoxDecoration(
                        color: const Color(0xFF96B9DB),
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                      child: Center(
                        child: DropdownButton<String>(
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
                          ].map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(
                                value,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  fontFamily: 'BMJUA',
                                  fontSize: 30,
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                    const SizedBox(width: 50),
                    if (selectedProvince != null)
                      Container(
                        width: 300,
                        height: 70,
                        decoration: BoxDecoration(
                          color: const Color(0xFF96B9DB),
                          borderRadius: BorderRadius.circular(50.0),
                        ),
                        child: Center(
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
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    fontFamily: 'BMJUA',
                                    fontSize: 30,
                                  ),
                                ),
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                  ],
                ),
                const SizedBox(
                  height: 50,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CarouselSlider(
                      options: CarouselOptions(
                        height: 400,
                        enableInfiniteScroll: false, // 무한 스크롤 비활성화
                      ),
                      items: [
                        buildCarouselItem(
                            '군산어린이심리센터',
                            '063-464-7120',
                            'assets/images/gunsan_1.png',
                            '전북 군산시 공단대로 441 LG 테레콤'),
                        buildCarouselItem(
                            '아리울언어심리연구소',
                            '123-456-7890',
                            'assets/images/gunsan_2.png',
                            '전북 군산시 공단대로 202 백토빌딩 3층'),
                        buildCarouselItem(
                            '소리엘언어심리센터',
                            '987-654-3210',
                            'assets/images/gunsan_3.png',
                            '전북 군산시 나운로 4 현대코아 306호'),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildCarouselItem(
      String title, String phoneNumber, String imagePath, String address) {
    return Column(
      children: [
        Image.asset(
          imagePath,
          width: 300,
          height: 227,
        ),
        const SizedBox(height: 10),
        Text(
          title,
          style: const TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.bold,
            fontFamily: 'BMJUA',
          ),
        ),
        const SizedBox(height: 5),
        Text(
          '전화번호: $phoneNumber',
          style: const TextStyle(
            fontSize: 24,
            fontFamily: 'BMJUA',
          ),
        ),
        Text(
          '지번 : $address',
          style: const TextStyle(
            fontSize: 24,
            fontFamily: 'BMJUA',
          ),
        )
      ],
    );
  }
}
