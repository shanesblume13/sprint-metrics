import 'package:admin/models/MetricInfo.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';
import 'current_velocity_chart.dart';
import 'current_velocity_card.dart';

class CurrentVelocity extends StatelessWidget {
  const CurrentVelocity({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var sortedList = demoTeamVelocityInfo;
    sortedList.sort((a, b) {
      if (b.velocityGoal == 0) return 0;
      return ((b.ptsToQA ?? 0) / (b.velocityGoal ?? 100))
          .compareTo((a.ptsToQA ?? 0) / (a.velocityGoal ?? 100));
    });

    return Container(
      padding: EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(
        color: secondaryColor,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Current Velocity",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: defaultPadding),
          CurrentVelocityChart(
            teamVelocityInfoList: demoTeamVelocityInfo,
          ),
          Column(
            children: getCurrentVelocityCards(sortedList),
          ),
        ],
      ),
    );
  }

  List<CurrentVelocityCard> getCurrentVelocityCards(
      List<MetricInfo> sortedList) {
    List<CurrentVelocityCard> test = [];

    for (var item in sortedList) {
      test.add(
        CurrentVelocityCard(
          icon: item.icon ?? Icons.broken_image,
          title: item.title ?? "",
          goal: item.velocityGoal ?? 0,
          velocity: item.ptsToQA ?? 0,
          color: item.color ?? Colors.white,
        ),
      );
    }

    return test;
  }
}

List<MetricInfo> demoTeamVelocityInfo = demoCurrentMetrics;
