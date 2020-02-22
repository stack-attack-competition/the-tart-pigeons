class Challenge {
  final String id;
  final bool isDeleted;
  final String author;
  final String title;
  final String description;
  final bool isActive;
  final String endDate;
  final bool outcome;
  final String proofUrl;

  Challenge({
    this.id,
    this.isDeleted,
    this.author,
    this.title,
    this.description,
    this.isActive,
    this.endDate,
    this.outcome,
    this.proofUrl,
  });

  factory Challenge.fromJson(Map<String, dynamic> json) {
    return Challenge(
      id: json['id'] as String,
      isDeleted: json['isDeleted'] as bool,
      author: json['author'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      isActive: json['isActive'] as bool,
      endDate: json['endDate'] as String,
      outcome: json['outcome'] as bool,
      proofUrl: json['proofUrl'] as String,
    );
  }

  Challenge copyWith({
    String id,
    bool isDeleted,
    String author,
    String title,
    String description,
    bool isActive,
    String endDate,
    bool outcome,
    String proofUrl,
  }) {
    return Challenge(
      id: id ?? this.id,
      isDeleted: isDeleted ?? this.isDeleted,
      author: author ?? this.author,
      title: title ?? this.title,
      description: description ?? this.description,
      isActive: isActive ?? this.isActive,
      endDate: endDate ?? this.endDate,
      outcome: outcome ?? this.outcome,
      proofUrl: proofUrl ?? this.proofUrl
    );
  }
}
