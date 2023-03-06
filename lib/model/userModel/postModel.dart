// ignore_for_file: file_names

class PostModel {
  String titre;
  // ignore: non_constant_identifier_names
  String detail, date_post;
  // ignore: non_constant_identifier_names
  String user, id_post;
  PostModel(
      {required this.titre,
      required this.detail,
      required this.user,
      // ignore: non_constant_identifier_names
      required this.date_post,
      // ignore: non_constant_identifier_names
      required this.id_post});

  factory PostModel.fromJson(Map<String, dynamic> j) {
    return PostModel(
        id_post: j['id_post'],
        titre: j["titre"],
        detail: j["detail"],
        date_post: j["date_post"],
        user: j['id_user']);
  }

  Map toMap() {
    return {
      "id_post": id_post,
      "id_user": user,
      "titre": titre,
      "detail": detail
    };
  }
}
