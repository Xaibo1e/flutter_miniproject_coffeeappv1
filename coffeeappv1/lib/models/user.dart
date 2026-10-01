class User {
  final int id;
  final String firstname;
  final String lastname;
  final String email;

  User({
    required this.id,
    required this.firstname,
    required this.lastname,
    required this.email,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json['id'] is int ? json['id'] : int.parse(json['id'].toString()),
        firstname: json['firstname'] ?? '',
        lastname: json['lastname'] ?? '',
        email: json['email'] ?? '',
      );
}