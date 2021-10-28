import 'package:flutter/material.dart';

import '../../../constants.dart';

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
    return Container(
      margin: EdgeInsets.only(top: defaultPadding),
      padding: EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(
        border: Border.all(width: 2, color: primaryColor.withOpacity(0.15)),
        borderRadius: const BorderRadius.all(
          Radius.circular(defaultPadding),
        ),
      ),
      child: Row(
        children: [
          SizedBox(
            height: 20,
            width: 20,
            child: Icon(
              icon,
              color: color,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    "$rejectionsPassedQA rej / $ptsPassedQA pts / ${goal.toStringAsFixed(0)}% goal",
                    style: Theme.of(context)
                        .textTheme
                        .caption!
                        .copyWith(color: Colors.white70),
                  ),
                  ProgressLine(
                    color: color,
                    percentage: calculatePercentage(),
                    goal: goal,
                  ),
                ],
              ),
            ),
          ),
          Text(
            '${calculatePercentage().toStringAsFixed(0)}%',
          ),
        ],
      ),
    );
  }

  double calculatePercentage() {
    if (ptsPassedQA == 0) {
      return 0;
    } else {
      return 100 * (rejectionsPassedQA / ptsPassedQA);
    }
  }
}

class ProgressLine extends StatelessWidget {
  const ProgressLine({
    Key? key,
    this.color = primaryColor,
    required this.percentage,
    required this.goal,
  }) : super(key: key);

  final Color? color;
  final double? percentage;
  final double? goal;

  @override
  Widget build(BuildContext context) {
    double constraintPercentage = 0;

    if ((percentage ?? 0) > 0) {
      constraintPercentage = 100 * ((percentage ?? 0) / (goal ?? 100));
    }

    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 5,
          decoration: BoxDecoration(
            color: color!.withOpacity(0.1),
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
        ),
        LayoutBuilder(
          builder: (context, constraints) => Container(
            width: constraints.maxWidth * (constraintPercentage / 100),
            height: 5,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
          ),
        ),
      ],
    );
  }
}
