import 'package:admin/models/MetricInfo.dart';
import 'package:admin/screens/current_week/components/current_metric_card.dart';
import 'package:flutter/material.dart';

class CurrentVelocityCard extends StatelessWidget {
  const CurrentVelocityCard({
    Key? key,
    required this.metricInfo,
  }) : super(key: key);

  final MetricInfo metricInfo;

  @override
  Widget build(BuildContext context) {
    return CurrentMetricCard(
      color: metricInfo.color,
      icon: metricInfo.icon,
      title: metricInfo.title,
      progressLineDisplay: '${calculatePercentToGoal().toStringAsFixed(0)}%',
      progressLineCurrent: calculatePercentToGoal(),
      progressLineMax: 100,
      subTitle: '${metricInfo.ptsToQA} pts / ${metricInfo.velocityGoal} goal',
    );
  }

  int calcTotalVelocity(List<MetricInfo> metricInfos) {
    int totalVelocity = 0;

    for (var item in metricInfos) {
      totalVelocity += item.ptsToQA;
    }

    return totalVelocity;
  }

  double calculatePercentToGoal() {
    if ((metricInfo.velocityGoal) == 0) {
      return 100;
    }
    return 100 * ((metricInfo.ptsToQA) / (metricInfo.velocityGoal).toDouble());
  }
}

List<CurrentVelocityCard> getCurrentVelocityCards(
    List<MetricInfo> metricInfos) {
  List<CurrentVelocityCard> cards = [];

  for (var metricInfo in metricInfos) {
    cards.add(
      CurrentVelocityCard(metricInfo: metricInfo),
    );
  }

  return cards;
}
