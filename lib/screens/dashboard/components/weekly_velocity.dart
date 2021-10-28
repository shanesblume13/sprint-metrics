import 'package:admin/models/MetricInfo.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';
import 'weekly_velocity_chart.dart';
import 'weekly_velocity_card.dart';

class WeeklyVelocity extends StatelessWidget {
  const WeeklyVelocity({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var sortedList = demoTeamVelocityInfo;
    sortedList.sort((a, b) => ((b.ptsToQA ?? 0) / (b.velocityGoal ?? 100))
        .compareTo((a.ptsToQA ?? 0) / (a.velocityGoal ?? 100)));

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
            "Weekly Velocity",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: defaultPadding),
          WeeklyVelocityChart(
            teamVelocityInfoList: demoTeamVelocityInfo,
          ),
          Column(
            children: getWeeklyVelocityCards(sortedList),
          ),
        ],
      ),
    );
  }

  List<WeeklyVelocityCard> getWeeklyVelocityCards(List<MetricInfo> sortedList) {
    List<WeeklyVelocityCard> test = [];

    for (var item in sortedList) {
      test.add(
        WeeklyVelocityCard(
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

List<MetricInfo> demoTeamVelocityInfo = [
  MetricInfo(
    title: "Mobile",
    ptsToQA: 1,
    icon: Icons.phone_android,
    velocityGoal: 3,
    color: Colors.yellow,
  ),
  MetricInfo(
    title: "Core Services",
    ptsToQA: 12,
    icon: Icons.speed,
    velocityGoal: 15,
    color: Colors.red,
  ),
  MetricInfo(
    title: "Enhancement",
    ptsToQA: 7,
    icon: Icons.new_releases,
    velocityGoal: 10,
    color: Colors.blue,
  ),
  MetricInfo(
    title: "Front End",
    ptsToQA: 3,
    icon: Icons.code,
    velocityGoal: 15,
    color: Colors.purple,
  ),
  MetricInfo(
    title: "EC",
    ptsToQA: 8,
    icon: Icons.map,
    velocityGoal: 15,
    color: Colors.orange,
  ),
  MetricInfo(
    title: "New Dev",
    ptsToQA: 2,
    icon: Icons.science,
    velocityGoal: 15,
    color: Colors.green,
  ),
  MetricInfo(
    title: "Design",
    ptsToQA: 2,
    icon: Icons.design_services,
    velocityGoal: 15,
    color: Colors.pink,
  ),
  MetricInfo(
    title: "No Team",
    ptsToQA: 2,
    icon: Icons.person,
    velocityGoal: 15,
    color: Colors.white,
  ),
];
