import 'package:admin/models/MetricInfo.dart';
import 'package:admin/screens/dashboard/components/weekly_fail_rate_card.dart';
import 'package:admin/screens/dashboard/components/weekly_fail_rate_chart.dart';
import 'package:flutter/material.dart';
import '../../../constants.dart';

class WeeklyFailRate extends StatelessWidget {
  const WeeklyFailRate({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var sortedList = demoTeamMetricInfo;
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
            "Weekly Fail Rate",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: defaultPadding),
          WeeklyFailRateChart(
            teamMetricInfoList: demoTeamMetricInfo,
          ),
          Column(
            children: getWeeklyFailRateCards(sortedList),
          ),
        ],
      ),
    );
  }

  List<WeeklyFailRateCard> getWeeklyFailRateCards(List<MetricInfo> sortedList) {
    List<WeeklyFailRateCard> test = [];

    for (var item in sortedList) {
      test.add(
        WeeklyFailRateCard(
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

List<MetricInfo> demoTeamMetricInfo = [
  MetricInfo(
    title: "Mobile",
    velocity: 1,
    icon: Icons.phone_android,
    goal: 3,
    color: Colors.yellow,
  ),
  MetricInfo(
    title: "Core Services",
    velocity: 12,
    icon: Icons.speed,
    goal: 15,
    color: Colors.red,
  ),
  MetricInfo(
    title: "Enhancement",
    velocity: 7,
    icon: Icons.new_releases,
    goal: 10,
    color: Colors.blue,
  ),
  MetricInfo(
    title: "Front End",
    velocity: 3,
    icon: Icons.code,
    goal: 15,
    color: Colors.purple,
  ),
  MetricInfo(
    title: "EC",
    velocity: 8,
    icon: Icons.map,
    goal: 15,
    color: Colors.orange,
  ),
  MetricInfo(
    title: "New Dev",
    velocity: 2,
    icon: Icons.science,
    goal: 15,
    color: Colors.green,
  ),
  MetricInfo(
    title: "Design",
    velocity: 2,
    icon: Icons.design_services,
    goal: 15,
    color: Colors.pink,
  ),
  MetricInfo(
    title: "No Team",
    velocity: 2,
    icon: Icons.person,
    goal: 15,
    color: Colors.white,
  ),
];
