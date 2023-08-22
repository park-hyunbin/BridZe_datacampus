import 'package:http/http.dart' as http;

Future<void> executeFile() async {
  final url = Uri.parse('https://daitso.run.goorm.site/execute');
  final response = await http.get(url);

  if (response.statusCode == 200) {
    print('File executed successfully');
  } else {
    print('Error executing file: ${response.body}');
  }
}
