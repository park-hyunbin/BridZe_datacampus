import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<void> imageupload(imageFile) async {
  http.Response aresponse = await http.get(
    Uri.parse(imageFile!.path),
  );

  if (aresponse.statusCode == 200) {
    var request = http.MultipartRequest(
      "POST",
      Uri.parse("https://daitso.run.goorm.site/image"),
    );

    var audio = http.MultipartFile.fromBytes(
      'image',
      aresponse.bodyBytes,
      filename: 'test.jpg',
    );

    request.files.add(audio);

    // respond
    var response = await request.send();
    var responseData = await response.stream.toBytes();
    var result = utf8.decode(responseData);

    // output
    print(result);
  } else {
    print('HTTP Error: ${aresponse.statusCode}');
  }
}

Future<void> videoupload(videoFile, int num) async {
  http.Response aresponse = await http.get(
    Uri.parse(videoFile!.path),
  );
  String server = "https://daitso.run.goorm.site/video/$num";
  if (aresponse.statusCode == 200) {
    var request = http.MultipartRequest(
      "POST",
      Uri.parse(server),
    );

    var video = http.MultipartFile.fromBytes(
      'video',
      aresponse.bodyBytes,
      filename: 'video$num.mp4',
    );

    request.files.add(video);

    // respond
    var response = await request.send();
    var responseData = await response.stream.toBytes();
    var result = utf8.decode(responseData);

    // output
    print(result);
  } else {
    print('HTTP Error: ${aresponse.statusCode}');
  }
}
