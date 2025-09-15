import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/pull_request_model.dart';

class GitHubAPI {
  static const String baseUrl =
      "https://api.github.com/repos/Varugowdatp/github-pr-viewer/pulls?state=all";

  static Future<List<PullRequest>> fetchPullRequests() async {
    final response = await http.get(Uri.parse(baseUrl));

    if (response.statusCode == 200) {
      final List data = jsonDecode(response.body);
      return data.map((e) => PullRequest.fromJson(e)).toList();
    } else {
      throw Exception("Failed to load pull requests");
    }
  }
}
