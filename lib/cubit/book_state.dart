// lib/cubit/book_state.dart
import 'package:equatable/equatable.dart';
import '../models/book.dart';

enum SortMode { author, title }

class BookState extends Equatable {
  final List<Book> books;
  final bool loading;
  final SortMode sortMode;
  final int version;

  const BookState({
    required this.books,
    required this.loading,
    required this.sortMode,
    required this.version,
  });

  factory BookState.initial() => const BookState(
    books: [],
    loading: false,
    sortMode: SortMode.author,
    version: 0,
  );

  BookState copyWith({
    List<Book>? books,
    bool? loading,
    SortMode? sortMode,
    int? version,
  }) {
    return BookState(
      books: books ?? this.books,
      loading: loading ?? this.loading,
      sortMode: sortMode ?? this.sortMode,
      version: version ?? (this.version + 1),
    );
  }

  @override
  List<Object?> get props => [books, loading, sortMode, version];
}
