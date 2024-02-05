import 'package:http/http.dart' as http;
import 'dart:convert';

Future<List<Map<String, dynamic>>> getCommits() async {
  String baseUrl = 'https://api.github.com';
  List<Map<String, dynamic>> commits = [];
  String owner = "EliasPesoa";
  String repo = "Fulltime-force-github-test";
  String branch = "main";
  int page = 1;
  int perPage = 30;
  bool hasMore = true;
  while (hasMore) {
    String url =
        '$baseUrl/repos/$owner/$repo/commits?sha=$branch&page=$page&per_page=$perPage';
    // Map<String, String> headers = {'Authorization': , 'X-GitHub-Api-Version': '2022-11-28'};
    // http.Response response = await http.get(Uri.parse(url), headers: headers);
    // List<dynamic> body = jsonDecode(response.body);
    // commits.addAll(body.map((e) => e as Map<String, dynamic>));
    // if (body.length < perPage) {
    //   hasMore = false;
    // } else {
    //   page++;
    // }
  }
  return commits;
}
