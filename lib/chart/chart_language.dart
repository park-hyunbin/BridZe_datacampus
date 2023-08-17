import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

void main() {
  runApp(_ChartApp());
}

class _ChartApp extends StatefulWidget {
  @override
  State<_ChartApp> createState() => _ChartAppState();
}

class _ChartAppState extends State<_ChartApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: _LanguagePage(),
    );
  }
}

class _LanguagePage extends StatefulWidget {
  @override
  _LanguagePageState createState() => _LanguagePageState();
}

class _LanguagePageState extends State<_LanguagePage> {
  late List<_ChartData> data;
  late TooltipBehavior _tooltip;

  @override
  void initState() {
    data = [
      _ChartData(
        '또래친구점수',
        75,
        const Color.fromRGBO(254, 202, 202, 1.0),
      ),
      _ChartData(
        '아린이점수',
        45,
        const Color.fromARGB(255, 241, 133, 145),
      ),
    ];
    _tooltip = TooltipBehavior(enable: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'assets/images/desktop1_2.png',
            fit: BoxFit.cover,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
          ),
          Column(
            children: [
              const SizedBox(height: 70),
              const Center(
                child: Column(
                  children: [
                    Text(
                      '아린이의 언어평가 결과',
                      style: TextStyle(
                        fontFamily: 'BMJUA',
                        fontSize: 50,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      '* 상중하로 평가',
                      style: TextStyle(
                        fontFamily: 'BMJUA',
                        fontSize: 24,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 50),
              Center(
                child: Container(
                  width: 600,
                  height: 400,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black,
                      width: 2,
                    ),
                  ),
                  child: SfCartesianChart(
                    primaryXAxis: CategoryAxis(
                      labelStyle: const TextStyle(
                        fontFamily: 'BMJUA',
                        fontSize: 18,
                        color: Colors.black,
                      ),
                    ),
                    primaryYAxis: NumericAxis(
                      minimum: 0,
                      maximum: 100,
                      interval: 10,
                      labelStyle: const TextStyle(
                        fontFamily: 'BMJUA',
                        color: Colors.black,
                      ),
                    ),
                    tooltipBehavior: _tooltip,
                    series: <ChartSeries<_ChartData, String>>[
                      BarSeries<_ChartData, String>(
                        dataSource: data,
                        xValueMapper: (_ChartData data, _) => data.x,
                        yValueMapper: (_ChartData data, _) => data.y,
                        name: '언어 평가',
                        pointColorMapper: (_ChartData data, _) => data.color,
                        dataLabelSettings: const DataLabelSettings(
                          isVisible: true, // 데이터 레이블 활성화
                          textStyle: TextStyle(
                            fontFamily: 'BMJUA',
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 30),
              Center(
                child: Column(
                  children: [
                    const Text(
                      '발음 및 읽기 능력 평가',
                      style: TextStyle(
                        fontFamily: 'BMJUA',
                        fontSize: 24,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: 300,
                      height: 80,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        color: const Color.fromRGBO(229, 193, 197, 1.0),
                      ),
                      child: const Center(
                        child: Text(
                          '발음 평가 : 하',
                          style: TextStyle(
                            fontFamily: 'BMJUA',
                            fontSize: 30,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _ChartData {
  final String x;
  final double y;
  final Color color;

  _ChartData(this.x, this.y, this.color);
}
