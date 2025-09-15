class PullRequest {
  final String title;
  final String body;
  final String author;
  final String createdAt;

  PullRequest({
    required this.title,
    required this.body,
    required this.author,
    required this.createdAt,
  });

  factory PullRequest.fromJson(Map<String, dynamic> json) {
    return PullRequest(
      title: json['title'] ?? 'No title',
      body: json['body'] ?? 'No description',
      author: json['user']?['login'] ?? 'Unknown',
      createdAt: json['created_at'] ?? '',
    );
  }
}
