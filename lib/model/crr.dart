import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../chart/chart_language.dart';

class Score extends StatefulWidget {
  final String initialValue;
  final int number;

  // 생성자로 받아온 초기값에 따라 crr로 비교할 글이 달라짐.
  const Score({Key? key, required this.initialValue, required this.number})
      : super(key: key);

  @override
  _ScoreState createState() => _ScoreState();
}

class _ScoreState extends State<Score> {
  late String value;
  late String url;
  String crrScore = '';
  String avrScore = ''; // 추가: avrScore 변수를 선언
  late int number;

  @override
  void initState() {
    super.initState();
    value = widget.initialValue;
    number = widget.number;
    url = 'https://daitso.run.goorm.site/crr/$number?query=$value';
  }

  void fetchdata(String url) async {
    http.Response response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      crrScore = response.body;
      fetchavg(); // fetchavg를 먼저 호출해서 avrScore를 받아오도록 변경
    } else {
      crrScore = 'Error: ${response.statusCode}';
    }
  }

  void fetchavg() async {
    http.Response response =
        await http.get(Uri.parse('https://daitso.run.goorm.site/crr/average'));

    if (response.statusCode == 200) {
      setState(() {
        avrScore = response.body; // avrScore 변수에 값을 저장하여 UI 갱신
      });
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('globalavrScore', avrScore);

      // 아래 코드가 이동하였으므로 fetchavg()에서 호출하지 않음
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => LanguagePage(
            avrScore: avrScore,
          ),
        ),
      );
    } else {
      setState(() {
        avrScore = 'Error: ${response.statusCode}';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextButton(
          onPressed: () async {
            fetchdata(url);
          },
          child: const Text(
            'Compute crr score',
            style: TextStyle(fontSize: 15),
          ),
        ),
        Text(
          crrScore,
          style: const TextStyle(fontSize: 15, color: Colors.green),
        ),
      ],
    );
  }
}
