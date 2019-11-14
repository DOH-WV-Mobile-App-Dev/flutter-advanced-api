// Convert the response into a custom Dart object
class Patients {
  // final String id;
  // final String name;
  // final String address;
  // final String password;
  // final String email;

  // Patients({this.id, this.name, this.address, this.password, this.email});

  // factory Patients.fromJson(Map<String, dynamic> json) {
  //   return Patients(
  //     id: json['id'],
  //     name: json['name'],
  //     email: json['email'],
  //     password: json['password'],
  //     address: json['address'],
  //   );
  // }

  final int userId;
  final int id;
  final String title;
  final String body;

  Patients({this.userId, this.id, this.title, this.body});

  factory Patients.fromJson(Map<String, dynamic> json) {
    return Patients(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
      body: json['body'],
    );
  }
}
