import 'dart:convert';

class NewBet {
  final String author;
  final String challenge;
  final bool inFavor;
  final int amount;
  final int result;
  NewBet({
    this.author,
    this.challenge,
    this.inFavor,
    this.amount,
    this.result,
  });

  NewBet copyWith({
    String author,
    String challenge,
    bool inFavor,
    int amount,
    int result,
  }) {
    return NewBet(
      author: author ?? this.author,
      challenge: challenge ?? this.challenge,
      inFavor: inFavor ?? this.inFavor,
      amount: amount ?? this.amount,
      result: result ?? this.result,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'author': author,
      'challenge': challenge,
      'inFavor': inFavor,
      'amount': amount,
      'result': result,
    };
  }

  static NewBet fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
  
    return NewBet(
      author: map['author'],
      challenge: map['challenge'],
      inFavor: map['inFavor'],
      amount: map['amount']?.toInt(),
      result: map['result']?.toInt(),
    );
  }

  String toJson() => json.encode(toMap());

  static NewBet fromJson(String source) => fromMap(json.decode(source));

  @override
  String toString() {
    return 'Newbet author: $author, challenge: $challenge, inFavor: $inFavor, amount: $amount, result: $result';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
  
    return o is NewBet &&
      o.author == author &&
      o.challenge == challenge &&
      o.inFavor == inFavor &&
      o.amount == amount &&
      o.result == result;
  }

  @override
  int get hashCode {
    return author.hashCode ^
      challenge.hashCode ^
      inFavor.hashCode ^
      amount.hashCode ^
      result.hashCode;
  }
}
