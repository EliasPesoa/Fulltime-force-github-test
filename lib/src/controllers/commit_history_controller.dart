import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:github_commit_history_test/src/models/commit_model.dart';

import 'package:github_commit_history_test/src/services/git_api_service.dart'
    as service;
import 'package:github_commit_history_test/src/utils/style.dart';
import 'package:github_commit_history_test/src/view/commit_history/card_text_widget.dart';
import 'package:http/http.dart' as http;
import 'package:github_commit_history_test/src/utils/const.dart';
import 'package:intl/intl.dart';

class CommitHistoryController extends ChangeNotifier {
  int page = 1;
  int length = 1;
  List<CommitModel> commitList = [];

  Future<List<CommitModel>> getCommits() async {
    commitList.clear();
    String endpoint =
        "/repos/$owner/$repo/commits?sha=$branch&page=$page&per_page=30";

    http.Response response = await service.getCommits(endpoint, length);
    List<Map<String, dynamic>> commits = [];
    List<dynamic> body = jsonDecode(response.body);
    commits.addAll(body.map((e) => e as Map<String, dynamic>));
    for (final item in commits) {
      CommitModel commit = CommitModel.fromJson(item["commit"]);
      commit = formatDate(commit);
      commitList.add(commit);
    }

    return commitList;
  }

  CommitModel formatDate(CommitModel commit) {
    DateTime utcDateTime = DateTime.parse(commit.author.date);
    commit.author.date = DateFormat('yyyy-MM-dd').format(utcDateTime);
    commit.author.hour = DateFormat('HH:mm').format(utcDateTime);

    return commit;
  }

  ListView commitHistoryList() {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount: commitList.length,
      itemBuilder: (BuildContext context, int index) {
        CommitModel commit = commitList[index];
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 0.0),
              child: Container(
                decoration: StyleTheme().cardStyle,
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    children: [
                      CardTextWidget(
                        label: "Description: ",
                        text: commit.message,
                      ),
                      CardTextWidget(
                        label: "Date: ",
                        text: commit.author.date,
                      ),
                      CardTextWidget(
                        label: "Hour: ",
                        text: commit.author.hour as String,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.sizeOf(context).height * 0.01,
            )
          ],
        );
      },
    );
  }
}
