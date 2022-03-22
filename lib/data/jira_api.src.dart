import 'package:admin/models/Case.dart';
import 'package:atlassian_apis/jira_platform.dart';

JiraPlatformApi createJiraApi() {
  // Alternatively, you can use OAuth1 with RSA.
  String user = 'user@email.com';
  String apiToken = 'jiraApiToken';

  // Create an authenticated http client.
  ApiClient apiClient = ApiClient.basicAuthentication(
      Uri.https('cmoopany.atlassian.net', ''),
      user: user,
      apiToken: apiToken);

  // Create Jira API from an authenticated client
  JiraPlatformApi jiraApi = JiraPlatformApi(apiClient);
  return jiraApi;
}

Future<List<Case>> fetchVelocityCasesByWeek(int weeksAgo) async {
  // Alternatively, you can use OAuth1 with RSA.
  JiraPlatformApi jiraApi = createJiraApi();

  final SearchResults response =
      await jiraApi.issueSearch.searchForIssuesUsingJql(
    jql:
        'status changed to "QA Backlog" during (startOfWeek($weeksAgo), endOfWeek($weeksAgo)) AND NOT status changed to "QA Backlog" before startOfWeek($weeksAgo) AND issuetype != Epic',
    maxResults: 100,
  );

  return response.issues.map((issue) {
    return Case(
      id: int.parse(issue.id ?? '0'),
      key: issue.key ?? 'None',
      developer: issue.fields?['customfield_10400']['displayName'] ?? 'None',
      storyPoints:
          ((issue.fields?['customfield_10802'] ?? 0.0) as double).toInt(),
      rejections: 0,
    );
  }).toList();
}

Future<List<Case>> fetchFailRateCasesByWeek(int weeksAgo) async {
  // Alternatively, you can use OAuth1 with RSA.
  JiraPlatformApi jiraApi = createJiraApi();

  final SearchResults response =
      await jiraApi.issueSearch.searchForIssuesUsingJql(
    jql:
        'status changed to "PASSED QA" during (startOfWeek($weeksAgo), endOfWeek($weeksAgo)) AND NOT status changed to "PASSED QA" before startOfWeek($weeksAgo)AND issuetype != Epic',
    maxResults: 100,
  );

  return response.issues.map((issue) {
    return Case(
      id: int.parse(issue.id ?? '0'),
      key: issue.key ?? 'None',
      developer: issue.fields?['customfield_10400']['displayName'] ?? 'None',
      storyPoints:
          ((issue.fields?['customfield_10802'] ?? 0.0) as double).toInt(),
      rejections: ((issue.fields?['customfield_10402'] ?? 0) as double).toInt(),
    );
  }).toList();
}
