class Book {
  final String title;
  final String description;

  Book({required this.title, required this.description});

  factory Book.fromJson(Map<String, dynamic> json) {
    return Book(
      title: json['title'] as String? ?? 'No Title',
      description: json['description'] as String? ?? 'No Description',
    );
  }
}
