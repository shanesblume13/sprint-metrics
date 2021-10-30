import 'dart:math';

import 'package:admin/constants.dart';
import 'package:admin/models/MetricInfo.dart';
import 'package:admin/screens/dashboard/components/current_metric_pie_chart.dart';
import 'package:flutter/material.dart';

class CurrentFailRateChart extends StatelessWidget {
  final List<MetricInfo> metricInfos;

  const CurrentFailRateChart({
    Key? key,
    required this.metricInfos,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CurrentMetricPieChart(
      title: '${calcTotalFailRate(metricInfos).toStringAsFixed(0)}%',
      subTitle: "of 10%",
      pieChartData: getPieChartSectionData(metricInfos),
    );
  }

  double calcTotalFailRate(List<MetricInfo> demoTeamMetricInfo) {
    int rejectionsPassedQA = 0;
    int ptsPassedQA = 0;
    double failRate = 0;

    for (var item in demoTeamMetricInfo) {
      rejectionsPassedQA += item.rejectionsPassedQA;
      ptsPassedQA += item.ptsPassedQA;
    }

    if (ptsPassedQA == 0) {
      failRate = 0;
    } else {
      failRate = 100 * (rejectionsPassedQA.toDouble() / ptsPassedQA.toDouble());
    }

    return failRate;
  }

  double calcSumOfTeamFailRates(List<MetricInfo> teamMetricInfoList) {
    double sumOfTeamFailRates = 0;

    for (var info in teamMetricInfoList) {
      double failRate = 0;

      if ((info.ptsPassedQA) > 0) {
        failRate = 100 *
            ((info.rejectionsPassedQA).toDouble() /
                (info.ptsPassedQA).toDouble());
      }

      sumOfTeamFailRates += failRate;
    }
    return sumOfTeamFailRates;
  }

  double calcTeamFailRateSectionValue(
      MetricInfo info, double sumOfTeamFailRates, double totalFailRate) {
    double teamFailRate = 0;
    double teamFailRateFractionOfTotalFailRate = 0;
    double teamValue = 0;

    if ((info.ptsPassedQA) == 0) {
      teamFailRate = 0;
    } else {
      teamFailRate = 100 *
          ((info.rejectionsPassedQA).toDouble() /
              (info.ptsPassedQA).toDouble());
    }

    if (sumOfTeamFailRates > 0) {
      teamFailRateFractionOfTotalFailRate = (teamFailRate / sumOfTeamFailRates);
      teamValue = totalFailRate * teamFailRateFractionOfTotalFailRate;
    }

    return teamValue;
  }

  List<PieChartMetricData> getPieChartSectionData(
      List<MetricInfo> metricInfos) {
    List<PieChartMetricData> chartData = [];

    double totalFailRate = calcTotalFailRate(metricInfos);
    double remainingFailRate = max(10.0 - totalFailRate, 0);
    double sumOfTeamFailRates = calcSumOfTeamFailRates(metricInfos);

    for (var info in metricInfos) {
      double teamValue =
          calcTeamFailRateSectionValue(info, sumOfTeamFailRates, totalFailRate);

      chartData.add(
        PieChartMetricData(
          color: info.color,
          value: teamValue,
          radius: 20,
        ),
      );
    }

    chartData.sort((a, b) => b.value.compareTo(a.value));

    chartData.add(
      PieChartMetricData(
        color: primaryColor.withOpacity(0.15),
        value: remainingFailRate,
        radius: 5,
      ),
    );

    return chartData;
  }
}
