class UserModel {
  String? uId;
  String? name;
  String? email;
  String? phoneNumber;


  UserModel({
    required this.email,
    required this.name,
    this.phoneNumber,
    required this.uId,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      email: json['email'],
      name: json['name'],
      phoneNumber: json['phoneNumber'],
      uId: json['userId'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'phoneNumber': phoneNumber,
      'userId': uId,
    };
  }
}
