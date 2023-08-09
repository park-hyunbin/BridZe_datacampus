import 'package:bridze/screen/daignosis_2/apple.dart';
import 'package:flutter/material.dart';

class Language2Page extends StatefulWidget {
  const Language2Page({Key? key}) : super(key: key);

  @override
  State<Language2Page> createState() => Language2PageState();
}

class Language2PageState extends State<Language2Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(238, 243, 246, 1),
      body: Stack(
        children: [
          Image.asset(
            'assets/images/diagnosis_kid.png',
            fit: BoxFit.cover,
            width: 1440,
            height: 1024,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  top: 30,
                  left: 30,
                ),
                child: Row(
                  children: [
                    Image.asset(
                      'assets/images/glasses.png',
                    ),
                    const SizedBox(width: 10),
                    const Text(
                      "Bước 3",
                      style: TextStyle(
                        fontSize: 40,
                        fontFamily: 'Rowdies',
                      ),
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 40, top: 30),
                child: Text(
                  "두 번째 언어 능력 평가를 시작합니다.\n화면에 나오는 그림의 첫 글자와 동일한 첫 글자를\n가지는 그림을 시간 내에 최대한 많이 골라주세요.",
                  style: TextStyle(
                    fontSize: 40,
                    fontFamily: 'BMJUA',
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 40, top: 30),
                child: Text(
                  "Bắt đầu đánh giá năng lực ngôn ngữ thứ hai.\nHãy chọn càng nhiều càng tốt những bức tranh có chữ\ncái đầu tiên giống với chữ cái đầu tiên trên màn hình.",
                  style: TextStyle(
                    fontFamily: 'Rowdies',
                    fontSize: 40,
                    color: Color(0xff8EB5FF),
                  ),
                ),
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(
                        0, 0, 40, 40), // Add spacing here
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ApplePage(),
                          ),
                        );
                      },
                      child: Image.asset("assets/images/cursor.png",
                          width: 100, height: 100),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
