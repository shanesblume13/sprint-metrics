import 'dart:math';
import 'package:admin/models/MetricInfo.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import '../../../constants.dart';

class CurrentFailRateChart extends StatelessWidget {
  final List<MetricInfo> teamMetricInfoList;

  const CurrentFailRateChart({
    Key? key,
    required this.teamMetricInfoList,
  }) : super(key: key);

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
              sections: getPieChartSectionData(teamMetricInfoList),
            ),
          ),
          Positioned.fill(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: defaultPadding),
                Text(
                  '${calcTotalFailRate(teamMetricInfoList).toStringAsFixed(0)}%',
                  style: Theme.of(context).textTheme.headline4!.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        height: 0.5,
                      ),
                ),
                Text("of 10%")
              ],
            ),
          ),
        ],
      ),
    );
  }
}

List<PieChartSectionData> getPieChartSectionData(
    List<MetricInfo> teamMetricInfoList) {
  List<PieChartSectionData> pieChartSectionData = [];

  double totalFailRate = calcTotalFailRate(teamMetricInfoList);
  double remainingFailRate = max(10.0 - totalFailRate, 0);
  double sumOfTeamFailRates = calcSumOfTeamFailRates(teamMetricInfoList);

  for (var info in teamMetricInfoList) {
    double teamValue =
        calcTeamFailRateSectionValue(info, sumOfTeamFailRates, totalFailRate);

    pieChartSectionData.add(
      PieChartSectionData(
        color: info.color,
        value: teamValue,
        showTitle: false,
        radius: 20,
      ),
    );
  }

  pieChartSectionData.sort((a, b) => b.value.compareTo(a.value));

  pieChartSectionData.add(
    PieChartSectionData(
      color: primaryColor.withOpacity(0.15),
      value: remainingFailRate,
      showTitle: false,
      radius: 5,
    ),
  );

  return pieChartSectionData;
}

double calcSumOfTeamFailRates(List<MetricInfo> teamMetricInfoList) {
  double sumOfTeamFailRates = 0;

  for (var info in teamMetricInfoList) {
    double failRate = 0;

    if ((info.ptsPassedQA ?? 0) > 0) {
      failRate = 100 *
          ((info.rejectionsPassedQA ?? 0).toDouble() /
              (info.ptsPassedQA ?? 0).toDouble());
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

  if ((info.ptsPassedQA ?? 0) == 0) {
    teamFailRate = 0;
  } else {
    teamFailRate = 100 *
        ((info.rejectionsPassedQA ?? 0).toDouble() /
            (info.ptsPassedQA ?? 100).toDouble());
  }

  teamFailRateFractionOfTotalFailRate = (teamFailRate / sumOfTeamFailRates);
  teamValue = totalFailRate * teamFailRateFractionOfTotalFailRate;
  return teamValue;
}

double calcTotalFailRate(List<MetricInfo> demoTeamMetricInfo) {
  int rejectionsPassedQA = 0;
  int ptsPassedQA = 0;
  double failRate = 0;

  for (var item in demoTeamMetricInfo) {
    rejectionsPassedQA += item.rejectionsPassedQA ?? 0;
    ptsPassedQA += item.ptsPassedQA ?? 0;
  }

  if (ptsPassedQA == 0) {
    failRate = 0;
  } else {
    failRate = 100 * (rejectionsPassedQA.toDouble() / ptsPassedQA.toDouble());
  }

  return failRate;
}
