import 'package:flutter/material.dart';

class MetricInfo {
  final String? title;
  final int? velocity, goal;
  final IconData? icon;
  final Color? color;

  MetricInfo({
    this.title,
    this.goal,
    this.velocity,
    this.icon,
    this.color,
  });
}

List demoCurrentMetrics = [
  MetricInfo(
    title: "Mobile",
    velocity: 5,
    icon: Icons.mobile_screen_share,
    goal: 3,
    color: Colors.yellow,
  ),
  MetricInfo(
    title: "Core Services",
    velocity: 6,
    icon: Icons.speed,
    goal: 5,
    color: Colors.red,
  ),
  MetricInfo(
    title: "Enhancement",
    velocity: 7,
    icon: Icons.upgrade,
    goal: 10,
    color: Colors.blue,
  ),
  MetricInfo(
    title: "Front End",
    velocity: 8,
    icon: Icons.code,
    goal: 15,
    color: Colors.purple,
  ),
  MetricInfo(
    title: "EC",
    velocity: 8,
    icon: Icons.map,
    goal: 15,
    color: Colors.orange,
  ),
  MetricInfo(
    title: "New Dev",
    velocity: 8,
    icon: Icons.new_releases,
    goal: 15,
    color: Colors.green,
  ),
  MetricInfo(
    title: "Design",
    velocity: 8,
    icon: Icons.design_services,
    goal: 15,
    color: Colors.pink,
  ),
  MetricInfo(
    title: "No Team",
    velocity: 8,
    icon: Icons.person,
    goal: 15,
    color: Colors.grey,
  ),
];
