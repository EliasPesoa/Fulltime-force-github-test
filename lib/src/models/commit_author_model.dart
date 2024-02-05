class CommitAuthorModel {
  String name;
  String email;
  DateTime date;

  CommitAuthorModel(
      {required this.name, required this.email, required this.date});

  factory CommitAuthorModel.fromJson(Map<String, dynamic> json) {
    return CommitAuthorModel(
      name: json['name'],
      email: json['email'],
      date: DateTime.parse(json['date']),
    );
  }
}
