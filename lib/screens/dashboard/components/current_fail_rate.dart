import 'package:admin/models/MetricInfo.dart';
import 'package:admin/screens/dashboard/components/current_fail_rate_card.dart';
import 'package:admin/screens/dashboard/components/current_fail_rate_chart.dart';
import 'package:flutter/material.dart';
import '../../../constants.dart';

class CurrentFailRate extends StatelessWidget {
  const CurrentFailRate({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var sortedList = demoCurrentMetrics;
    sortedList.sort((a, b) {
      if ((b.ptsPassedQA ?? 0) == 0) {
        return 0;
      } else if ((a.ptsPassedQA ?? 0) == 0) {
        return 1;
      } else {
        return ((b.rejectionsPassedQA ?? 0) / (b.ptsPassedQA ?? 0))
            .compareTo((a.rejectionsPassedQA ?? 0) / (a.ptsPassedQA ?? 0));
      }
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
            "Current Fail Rate",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: defaultPadding),
          CurrentFailRateChart(
            teamMetricInfoList: demoCurrentMetrics,
          ),
          Column(
            children: getCurrentFailRateCards(sortedList),
          ),
        ],
      ),
    );
  }

  List<CurrentFailRateCard> getCurrentFailRateCards(
      List<MetricInfo> sortedList) {
    List<CurrentFailRateCard> failRateCardList = [];

    for (var item in sortedList) {
      failRateCardList.add(
        CurrentFailRateCard(
          icon: item.icon ?? Icons.broken_image,
          title: item.title ?? "",
          goal: item.failRateGoal ?? 10,
          rejectionsPassedQA: item.rejectionsPassedQA ?? 0,
          ptsPassedQA: item.ptsPassedQA ?? 0,
          color: item.color ?? Colors.white,
        ),
      );
    }

    return failRateCardList;
  }
}