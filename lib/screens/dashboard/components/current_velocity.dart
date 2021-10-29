import 'package:admin/constants.dart';
import 'package:admin/data/jira_api.dart';
import 'package:admin/models/Case.dart';
import 'package:admin/models/MetricInfo.dart';
import 'package:admin/screens/dashboard/components/current_velocity_chart.dart';
import 'package:flutter/material.dart';
import 'current_velocity_card.dart';

class CurrentVelocity extends StatefulWidget {
  const CurrentVelocity({
    Key? key,
  }) : super(key: key);

  @override
  State<CurrentVelocity> createState() => _CurrentVelocityState();
}

class _CurrentVelocityState extends State<CurrentVelocity> {
  late Future<List<Case>> caseList;

  @override
  void initState() {
    super.initState();
    caseList = fetchIssues(0);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Case>>(
      future: caseList,
      builder: (context, AsyncSnapshot<List<Case>> snapshot) {
        if (snapshot.hasData) {
          List<MetricInfo> metricInfos =
              getTeamVelocityMetricsFromCases(snapshot.data ?? []);

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
                  metricInfos: metricInfos,
                ),
                Column(
                  children: getCurrentVelocityCards(metricInfos),
                ),
              ],
            ),
          );
        } else if (snapshot.hasError) {
          return Text('Bad');
        }

        return const CircularProgressIndicator();
      },
    );
  }
}
