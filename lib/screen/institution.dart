import 'package:bridze/list/gangdong_1.dart';
import 'package:bridze/list/gangdong_2.dart';
import 'package:bridze/list/gangwon/cheorwon_1.dart';
import 'package:bridze/list/gangwon/cheorwon_2.dart';
import 'package:bridze/list/gangwon/chuncheon_1.dart';
import 'package:bridze/list/gangwon/chuncheon_2.dart';
import 'package:bridze/list/gangwon/donghae_1.dart';
import 'package:bridze/list/gangwon/donghae_2.dart';
import 'package:bridze/list/gangwon/gangneung_1.dart';
import 'package:bridze/list/gangwon/gangneung_2.dart';
import 'package:bridze/list/gangwon/goseong.dart';
import 'package:bridze/list/gangwon/hoengseong_1.dart';
import 'package:bridze/list/gangwon/hoengseong_2.dart';
import 'package:bridze/list/gangwon/hongcheon_1.dart';
import 'package:bridze/list/gangwon/hongcheon_2.dart';
import 'package:bridze/list/gunsan_1.dart';
import 'package:bridze/list/gyeonggi/ansan_1.dart';
import 'package:bridze/list/gyeonggi/ansan_2.dart';
import 'package:bridze/widgets/carousel.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:bridze/list/city.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../list/gunsan_2.dart';

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
  Widget GunsanCarousel2 = CityCarousel(cities: gunsan2);
  Widget GangdongCarousel = CityCarousel(cities: gangdong);
  Widget GangdongCarousel2 = CityCarousel(cities: gangdong2);
  Widget CheorwonCarousel = CityCarousel(cities: cheorwon1);
  Widget CheorwonCarousel2 = CityCarousel(cities: cheorwon2);
  Widget ChuncheonCarousel = CityCarousel(cities: chuncheon1);
  Widget ChuncheonCarousel2 = CityCarousel(cities: chuncheon2);
  Widget HoengSeongCarousel = CityCarousel(cities: hoengseong1);
  Widget HoengSeongCarousel2 = CityCarousel(cities: hoengseong2);
  Widget DongHaeCarousel = CityCarousel(cities: donghae1);
  Widget DongHaeCarousel2 = CityCarousel(cities: donghae2);
  Widget GangneungCarousel = CityCarousel(cities: gangneung1);
  Widget GangneungCarousel2 = CityCarousel(cities: gangneung2);
  Widget GoseongCarousel = CityCarousel(cities: goseong);
  Widget HongcheonCarousel = CityCarousel(cities: hongcheon1);
  Widget HongcheonCarousel2 = CityCarousel(cities: hongcheon2);
  Widget AnsanCarousel = CityCarousel(cities: ansan1);
  Widget AnsanCarousel2 = CityCarousel(cities: ansan2);
  Widget InjeCarousel = CityCarousel(cities: inje1);
  Widget InjeCarousel2 = CityCarousel(cities: inje2);

  String evaluation = '';
  String recommendation = '';
  String recommendation2 = '';
  String evaluation2 = '';

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      loadEvaluation();
    });
  }

  void loadEvaluation() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String storedEvaluation = prefs.getString('evaluation') ?? 'default_value';
    String storedEvaluation2 =
        prefs.getString('evaluation2') ?? 'default_value';

    print('Stored Evaluation: $storedEvaluation');
    print('Stored Evaluation2: $storedEvaluation2');

    setState(() {
      evaluation = storedEvaluation;
      evaluation2 = storedEvaluation2;
      determineRecommendation();
    });
  }

  void determineRecommendation() {
    if ((evaluation == '상' || evaluation == '중') &&
        (evaluation2 == '상' || evaluation2 == '중상')) {
      recommendation = '비대면 프로그램을 추천합니다!';
    } else if ((evaluation == '상' || evaluation == '중') &&
        (evaluation2 == '하' || evaluation2 == '중하')) {
      recommendation = '정서 기관 선택을 추천합니다!';
    } else if ((evaluation == '하' &&
        (evaluation2 == '상' || evaluation2 == '중상'))) {
      recommendation = '언어 기관 선택을 추천합니다!';
    } else {
      recommendation = '기관을 선택해주세요';
    }
  }

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
                      const SizedBox(width: 10),
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
                const SizedBox(height: 20),
                const Text(
                  "도/시 와  시/군 을 선택해주세요",
                  style: TextStyle(
                    fontFamily: 'BMJUA',
                    fontSize: 35,
                    color: Color(0xFF96B9DB),
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  recommendation,
                  style: const TextStyle(
                    fontFamily: 'BMJUA',
                    fontSize: 20,
                    color: Color(0xFFe73333),
                  ),
                ),
                const SizedBox(height: 30),
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
                    if ((recommendation == '언어 기관 선택을 추천합니다!' &&
                        selectedCity == '군산시'))
                      GunsanCarousel
                    else if ((recommendation == '정서 기관 선택을 추천합니다!' ||
                            recommendation == '기관을 선택해주세요') &&
                        selectedCity == '군산시')
                      GunsanCarousel2,
                    if (selectedCity == '강동구' &&
                        recommendation == '언어 기관 선택을 추천합니다!')
                      GangdongCarousel,
                    if ((recommendation == '정서 기관 선택을 추천합니다!' ||
                            recommendation == '기관을 선택해주세요') &&
                        selectedCity == '강동구')
                      GangdongCarousel2,
                    if (selectedCity == '철원군' &&
                        recommendation == '언어 기관 선택을 추천합니다!')
                      CheorwonCarousel,
                    if ((recommendation == '정서 기관 선택을 추천합니다!' ||
                            recommendation == '기관을 선택해주세요') &&
                        selectedCity == '철원군')
                      CheorwonCarousel2,
                    if (selectedCity == '춘천시' &&
                        recommendation == '언어 기관 선택을 추천합니다!')
                      ChuncheonCarousel,
                    if ((recommendation == '정서 기관 선택을 추천합니다!' ||
                            recommendation == '기관을 선택해주세요') &&
                        selectedCity == '춘천시')
                      ChuncheonCarousel2,
                    if (selectedCity == '횡성시' &&
                        recommendation == '언어 기관 선택을 추천합니다!')
                      HoengSeongCarousel,
                    if ((recommendation == '정서 기관 선택을 추천합니다!' ||
                            recommendation == '기관을 선택해주세요') &&
                        selectedCity == '횡성시')
                      HoengSeongCarousel2,
                    if (selectedCity == '동해시' &&
                        recommendation == '언어 기관 선택을 추천합니다!')
                      DongHaeCarousel,
                    if ((recommendation == '정서 기관 선택을 추천합니다!' ||
                            recommendation == '기관을 선택해주세요') &&
                        selectedCity == '동해시')
                      DongHaeCarousel2,
                    if (selectedCity == '강릉시' &&
                        recommendation == '언어 기관 선택을 추천합니다!')
                      GangneungCarousel,
                    if ((recommendation == '정서 기관 선택을 추천합니다!' ||
                            recommendation == '기관을 선택해주세요') &&
                        selectedCity == '강릉시')
                      GangneungCarousel2,
                    if (selectedCity == '고성시') GoseongCarousel,
                    if (selectedCity == '홍천군' &&
                        recommendation == '언어 기관 선택을 추천합니다!')
                      HongcheonCarousel,
                    if ((recommendation == '정서 기관 선택을 추천합니다!' ||
                            recommendation == '기관을 선택해주세요') &&
                        selectedCity == '홍천군')
                      HongcheonCarousel2,
                    if (selectedCity == '인제군' &&
                        recommendation == '언어 기관 선택을 추천합니다!')
                      InjeCarousel,
                    if ((recommendation == '정서 기관 선택을 추천합니다!' ||
                            recommendation == '기관을 선택해주세요') &&
                        selectedCity == '인제군')
                      InjeCarousel2,
                    if (selectedCity == '안산시' &&
                        recommendation == '언어 기관 선택을 추천합니다!')
                      AnsanCarousel,
                    if ((recommendation == '정서 기관 선택을 추천합니다!' ||
                            recommendation == '기관을 선택해주세요') &&
                        selectedCity == '안산시')
                      AnsanCarousel2,
                    CarouselSlider(
                      options: CarouselOptions(
                        height: 50,
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
