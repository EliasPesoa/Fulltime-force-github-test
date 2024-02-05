import 'package:github_commit_history_test/src/models/commit_author_model.dart';

class CommitModel {
  CommitAuthorModel author;
  String message;
  String url;

  CommitModel({required this.author, required this.message, required this.url});

  factory CommitModel.fromJson(Map<String, dynamic> json) {
    return CommitModel(
      author: CommitAuthorModel.fromJson(json['author']),
      message: json['message'],
      url: json['url'],
    );
  }
}
