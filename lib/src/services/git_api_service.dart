import 'package:github_commit_history_test/src/models/commit_model.dart';
import 'package:github_commit_history_test/src/utils/const.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

Future<List<Map<String, dynamic>>> getCommits(length) async {
  List<Map<String, dynamic>> commits = [];
  String owner = "EliasPesoa";
  String repo = "github_api_test";
  String branch = "main";
  int page = 1;
  String url =
      '$baseUrl/repos/$owner/$repo/commits?sha=$branch&page=$page&per_page=$length';
  Map<String, String> headers = {
    'Authorization': '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',
    'X-GitHub-Api-Version': '2022-11-28'
  };
  http.Response response = await http.get(Uri.parse(url), headers: headers);
  List<dynamic> body = jsonDecode(response.body);
  commits.addAll(body.map((e) => e as Map<String, dynamic>));
  List<CommitModel> commitList = [];
  for (final item in commits) {
    commitList.add(CommitModel.fromJson(item["commit"]));
  }

  var test = commitList;

  return commits;
}
