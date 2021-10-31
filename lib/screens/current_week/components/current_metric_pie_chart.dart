import 'package:admin/constants.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class CurrentMetricPieChart extends StatelessWidget {
  const CurrentMetricPieChart({
    Key? key,
    required this.title,
    required this.subTitle,
    required this.pieChartData,
  }) : super(key: key);

  final String title;
  final String subTitle;
  final List<PieChartMetricData> pieChartData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Stack(
        children: [
          PieChart(
            PieChartData(
              sectionsSpace: 0,
              centerSpaceRadius: 70,
              startDegreeOffset: -90,
              sections: getPieChartSectionsFromData(),
            ),
          ),
          Positioned.fill(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: defaultPadding),
                Text(
                  title,
                  style: Theme.of(context).textTheme.headline4!.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        height: 0.5,
                      ),
                ),
                Text(
                  subTitle,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  List<PieChartSectionData> getPieChartSectionsFromData() {
    return pieChartData.map((pieChartData) {
      return PieChartSectionData(
        color: pieChartData.color,
        value: pieChartData.value,
        radius: pieChartData.radius,
        showTitle: false,
      );
    }).toList();
  }
}

class PieChartMetricData {
  const PieChartMetricData({
    required this.color,
    required this.value,
    required this.radius,
  });

  final Color color;
  final double value;
  final double radius;
}
