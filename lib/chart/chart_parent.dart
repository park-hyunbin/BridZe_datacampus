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
    return MaterialApp(home: _ParentPage());
  }
}

class _ParentPage extends StatefulWidget {
  @override
  _ParentPageState createState() => _ParentPageState();
}

class _ParentPageState extends State<_ParentPage> {
  late List<_ChartData> data;
  late TooltipBehavior _tooltip;

  @override
  void initState() {
    data = [
      _ChartData(
        '성인 베트남인 평균 점수',
        75,
        Color(int.parse('D3EAFF', radix: 16)).withOpacity(1.0),
      ),
      _ChartData(
        '아린이 부모님 점수',
        45,
        const Color.fromARGB(255, 150, 185, 219),
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
            'assets/images/parent_background.png',
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
                      '아린이 부모님 언어평가 결과',
                      style: TextStyle(
                        fontFamily: 'BMJUA',
                        fontSize: 50,
                      ),
                    ),
                    SizedBox(
                      height: 20,
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
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: 300,
                      height: 80,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        color: Color(int.parse('D3EAFF', radix: 16))
                            .withOpacity(1.0),
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
