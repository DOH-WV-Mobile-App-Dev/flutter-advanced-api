// Convert the response into a custom Dart object
class Auth {
  final bool validation;

  Auth({this.validation});

  factory Auth.fromJson(Map<String, dynamic> json) {
    return Auth(
      validation: json['validation'],
    );
  }
}
