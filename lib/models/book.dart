// lib/models/book.dart
class Book {
  final String id;
  final String title;
  final String author;
  final String description;
  final String? rasterAsset; // 仅使用 raster (png/jpg)

  Book({
    required this.id,
    required this.title,
    required this.author,
    required this.description,
    this.rasterAsset,
  });
}
