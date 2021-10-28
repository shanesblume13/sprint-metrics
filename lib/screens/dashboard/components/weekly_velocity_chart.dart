import 'dart:math';

import 'package:admin/models/TeamVelocityInfo.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';

class WeeklyVelocityChart extends StatelessWidget {
  final List<TeamVelocityInfo> teamVelocityInfoList;

  const WeeklyVelocityChart({
    Key? key,
    required this.teamVelocityInfoList,
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
              sections: getPieChartSectionData(teamVelocityInfoList),
            ),
          ),
          Positioned.fill(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: defaultPadding),
                Text(
                  calcTotalVelocity(teamVelocityInfoList).toString(),
                  style: Theme.of(context).textTheme.headline4!.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        height: 0.5,
                      ),
                ),
                Text("of 41")
              ],
            ),
          ),
        ],
      ),
    );
  }
}

List<PieChartSectionData> getPieChartSectionData(
    List<TeamVelocityInfo> teamVelocityInfoList) {
  List<PieChartSectionData> pieChartSectionData = [];
  for (var info in teamVelocityInfoList) {
    pieChartSectionData.add(
      PieChartSectionData(
        color: info.color,
        value: info.velocity?.toDouble() ?? 0,
        showTitle: false,
        radius: 20,
      ),
    );
  }

  pieChartSectionData.sort((a, b) => b.value.compareTo(a.value));

  pieChartSectionData.add(
    PieChartSectionData(
      color: primaryColor.withOpacity(0.15),
      value: max(41 - calcTotalVelocity(teamVelocityInfoList).toDouble(), 0),
      showTitle: false,
      radius: 5,
    ),
  );

  return pieChartSectionData;
}

int calcTotalVelocity(List<TeamVelocityInfo> demoTeamVelocityInfo) {
  int totalVelocity = 0;

  for (var item in demoTeamVelocityInfo) {
    totalVelocity += item.velocity ?? 0;
  }

  return totalVelocity;
}
