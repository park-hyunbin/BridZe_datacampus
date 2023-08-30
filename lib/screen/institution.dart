import 'package:bridze/list/donghae_2.dart';
import 'package:bridze/list/gangdong_1.dart';
import 'package:bridze/list/gunsan_1.dart';
import 'package:bridze/widgets/carousel.dart';
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
  List<Widget> carouselItems = [];
  Widget GunsanCarousel = CityCarousel(cities: gunsan);
  Widget GangdongCarousel = CityCarousel(cities: gangdong);
  Widget DonghaeCarousel = CityCarousel(cities: donghae);

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
                  "도/시 와  시/군 을 선택해주세요",
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
                            '제주특별자치도',
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
                    if (selectedCity == '군산시')
                      GunsanCarousel
                    else if (selectedCity == '강동구')
                      GangdongCarousel
                    else if (selectedCity == '동해시')
                      DonghaeCarousel
                    else
                      CarouselSlider(
                        options: CarouselOptions(
                          height: 400,
                          enableInfiniteScroll: false,
                        ),
                        items: carouselItems,
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
}
