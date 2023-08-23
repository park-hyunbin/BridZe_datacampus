import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Diagnosis App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const PictureSave(),
    );
  }
}

class PictureSave extends StatefulWidget {
  const PictureSave({Key? key}) : super(key: key);

  @override
  _PictureSaveState createState() => _PictureSaveState();
}

class _PictureSaveState extends State<PictureSave> {
  List<String> serverUrls = [
    'https://daitso.run.goorm.site/download/image?emotion=happy',
    'https://daitso.run.goorm.site/download/image?emotion=angry',
    'https://daitso.run.goorm.site/download/image?emotion=sad',
    'https://daitso.run.goorm.site/download/image?emotion=fear',
    'https://daitso.run.goorm.site/download/image?emotion=neutral',
  ];

  List<Image> images = List.filled(5, Image.network(''));

  @override
  void initState() {
    super.initState();
    _fetchImages();
  }

  Future<void> _fetchImages() async {
    for (int i = 0; i < serverUrls.length; i++) {
      try {
        final response = await http.get(Uri.parse(serverUrls[i]));
        if (response.statusCode == 200) {
          setState(() {
            images[i] = Image.memory(response.bodyBytes, fit: BoxFit.cover);
          });
        } else {
          print('Failed to fetch image from server $i');
        }
      } catch (e) {
        print('Error fetching image from server $i: $e');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      extendBodyBehindAppBar: true,
      body: Stack(children: <Widget>[
        Image.asset(
          'assets/images/diagnosis_home.png',
          fit: BoxFit.cover,
          width: 1440,
          height: 1024,
        ),
        Padding(
          padding: const EdgeInsets.only(
            top: 40,
            left: 20,
          ),
          child: Column(
            children: <Widget>[
              const Text(
                '감정을 나타내는 표정들',
                style: TextStyle(
                  fontFamily: 'BMJUA',
                  fontSize: 40,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              const Text(
                '부모님이 참고해주세요!',
                style: TextStyle(
                  fontFamily: 'BMJUA',
                  fontSize: 24,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 50,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(
                      flex: 1,
                      child: Container(
                        width: 300,
                        height: 200,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.black,
                            width: 2.0,
                          ),
                        ),
                        child: images[0],
                      ),
                    ),
                    const SizedBox(width: 40),
                    Flexible(
                      flex: 1,
                      child: Container(
                        width: 300,
                        height: 200,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.black,
                            width: 2.0,
                          ),
                        ),
                        child: images[1],
                      ),
                    ),
                    const SizedBox(
                      width: 40,
                    ),
                    Flexible(
                      flex: 1,
                      child: Container(
                        width: 300,
                        height: 200,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.black,
                            width: 2.0,
                          ),
                        ),
                        child: images[2],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                    flex: 1,
                    child: Container(
                      width: 300,
                      height: 200,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black,
                          width: 2.0,
                        ),
                      ),
                      child: images[3],
                    ),
                  ),
                  const SizedBox(width: 40),
                  Flexible(
                    flex: 1,
                    child: Container(
                      width: 300,
                      height: 200,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black,
                          width: 2.0,
                        ),
                      ),
                      child: images[4],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                width: 700,
                height: 70,
                decoration: BoxDecoration(
                  color: const Color.fromRGBO(254, 202, 202, 1.0),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Center(
                  child: Text(
                    "감정과 표정을 잘 알아야 유대관계와 정서에 좋아요",
                    style: TextStyle(
                      fontFamily: "BMJUA",
                      fontSize: 27,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
