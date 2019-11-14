class Patients {
  String id;
  String name;
  String address;
  String password;
  String email;

  Patients(this.id, this.name, this.address, this.password, this.email);

  toJson() {
    return {
      "Id": id,
      "name": name,
      "address": address,
      "password": password,
      "email": email,
    };
  }
}