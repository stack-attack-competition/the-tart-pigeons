class ChallengeCreate {
  String title;
  String description;
  String endDate;
  bool isActive;
  bool outcome;
  String author;

  ChallengeCreate({
    this.title,
    this.description,
    this.endDate,
    this.author,
    this.isActive,
    this.outcome,
  });

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'description': description,
      'endDate': endDate,
      'author': author,
      'isActive': true,
      'outcome': false,
    };
  }

  ChallengeCreate copyWith({
    String title,
    String description,
    String endDate,
    String author,
    bool isActive,
    bool outcome,
  }) {
    return ChallengeCreate(
      title: title ?? this.title,
      description: description ?? this.description,
      endDate: endDate ?? this.endDate,
      isActive: isActive ?? this.isActive,
      author: author ?? this.author,
      outcome: outcome ?? this.outcome,
    );
  }
}
