class Case {
  final int id;
  final String key;
  final int storyPoints;
  final String developer;
  final int rejections;

  Case({
    required this.id,
    required this.key,
    required this.storyPoints,
    required this.developer,
    required this.rejections,
  });

  factory Case.fromJiraIssue(Map<String, dynamic> json) => Case(
        id: json["id"] == null ? null : json["id"],
        key: json["key"] == null ? null : json["key"],
        storyPoints: json["story_points"] == null ? null : json["story_points"],
        developer: json["developeer"] == null ? null : json["developer"],
        rejections: json["rejections"] == null ? null : json["rejections"],
      );
}
