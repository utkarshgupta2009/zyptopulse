class UserModel {
  final String id;
  final String email;
  final String firstName;
  final String? lastName;
  final String? avatar;

  UserModel({
    required this.id,
    required this.email,
    required this.firstName,
    this.lastName,
    this.avatar,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] as String,
      email: json['email'] as String,
      firstName: json['first_name'] as String,
      lastName: json['last_name'] as String?,
      avatar: json['avatar'] as String?,
    );
  }
}