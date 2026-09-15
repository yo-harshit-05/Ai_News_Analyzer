class AnalyzeResponse {
  final String article;
  final String summary;
  final Map<String, dynamic> sentiment;
  final List<dynamic> keywords;
  final Map<String, dynamic> entities;

  AnalyzeResponse({
    required this.article,
    required this.summary,
    required this.sentiment,
    required this.keywords,
    required this.entities,
  });

  factory AnalyzeResponse.fromJson(Map<String, dynamic> json) {
    return AnalyzeResponse(
      article: json["article"] ?? "",
      summary: json["summary"] ?? "",
      sentiment: json["sentiment"] ?? {},
      keywords: json["keywords"] ?? [],
      entities: json["entities"] ?? {},
    );
  }
}