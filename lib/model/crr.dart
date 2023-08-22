import 'package:bridze/chart/chart_parent.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Score2 extends StatefulWidget {
  final String initialValue;
  final int number;

  // 생성자로 받아온 초기값에 따라 crr로 비교할 글이 달라짐.
  const Score2({Key? key, required this.initialValue, required this.number})
      : super(key: key);

  @override
  Score2State createState() => Score2State();
}

class Score2State extends State<Score2> {
  late String value;
  late String url; // API 요청을 보낼 주소
  String crrScore = '';
  late int number;

  @override
  void initState() {
    super.initState();
    value = widget.initialValue; // 초기값을 변수에 저장
    number = widget.number;
    url =
        'https://daitso.run.goorm.site/crr/$number?query=$value'; // API 요청 주소 설정
  }

  // API 요청을 보내고 결과를 처리하는 함수, 이 함수가 실행되면 현 위젯의 crrScore 값이 갱신된다.
  void fetchdata(String url) async {
    http.Response response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      setState(() {
        crrScore = response.body;
      });

      // Save avrScore to SharedPreferences
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('globalcrrScore', crrScore);

      // Navigate to LanguagePage2 with the fetched crrScore
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => LanguagePage2(
            crrScore: crrScore,
          ),
        ),
      );
    } else {
      setState(() {
        crrScore = 'Error: ${response.statusCode}';
      });
    }
  }

  void fetchavg() async {
    http.Response response =
        await http.get(Uri.parse('https://daitso.run.goorm.site/crr/average'));
    if (response.statusCode == 200) {
      setState(() {
        crrScore = response.body;
      });

      // Save avrScore to SharedPreferences
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('globalcrrScore', crrScore);
    } else {
      setState(() {
        crrScore = 'Error: ${response.statusCode}';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () async {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => LanguagePage2(
                  crrScore: crrScore,
                ),
              ),
            );
            fetchdata(url); // 버튼 클릭 시 fetchdata 함수 실행
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            decoration: BoxDecoration(
              color: const Color(0xff8EB5FF),
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Text(
              '결과보기!',
              style: TextStyle(
                fontSize: 15,
                fontFamily: 'BMJUA',
                color: Colors.white, // Change the text color as needed
              ),
            ),
          ),
        ),
      ],
    );
  }
}
