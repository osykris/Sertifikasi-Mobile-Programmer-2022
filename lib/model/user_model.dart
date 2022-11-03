class UserModel {
  late String userId, email, name, pic, username, notelp;

  UserModel({
    required this.userId,
    required this.email,
    required this.name,
    required this.pic,
    required this.username,
    required this.notelp,
  });

  UserModel.fromJson(Map<dynamic, dynamic> map) {
    userId = map['userId'];
    email = map['email'];
    name = map['name'];
    pic = map['pic'];
    username = map['username'];
    notelp = map['notelp'];
  }

  toJson() {
    return {
      'userId': userId,
      'email': email,
      'name': name,
      'pic': pic,
      'username': username,
      'notelp': notelp,
    };
  }
}
