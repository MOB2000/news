class Source {
  String id;
  String name;
  String description;
  String url;
  String category;
  String language;
  String country;

  Source({
    required this.id,
    required this.name,
    required this.description,
    required this.url,
    required this.category,
    required this.language,
    required this.country,
  });
  factory Source.withName(String name) {
    return Source(
      id: '',
      name: name,
      description: '',
      url: '',
      category: '',
      language: '',
      country: '',
    );
  }

  factory Source.fromMap(Map<String, dynamic> map) {
    return Source(
      id: map['id'],
      name: map['name'],
      description: map['description'],
      url: map['url'],
      category: map['category'],
      language: map['language'],
      country: map['country'],
    );
  }
}
