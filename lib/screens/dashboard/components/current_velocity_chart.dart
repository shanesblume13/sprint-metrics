import 'dart:math';

import 'package:admin/models/MetricInfo.dart';
import 'package:admin/screens/dashboard/components/current_metric_pie_chart.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';

class CurrentVelocityChart extends StatelessWidget {
  final List<MetricInfo> currentMetricList;

  const CurrentVelocityChart({
    Key? key,
    required this.currentMetricList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CurrentMetricPieChart(
      title: calcTotalVelocity(currentMetricList).toString(),
      subTitle: "of 41",
      pieChartData: getCurrentMetricPieChartData(currentMetricList),
    );
  }
}

int calcTotalVelocity(List<MetricInfo> demoTeamVelocityInfo) {
  int totalVelocity = 0;

  for (var item in demoTeamVelocityInfo) {
    totalVelocity += item.ptsToQA ?? 0;
  }

  return totalVelocity;
}

List<PieChartMetricData> getCurrentMetricPieChartData(
    List<MetricInfo> currentMetricList) {
  List<PieChartMetricData> chartData = [];
  for (var info in currentMetricList) {
    chartData.add(PieChartMetricData(
      color: info.color ?? primaryColor,
      value: info.ptsToQA?.toDouble() ?? 0,
      radius: 20,
    ));
  }

  chartData.sort((a, b) => b.value.compareTo(a.value));

  chartData.add(
    PieChartMetricData(
      color: primaryColor.withOpacity(0.15),
      value: max(41 - calcTotalVelocity(currentMetricList).toDouble(), 0),
      radius: 5,
    ),
  );

  return chartData;
}
