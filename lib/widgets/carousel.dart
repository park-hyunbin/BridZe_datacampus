import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class Institution {
  final String name;
  final String phoneNumber;
  final String imagePath;
  final String address;

  Institution({
    required this.name,
    required this.phoneNumber,
    required this.imagePath,
    required this.address,
  });
}

final List<Institution> gunsan = [
  Institution(
    name: '군산어린이심리센터',
    phoneNumber: '063-464-7120',
    imagePath: 'assets/images/gunsan_1.png',
    address: '전북 군산시 공단대로 441 LG 테레콤',
  ),
  Institution(
    name: '아리울언어심리연구소',
    phoneNumber: '123-456-7890',
    imagePath: 'assets/images/gunsan_2.png',
    address: '전북 군산시 공단대로 202 백토빌딩 3층',
  ),
  Institution(
    name: '소리엘언어심리센터',
    phoneNumber: '987-654-3210',
    imagePath: 'assets/images/gunsan_3.png',
    address: '전북 군산시 나운로 4 현대코아 306호',
  ),
  Institution(
    name: '군산언어발달연구소',
    phoneNumber: '063-465-5997',
    imagePath: '',
    address: '전북 군산시 수송로 163',
  ),
  Institution(
    name: '이선자인지언어치료연구소',
    phoneNumber: '063-452-3642',
    imagePath: '',
    address: '전북 군산시 수송동로 105',
  ),
  Institution(
    name: '맑은소리아동발달센터',
    phoneNumber: '063-910-7555',
    imagePath: '',
    address: '전북 군산시 수송로 257 3층',
  )
];

final List<Institution> gimje = [
  Institution(
    name: '군산어린이심리센터',
    phoneNumber: '063-464-7120',
    imagePath: 'assets/images/gunsan_1.png',
    address: '전북 군산시 공단대로 441 LG 테레콤',
  ),
  Institution(
    name: '아리울언어심리연구소',
    phoneNumber: '123-456-7890',
    imagePath: 'assets/images/gunsan_2.png',
    address: '전북 군산시 공단대로 202 백토빌딩 3층',
  ),
  Institution(
    name: '소리엘언어심리센터',
    phoneNumber: '987-654-3210',
    imagePath: 'assets/images/gunsan_3.png',
    address: '전북 군산시 나운로 4 현대코아 306호',
  ),
];

class CityCarousel extends StatelessWidget {
  final List<Institution> cities;

  const CityCarousel({Key? key, required this.cities}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 400,
        enableInfiniteScroll: false,
      ),
      items: cities.map((city) {
        return buildCarouselItem(
          city.name,
          city.phoneNumber,
          city.imagePath,
          city.address,
        );
      }).toList(),
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
