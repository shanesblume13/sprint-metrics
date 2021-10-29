import 'package:admin/models/Team.dart';
import 'package:admin/models/Case.dart';
import 'package:flutter/material.dart';

class MetricInfo {
  final String title;
  final IconData icon;
  final Color color;
  int ptsToQA, ptsPassedQA, rejectionsPassedQA, velocityGoal;
  int failRateGoal;

  MetricInfo({
    required this.title,
    required this.icon,
    required this.color,
    required this.ptsToQA,
    required this.ptsPassedQA,
    required this.rejectionsPassedQA,
    required this.velocityGoal,
    required this.failRateGoal,
  });
}

List<MetricInfo> getTeamVelocityMetricsFromCases(List<Case> cases) {
  List<MetricInfo> metricInfos = [];
  List<Team> teams = demoITTeam.teams ?? [];
  List<DeveloperTeam> developerTeams = [];

  for (Team team in teams) {
    metricInfos.add(getEmptyMetricInfo(team));
    setTeamDevelopers(team, developerTeams);
  }

  for (Case c in cases) {
    for (DeveloperTeam dt in developerTeams) {
      if (c.developer == dt.developer.name) {
        MetricInfo metricInfo =
            metricInfos.where((m) => m.title == dt.team.title).first;

        metricInfo.ptsToQA += c.storyPoints;
      }
    }
  }

  sortMetricInfosByVelocityToGoal(metricInfos);

  return metricInfos;
}

void sortMetricInfosByVelocityToGoal(List<MetricInfo> metricInfos) {
  metricInfos.sort((a, b) {
    if (b.velocityGoal == 0) return 0;
    return ((b.ptsToQA) / (b.velocityGoal))
        .compareTo((a.ptsToQA) / (a.velocityGoal));
  });
}

void setTeamDevelopers(Team team, List<DeveloperTeam> developerTeams) {
  for (var developer in team.developers ?? []) {
    developerTeams.add(DeveloperTeam(developer: developer, team: team));
  }
}

MetricInfo getEmptyMetricInfo(Team team) {
  return MetricInfo(
    title: team.title,
    icon: team.icon,
    color: team.color,
    ptsToQA: 0,
    ptsPassedQA: 0,
    rejectionsPassedQA: 0,
    velocityGoal: team.velocityGoal,
    failRateGoal: team.failRateGoal,
  );
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
    ptsToQA: 17,
    ptsPassedQA: 9,
    rejectionsPassedQA: 1,
    velocityGoal: 15,
    failRateGoal: 10,
  ),
  MetricInfo(
    title: "Enhancement",
    icon: Icons.new_releases,
    color: Colors.blue,
    ptsToQA: 2,
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
    ptsToQA: 5,
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
    ptsToQA: 0,
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
