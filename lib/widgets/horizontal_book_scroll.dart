// lib/widgets/horizontal_book_scroll.dart
import 'package:flutter/material.dart';
import '../models/book.dart';
import 'book_image.dart';
import '../theme/design_system.dart';


class HorizontalBookScroll extends StatelessWidget {
  final List<Book> books;
  final void Function(Book book, String heroTag) onTap;
  final double height;

  const HorizontalBookScroll({
    required this.books,
    required this.onTap,
    this.height = 130,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: AppDim.pagePadding, vertical: 10),
        scrollDirection: Axis.horizontal,
        itemCount: books.length,
        separatorBuilder: (_, __) => const SizedBox(width: 12),
        itemBuilder: (context, index) {
          final book = books[index];

          final heroTag = 'book-image-${book.id}-$index';
          return GestureDetector(
            onTap: () => onTap(book, heroTag),
            child: SizedBox(
              width: 80,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [

                  BookImage(book: book, width: 72, height: (height - 50).clamp(56.0, 96.0), heroTag: heroTag),
                  const SizedBox(height: 6),
                  Flexible(
                    fit: FlexFit.loose,
                    child: SizedBox(
                      width: 72,
                      child: Text(
                        book.title,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                        style: AppText.body,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
