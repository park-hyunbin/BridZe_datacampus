import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

void main() {
  runApp(const ChartApp());
}

class ChartApp extends StatefulWidget {
  const ChartApp({super.key});

  @override
  State<ChartApp> createState() => ChartAppState();
}

class ChartAppState extends State<ChartApp> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: LanguagePage(
        avrScore: '',
      ),
    );
  }
}

class LanguagePage extends StatefulWidget {
  final String avrScore;

  const LanguagePage({
    super.key,
    required this.avrScore,
  });

  @override
  LanguagePageState createState() => LanguagePageState();
}

class LanguagePageState extends State<LanguagePage> {
  late List<ChartData> data;
  late TooltipBehavior _tooltip;

  @override
  void initState() {
    data = [
      ChartData(
        '또래친구점수',
        75,
        const Color.fromRGBO(254, 202, 202, 1.0),
      ),
      ChartData(
        '아린이점수',
        double.tryParse(widget.avrScore) ?? 0.0,
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
                    series: <ChartSeries<ChartData, String>>[
                      BarSeries<ChartData, String>(
                        dataSource: data,
                        xValueMapper: (ChartData data, _) => data.x,
                        yValueMapper: (ChartData data, _) => data.y,
                        name: '언어 평가',
                        pointColorMapper: (ChartData data, _) => data.color,
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

class ChartData {
  final String x;
  final double y;
  final Color color;

  ChartData(this.x, this.y, this.color);
}
