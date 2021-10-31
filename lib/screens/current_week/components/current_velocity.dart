import 'package:admin/constants.dart';
import 'package:admin/controllers/MetricController.dart';
import 'package:admin/models/MetricInfo.dart';
import 'package:admin/screens/current_week/components/current_velocity_chart.dart';
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
  MetricController metricController = new MetricController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    MetricController controller = new MetricController();

    return FutureBuilder<List<MetricInfo>>(
      future: controller.getWeeklyTeamVelocityMetrics(-1),
      builder: (context, AsyncSnapshot<List<MetricInfo>> snapshot) {
        if (snapshot.hasData && snapshot.data != null) {
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
                  metricInfos: snapshot.data!,
                ),
                Column(
                  children: getCurrentVelocityCards(snapshot.data!),
                ),
              ],
            ),
          );
        } else if (snapshot.hasData) {
          return Text('No Velocity Metrics Found');
        } else if (snapshot.hasError) {
          return Text('Error Retriving Velocity Metrics');
        }

        return const CircularProgressIndicator();
      },
    );
  }
}
