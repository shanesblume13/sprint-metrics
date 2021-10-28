import 'package:admin/models/TeamVelocityInfo.dart';
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
    sortedList.sort((a, b) => ((b.velocity ?? 0) / (b.goal ?? 100))
        .compareTo((a.velocity ?? 0) / (a.goal ?? 100)));

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

  List<WeeklyVelocityCard> getWeeklyVelocityCards(
      List<TeamVelocityInfo> sortedList) {
    List<WeeklyVelocityCard> test = [];

    for (var item in sortedList) {
      test.add(
        WeeklyVelocityCard(
          icon: item.icon ?? Icons.broken_image,
          title: item.title ?? "",
          goal: item.goal ?? 0,
          velocity: item.velocity ?? 0,
          color: item.color ?? Colors.white,
        ),
      );
    }

    return test;
  }
}

List<TeamVelocityInfo> demoTeamVelocityInfo = [
  TeamVelocityInfo(
    title: "Mobile",
    velocity: 1,
    icon: Icons.phone_android,
    goal: 3,
    color: Colors.yellow,
  ),
  TeamVelocityInfo(
    title: "Core Services",
    velocity: 12,
    icon: Icons.speed,
    goal: 15,
    color: Colors.red,
  ),
  TeamVelocityInfo(
    title: "Enhancement",
    velocity: 7,
    icon: Icons.new_releases,
    goal: 10,
    color: Colors.blue,
  ),
  TeamVelocityInfo(
    title: "Front End",
    velocity: 3,
    icon: Icons.code,
    goal: 15,
    color: Colors.purple,
  ),
  TeamVelocityInfo(
    title: "EC",
    velocity: 8,
    icon: Icons.map,
    goal: 15,
    color: Colors.orange,
  ),
  TeamVelocityInfo(
    title: "New Dev",
    velocity: 2,
    icon: Icons.science,
    goal: 15,
    color: Colors.green,
  ),
  TeamVelocityInfo(
    title: "Design",
    velocity: 2,
    icon: Icons.design_services,
    goal: 15,
    color: Colors.pink,
  ),
  TeamVelocityInfo(
    title: "No Team",
    velocity: 2,
    icon: Icons.person,
    goal: 15,
    color: Colors.white,
  ),
];
