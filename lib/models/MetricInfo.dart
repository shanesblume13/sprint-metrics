import 'package:flutter/material.dart';

class MetricInfo {
  final String? title;
  final IconData? icon;
  final Color? color;
  final int? ptsToQA, ptsPassedQA, rejectionsPassedQA, velocityGoal;
  final double? failRateGoal;

  MetricInfo({
    this.title,
    this.icon,
    this.color,
    this.ptsToQA,
    this.ptsPassedQA,
    this.rejectionsPassedQA,
    this.velocityGoal,
    this.failRateGoal,
  });
}

List<MetricInfo> demoCurrentMetrics = [
  MetricInfo(
    title: "Mobile",
    icon: Icons.mobile_screen_share,
    color: Colors.yellow,
    ptsToQA: 1,
    ptsPassedQA: 3,
    rejectionsPassedQA: 1,
    velocityGoal: 3,
    failRateGoal: 10,
  ),
  MetricInfo(
    title: "Core Services",
    icon: Icons.speed,
    color: Colors.red,
    ptsToQA: 5,
    ptsPassedQA: 9,
    rejectionsPassedQA: 1,
    velocityGoal: 15,
    failRateGoal: 10,
  ),
  MetricInfo(
    title: "Enhancement",
    icon: Icons.new_releases,
    color: Colors.blue,
    ptsToQA: 5,
    ptsPassedQA: 7,
    rejectionsPassedQA: 0,
    velocityGoal: 10,
    failRateGoal: 10,
  ),
  MetricInfo(
    title: "Front End",
    icon: Icons.code,
    color: Colors.purple,
    ptsToQA: 5,
    ptsPassedQA: 12,
    rejectionsPassedQA: 1,
    velocityGoal: 10,
    failRateGoal: 10,
  ),
  MetricInfo(
    title: "EC",
    icon: Icons.map,
    color: Colors.orange,
    ptsToQA: 8,
    ptsPassedQA: 12,
    rejectionsPassedQA: 2,
    velocityGoal: 15,
    failRateGoal: 15,
  ),
  MetricInfo(
    title: "New Dev",
    icon: Icons.science,
    color: Colors.green,
    ptsToQA: 0,
    ptsPassedQA: 20,
    rejectionsPassedQA: 0,
    velocityGoal: 3,
    failRateGoal: 10,
  ),
  MetricInfo(
    title: "Design",
    icon: Icons.design_services,
    color: Colors.pink,
    ptsToQA: 5,
    ptsPassedQA: 0,
    rejectionsPassedQA: 0,
    velocityGoal: 0,
    failRateGoal: 0,
  ),
  MetricInfo(
    title: "No Team",
    icon: Icons.person,
    color: Colors.white,
    ptsToQA: 5,
    ptsPassedQA: 0,
    rejectionsPassedQA: 0,
    velocityGoal: 0,
    failRateGoal: 10,
  ),
];
