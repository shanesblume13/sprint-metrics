import 'package:admin/data/jira_api.dart';
import 'package:admin/models/Case.dart';
import 'package:admin/models/MetricInfo.dart';
import 'package:admin/models/Team.dart';

class MetricController {
  Future<List<MetricInfo>> getWeeklyTeamVelocityMetrics(int weeksAgo) async {
    List<Case> cases = await fetchVelocityCasesByWeek(weeksAgo);
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

  Future<List<MetricInfo>> getWeeklyTeamFailRateMetrics(int weeksAgo) async {
    List<Case> cases = await fetchFailRateCasesByWeek(weeksAgo);
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

          metricInfo.ptsPassedQA += c.storyPoints;
          metricInfo.rejectionsPassedQA += c.rejections;
        }
      }
    }

    sortMetricInfosByFailRate(metricInfos);

    return metricInfos;
  }

  void sortMetricInfosByFailRate(List<MetricInfo> metricInfos) {
    metricInfos.sort((a, b) {
      if ((b.ptsPassedQA) == 0) {
        return 0;
      } else if ((a.ptsPassedQA) == 0) {
        return 1;
      } else {
        return ((b.rejectionsPassedQA) / (b.ptsPassedQA))
            .compareTo((a.rejectionsPassedQA) / (a.ptsPassedQA));
      }
    });
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
}
