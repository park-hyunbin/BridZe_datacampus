import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

// 서버와 첫 연결을 위한 페이지

void main() {
  runApp(const ConnectionPage());
}

class ConnectionPage extends StatefulWidget {
  const ConnectionPage({super.key});

  @override
  _ConnectionState createState() => _ConnectionState();
}

class _ConnectionState extends State<ConnectionPage> {
  String responseText = '';

  Future<void> fetchData() async {
    final response =
        await http.get(Uri.parse('https://daitso105.run.goorm.site/audio'));

    if (response.statusCode == 200) {
      setState(() {
        responseText = response.body;
      });
    } else {
      setState(() {
        responseText = 'Error: ${response.statusCode}';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    fetchData();
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            '',
            style: TextStyle(fontSize: 1),
          ),
        ],
      ),
    );
  }
}
