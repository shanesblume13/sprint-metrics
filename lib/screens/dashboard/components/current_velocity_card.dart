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
    return Container(
      margin: EdgeInsets.only(top: defaultPadding),
      child: Material(
        child: InkWell(
          onTap: () {
            print('Tap detected');
          },
          splashColor: color,
          child: Container(
            padding: EdgeInsets.all(defaultPadding),
            decoration: BoxDecoration(
              border:
                  Border.all(width: 2, color: primaryColor.withOpacity(0.2)),
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
                    padding:
                        const EdgeInsets.symmetric(horizontal: defaultPadding),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          "$velocity pts / $goal goal",
                          style: Theme.of(context)
                              .textTheme
                              .caption!
                              .copyWith(color: Colors.white70),
                        ),
                        ProgressLine(
                          color: color,
                          percentage: calculatePercentage(),
                        ),
                      ],
                    ),
                  ),
                ),
                Text('${calculatePercentage().toStringAsFixed(0)}%')
              ],
            ),
          ),
        ),
      ),
    );
  }

  double calculatePercentage() {
    if (goal == 0) {
      return 100;
    }
    return 100 * (velocity / goal);
  }
}

class ProgressLine extends StatelessWidget {
  const ProgressLine({
    Key? key,
    this.color = primaryColor,
    required this.percentage,
  }) : super(key: key);

  final Color? color;
  final double? percentage;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 5,
          decoration: BoxDecoration(
            color: primaryColor.withOpacity(0.1),
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
        ),
        LayoutBuilder(
          builder: (context, constraints) => Container(
            width: constraints.maxWidth * (percentage! / 100),
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
