import 'package:admin/controllers/MetricController.dart';
import 'package:admin/models/MetricInfo.dart';
import 'package:admin/screens/dashboard/components/current_fail_rate_card.dart';
import 'package:admin/screens/dashboard/components/current_fail_rate_chart.dart';
import 'package:flutter/material.dart';
import '../../../constants.dart';

class CurrentFailRate extends StatefulWidget {
  const CurrentFailRate({
    Key? key,
  }) : super(key: key);

  @override
  State<CurrentFailRate> createState() => _CurrentFailRateState();
}

class _CurrentFailRateState extends State<CurrentFailRate> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    MetricController controller = new MetricController();

    return FutureBuilder<List<MetricInfo>>(
      future: controller.getWeeklyTeamFailRateMetrics(0),
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
                  "Current Fail Rate",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: defaultPadding),
                CurrentFailRateChart(
                  metricInfos: snapshot.data!,
                ),
                Column(
                  children: getCurrentFailRateCards(snapshot.data!),
                ),
              ],
            ),
          );
        } else if (snapshot.hasData) {
          return Text('No Fail Rate Metrics Found');
        } else if (snapshot.hasError) {
          return Text('Error Retriving Fail Rate Metrics');
        }

        return const CircularProgressIndicator();
      },
    );
  }

  List<CurrentFailRateCard> getCurrentFailRateCards(
      List<MetricInfo> metricInfos) {
    List<CurrentFailRateCard> failRateCardList = [];

    for (var item in metricInfos) {
      failRateCardList.add(
        CurrentFailRateCard(
          icon: item.icon,
          title: item.title,
          goal: item.failRateGoal,
          rejectionsPassedQA: item.rejectionsPassedQA,
          ptsPassedQA: item.ptsPassedQA,
          color: item.color,
        ),
      );
    }

    return failRateCardList;
  }
}
