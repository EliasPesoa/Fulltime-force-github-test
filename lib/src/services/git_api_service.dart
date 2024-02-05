import 'package:github_commit_history_test/src/utils/const.dart';
import 'package:http/http.dart' as http;

Future<http.Response> getCommits(String endpoint, int length) async {
  String url = '$baseUrl$endpoint';
  Map<String, String> headers = {
    'Authorization': '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',
    'X-GitHub-Api-Version': '2022-11-28'
  };
  http.Response response = await http.get(Uri.parse(url), headers: headers);

  return response;
}
