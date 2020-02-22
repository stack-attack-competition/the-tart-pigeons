import 'dart:convert';

class Register {
  String email;
  String password;
  String firstName;
  String lastName;
  String pictureUrl;
  Register({
    this.email,
    this.password,
    this.firstName,
    this.lastName,
    this.pictureUrl,
  });

  Register copyWith({
    String email,
    String password,
    String firstName,
    String lastName,
    String pictureUrl,
  }) {
    return Register(
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

  static Register fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
  
    return Register(
      email: map['email'],
      password: map['password'],
      firstName: map['firstName'],
      lastName: map['lastName'],
      pictureUrl: map['pictureUrl'],
    );
  }

  String toJson() => json.encode(toMap());

  static Register fromJson(String source) => fromMap(json.decode(source));

  @override
  String toString() {
    return 'Register email: $email, password: $password, firstName: $firstName, lastName: $lastName, pictureUrl: $pictureUrl';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
  
    return o is Register &&
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
