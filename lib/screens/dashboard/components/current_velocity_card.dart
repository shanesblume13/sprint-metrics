import 'package:admin/screens/dashboard/components/current_metric_card.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';

class CurrentVelocityCard extends StatelessWidget {
  const CurrentVelocityCard({
    Key? key,
    required this.title,
    required this.icon,
    required this.goal,
    required this.velocity,
    required this.color,
  }) : super(key: key);

  final String title;
  final int goal, velocity;
  final IconData icon;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return CurrentMetricCard(
      color: color,
      icon: icon,
      title: title,
      progressLineDisplay: '${calculatePercentToGoal().toStringAsFixed(0)}%',
      progressLineCurrent: calculatePercentToGoal(),
      progressLineMax: 100,
      subTitle: '$velocity pts / $goal goal',
    );
  }

  double calculatePercentToGoal() {
    if (goal == 0) {
      return 100;
    }
    return 100 * (velocity / goal);
  }
}
