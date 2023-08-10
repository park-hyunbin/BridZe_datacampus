import 'package:bridze/screen/diagnosis.dart';
import 'package:flutter/material.dart';

class DiagnosisEnd extends StatelessWidget {
  const DiagnosisEnd({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Image.asset(
            'assets/images/desktop1.png',
            fit: BoxFit.cover,
            width: 1440,
            height: 1024,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 40, top: 60),
                child: Text(
                  "진단이 끝났어요 !\n내 정보의 분석 결과를 클릭하여 확인해주세요.",
                  style: TextStyle(
                    fontSize: 40,
                    fontFamily: 'BMJUA',
                    color: Color(0xff000000),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 40, top: 30),
                child: Text(
                  "Đã chẩn oán xong rồi!\nVui lòng xác nhận bằng cách nhấp vào kết quả phân\ntích thông tin của tôi.",
                  style: TextStyle(
                    fontFamily: 'Sriracha',
                    fontSize: 40,
                    color: Color(0xff8EB5FF),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: SizedBox(
                  height: 80,
                  child: Center(
                    child: GestureDetector(
                      child: Container(
                        width: 300,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: const Center(
                          child: Text("내 정보 바로가기",
                              style: TextStyle(
                                fontFamily: "BMJUA",
                                fontSize: 30,
                              )),
                        ),
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const DiagnosisScreen(),
                          ),
                        );
                      },
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
