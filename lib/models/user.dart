import 'dart:convert';

class User {
  final String id;
  final bool isDeleted;
  final String email;
  final String firstName;
  final String lastName;
  final String pictureUrl;
  User({
    this.id,
    this.isDeleted,
    this.email,
    this.firstName,
    this.lastName,
    this.pictureUrl,
  });

  User copyWith({
    String id,
    bool isDeleted,
    String email,
    String firstName,
    String lastName,
    String pictureUrl,
  }) {
    return User(
      id: id ?? this.id,
      isDeleted: isDeleted ?? this.isDeleted,
      email: email ?? this.email,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      pictureUrl: pictureUrl ?? this.pictureUrl,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'isDeleted': isDeleted,
      'email': email,
      'firstName': firstName,
      'lastName': lastName,
      'pictureUrl': pictureUrl,
    };
  }

  static User fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
  
    return User(
      id: map['id'],
      isDeleted: map['isDeleted'],
      email: map['email'],
      firstName: map['firstName'],
      lastName: map['lastName'],
      pictureUrl: map['pictureUrl'],
    );
  }

  String toJson() => json.encode(toMap());

  static User fromJson(String source) => fromMap(json.decode(source));

  @override
  String toString() {
    return 'User id: $id, isDeleted: $isDeleted, email: $email, firstName: $firstName, lastName: $lastName, pictureUrl: $pictureUrl';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
  
    return o is User &&
      o.id == id &&
      o.isDeleted == isDeleted &&
      o.email == email &&
      o.firstName == firstName &&
      o.lastName == lastName &&
      o.pictureUrl == pictureUrl;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      isDeleted.hashCode ^
      email.hashCode ^
      firstName.hashCode ^
      lastName.hashCode ^
      pictureUrl.hashCode;
  }
}
