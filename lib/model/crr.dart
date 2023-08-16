import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Score extends StatefulWidget {
  final String initialValue;

  const Score({Key? key, required this.initialValue}) : super(key: key);

  @override
  _ScoreState createState() => _ScoreState();
}

class _ScoreState extends State<Score> {
  late String value;
  late String url;
  String crrScore = '';

  @override
  void initState() {
    super.initState();
    value = widget.initialValue;
    url = 'https://daitso105.run.goorm.site/crr?query=$value';
  }

  void fetchdata(String url) async {
    http.Response response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      setState(() {
        crrScore = response.body;
      });
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
          crrScore.toString(),
          style: const TextStyle(fontSize: 15, color: Colors.green),
        )
      ],
    );
  }
}
