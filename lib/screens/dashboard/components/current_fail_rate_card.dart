import 'package:admin/screens/dashboard/components/current_metric_card.dart';
import 'package:flutter/material.dart';

class CurrentFailRateCard extends StatelessWidget {
  const CurrentFailRateCard({
    Key? key,
    required this.title,
    required this.icon,
    required this.goal,
    required this.rejectionsPassedQA,
    required this.ptsPassedQA,
    required this.color,
  }) : super(key: key);

  final String title;
  final int rejectionsPassedQA, ptsPassedQA;
  final double goal;
  final IconData icon;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return CurrentMetricCard(
      color: color,
      icon: icon,
      title: title,
      progressPercentDisplay: '${calculateFailRate().toStringAsFixed(0)}%',
      progressLineCurrent: calculateFailRate(),
      progressLineMax: goal,
      subTitle:
          "$rejectionsPassedQA rej / $ptsPassedQA pts / ${calculateFailRate().toStringAsFixed(0)}% goal",
    );
  }

  double calculateFailRate() {
    if (ptsPassedQA == 0) {
      return 0;
    } else {
      return 100 * (rejectionsPassedQA / ptsPassedQA);
    }
  }
}
