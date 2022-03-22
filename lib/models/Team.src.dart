import 'package:flutter/material.dart';

class Team {
  String title;
  Color color;
  IconData icon;
  List<Developer>? developers;
  List<Team>? teams;
  int velocityGoal;
  int failRateGoal;

  Team({
    required this.title,
    required this.color,
    required this.icon,
    this.developers,
    this.teams,
    required this.velocityGoal,
    required this.failRateGoal,
  });
}

class Developer {
  String name;
  IconData icon;
  Color color;

  Developer({
    required this.name,
    required this.icon,
    required this.color,
  });
}

class DeveloperTeam {
  Developer developer;
  Team team;

  DeveloperTeam({
    required this.developer,
    required this.team,
  });
}

Team demoTeam = Team(
  title: 'IT',
  color: Colors.white,
  icon: Icons.person,
  velocityGoal: 41,
  failRateGoal: 10,
  teams: <Team>[
    Team(
      title: 'Mobile',
      color: Colors.yellow,
      icon: Icons.phone_android,
      velocityGoal: 3,
      failRateGoal: 10,
      developers: <Developer>[
        Developer(
          name: 'First Last',
          icon: Icons.person,
          color: Colors.white,
        ),
      ],
    ),
  ],
);
