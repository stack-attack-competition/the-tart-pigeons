import 'dart:convert';

class Login {
  final String email;
  final String password;
  Login({
    this.email,
    this.password,
  });

  Login copyWith({
    String email,
    String password,
  }) {
    return Login(
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'password': password,
    };
  }

  static Login fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
  
    return Login(
      email: map['email'],
      password: map['password'],
    );
  }

  String toJson() => json.encode(toMap());

  static Login fromJson(String source) => fromMap(json.decode(source));

  @override
  String toString() => 'Login email: $email, password: $password';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
  
    return o is Login &&
      o.email == email &&
      o.password == password;
  }

  @override
  int get hashCode => email.hashCode ^ password.hashCode;
}
