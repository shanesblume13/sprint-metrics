import 'dart:math';
import 'package:admin/models/MetricInfo.dart';
import 'package:admin/screens/dashboard/components/current_metric_pie_chart.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';

class CurrentVelocityChart extends StatelessWidget {
  const CurrentVelocityChart({
    Key? key,
    required this.metricInfos,
  }) : super(key: key);

  final List<MetricInfo> metricInfos;

  @override
  Widget build(BuildContext context) {
    return CurrentMetricPieChart(
      title: calcTotalVelocity(metricInfos).toString(),
      subTitle: "of 41",
      pieChartData: getCurrentMetricPieChartData(metricInfos),
    );
  }
}

int calcTotalVelocity(List<MetricInfo> metricInfos) {
  int totalVelocity = 0;

  for (var item in metricInfos) {
    totalVelocity += item.ptsToQA;
  }

  return totalVelocity;
}

List<PieChartMetricData> getCurrentMetricPieChartData(
    List<MetricInfo> metricInfos) {
  List<PieChartMetricData> chartData = [];
  for (var info in metricInfos) {
    chartData.add(PieChartMetricData(
      color: info.color,
      value: info.ptsToQA.toDouble(),
      radius: 20,
    ));
  }

  chartData.sort((a, b) => b.value.compareTo(a.value));

  chartData.add(
    PieChartMetricData(
      color: primaryColor.withOpacity(0.15),
      value: max(41 - calcTotalVelocity(metricInfos).toDouble(), 0),
      radius: 5,
    ),
  );

  return chartData;
}
