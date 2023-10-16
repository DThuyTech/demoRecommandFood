import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

List<LineChartBarData> lineChartBarData = [
  LineChartBarData(
    color:  Color(0xfff3f169),
    isCurved: true,
    spots: [
      FlSpot(1, 21),
      FlSpot(2, 24),
      FlSpot(3, 27),
      FlSpot(4, 25),
      FlSpot(5, 24),
      FlSpot(6, 25),
      FlSpot(7, 23)
    ]
  )
];
class LinearChartContent extends StatelessWidget {
  const LinearChartContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return LineChart(
      LineChartData(

        minX: 1,
        minY: 0,
        maxX: 8,
        maxY: 50,
        lineBarsData: lineChartBarData,



      )
    );
  }

}
