class UserModel {
  final String userId;
  final String name;

  const UserModel({required this.userId, required this.name});

  static UserModel fromJson(Map<String, dynamic> json) =>
      UserModel(userId: json['userId'] as String, name: json['name'] as String);
}
