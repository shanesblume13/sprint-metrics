import 'package:flutter/material.dart';

class TeamVelocityInfo {
  final String? title;
  final int? velocity, goal;
  final IconData? icon;
  final Color? color;

  TeamVelocityInfo({
    this.title,
    this.goal,
    this.velocity,
    this.icon,
    this.color,
  });
}

List demoCurrentVelocities = [
  TeamVelocityInfo(
    title: "Mobile",
    velocity: 5,
    icon: Icons.mobile_screen_share,
    goal: 3,
    color: Colors.yellow,
  ),
  TeamVelocityInfo(
    title: "Core Services",
    velocity: 6,
    icon: Icons.speed,
    goal: 5,
    color: Colors.red,
  ),
  TeamVelocityInfo(
    title: "Enhancement",
    velocity: 7,
    icon: Icons.upgrade,
    goal: 10,
    color: Colors.blue,
  ),
  TeamVelocityInfo(
    title: "Front End",
    velocity: 8,
    icon: Icons.code,
    goal: 15,
    color: Colors.purple,
  ),
  TeamVelocityInfo(
    title: "EC",
    velocity: 8,
    icon: Icons.map,
    goal: 15,
    color: Colors.orange,
  ),
  TeamVelocityInfo(
    title: "New Dev",
    velocity: 8,
    icon: Icons.new_releases,
    goal: 15,
    color: Colors.green,
  ),
  TeamVelocityInfo(
    title: "Design",
    velocity: 8,
    icon: Icons.design_services,
    goal: 15,
    color: Colors.pink,
  ),
  TeamVelocityInfo(
    title: "No Team",
    velocity: 8,
    icon: Icons.person,
    goal: 15,
    color: Colors.grey,
  ),
];
