import 'package:admin/constants.dart';
import 'package:flutter/material.dart';

class CurrentMetricCard extends StatelessWidget {
  const CurrentMetricCard({
    Key? key,
    required this.color,
    required this.icon,
    required this.title,
    required this.progressPercentDisplay,
    required this.progressLineCurrent,
    required this.progressLineMax,
    required this.subTitle,
  }) : super(key: key);

  final Color color;
  final IconData icon;
  final String title;
  final String progressPercentDisplay;
  final double progressLineCurrent;
  final double progressLineMax;
  final String subTitle;

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
                          subTitle,
                          style: Theme.of(context)
                              .textTheme
                              .caption!
                              .copyWith(color: Colors.white70),
                        ),
                        ProgressLine(
                          color: color,
                          percentage: progressLineCurrent,
                          goal: progressLineMax,
                        ),
                      ],
                    ),
                  ),
                ),
                Text(
                  progressPercentDisplay,
                ),
              ],
            ),
          ),
        ),
      ),
    );
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
            color: primaryColor.withOpacity(0.1),
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
