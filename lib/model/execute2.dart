import 'package:http/http.dart' as http;

Future<void> executeFile2() async {
  final url = Uri.parse('https://daitso.run.goorm.site/execute2');
  final response = await http.get(url);

  if (response.statusCode == 200) {
    print('File executed successfully');
  } else {
    print('Error executing file: ${response.body}');
  }
}

Future<void> v2f() async {
  final url = Uri.parse('https://daitso.run.goorm.site/v2f');
  final response = await http.get(url);

  if (response.statusCode == 200) {
    print('File executed successfully');
  } else {
    print('Error executing file: ${response.body}');
  }
}
