class CommitAuthorModel {
  String name;
  String email;
  String date;
  String? hour;

  CommitAuthorModel(
      {required this.name, required this.email, required this.date, this.hour});

  factory CommitAuthorModel.fromJson(Map<String, dynamic> json) {
    return CommitAuthorModel(
      name: json['name'],
      email: json['email'],
      date: json['date'],
    );
  }
}
