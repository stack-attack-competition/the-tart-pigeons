import 'dart:convert';

class RegisterModel {
  String email;
  String password;
  String firstName;
  String lastName;
  String pictureUrl;
  RegisterModel({
    this.email,
    this.password,
    this.firstName,
    this.lastName,
    this.pictureUrl,
  });

  RegisterModel copyWith({
    String email,
    String password,
    String firstName,
    String lastName,
    String pictureUrl,
  }) {
    return RegisterModel(
      email: email ?? this.email,
      password: password ?? this.password,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      pictureUrl: pictureUrl ?? this.pictureUrl,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'password': password,
      'firstName': firstName,
      'lastName': lastName,
      'pictureUrl': pictureUrl,
    };
  }

  static RegisterModel fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
  
    return RegisterModel(
      email: map['email'],
      password: map['password'],
      firstName: map['firstName'],
      lastName: map['lastName'],
      pictureUrl: map['pictureUrl'],
    );
  }

  String toJson() => json.encode(toMap());

  static RegisterModel fromJson(String source) => fromMap(json.decode(source));

  @override
  String toString() {
    return 'Register email: $email, password: $password, firstName: $firstName, lastName: $lastName, pictureUrl: $pictureUrl';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
  
    return o is RegisterModel &&
      o.email == email &&
      o.password == password &&
      o.firstName == firstName &&
      o.lastName == lastName &&
      o.pictureUrl == pictureUrl;
  }

  @override
  int get hashCode {
    return email.hashCode ^
      password.hashCode ^
      firstName.hashCode ^
      lastName.hashCode ^
      pictureUrl.hashCode;
  }
}
