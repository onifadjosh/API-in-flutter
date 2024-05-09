class UserModel {
  final String gender;
  final String title;
  final String firstName;
  final String lastName;
  final String city;

  UserModel({
    required this.gender,
    required this.title,
    required this.firstName,
    required this.lastName,
    required this.city,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    final name = json['name'];
    final location = json['location'];
    return UserModel(
      gender: json['gender'],
      title: name['title'],
      firstName: name['first'],
      lastName: name['last'],
      city: location['city'],
    );
  }
}
