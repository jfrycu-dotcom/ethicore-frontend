class Unit {
  final int id;
  final String title;
  final String? description;
  final int? order;

  Unit({required this.id, required this.title, this.description, this.order});

  // Fungsi ini mengubah JSON dari Laravel menjadi Object Flutter
  factory Unit.fromJson(Map<String, dynamic> json) {
    return Unit(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      order: json['order'],
    );
  }
}
