import 'dart:convert';

class Bet {
  final String id;
  final bool isDeleted;
  final String author;
  final String challenge;
  final bool inFavor;
  final int amount;
  final int result;
  Bet({
    this.id,
    this.isDeleted,
    this.author,
    this.challenge,
    this.inFavor,
    this.amount,
    this.result,
  });

  Bet copyWith({
    String id,
    bool isDeleted,
    String author,
    String challenge,
    bool inFavor,
    int amount,
    int result,
  }) {
    return Bet(
      id: id ?? this.id,
      isDeleted: isDeleted ?? this.isDeleted,
      author: author ?? this.author,
      challenge: challenge ?? this.challenge,
      inFavor: inFavor ?? this.inFavor,
      amount: amount ?? this.amount,
      result: result ?? this.result,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'isDeleted': isDeleted,
      'author': author,
      'challenge': challenge,
      'inFavor': inFavor,
      'amount': amount,
      'result': result,
    };
  }

  static Bet fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
  
    return Bet(
      id: map['id'],
      isDeleted: map['isDeleted'],
      author: map['author'],
      challenge: map['challenge'],
      inFavor: map['inFavor'],
      amount: map['amount']?.toInt(),
      result: map['result']?.toInt(),
    );
  }

  String toJson() => json.encode(toMap());

  static Bet fromJson(String source) => fromMap(json.decode(source));

  @override
  String toString() {
    return 'Bet id: $id, isDeleted: $isDeleted, author: $author, challenge: $challenge, inFavor: $inFavor, amount: $amount, result: $result';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
  
    return o is Bet &&
      o.id == id &&
      o.isDeleted == isDeleted &&
      o.author == author &&
      o.challenge == challenge &&
      o.inFavor == inFavor &&
      o.amount == amount &&
      o.result == result;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      isDeleted.hashCode ^
      author.hashCode ^
      challenge.hashCode ^
      inFavor.hashCode ^
      amount.hashCode ^
      result.hashCode;
  }
}
