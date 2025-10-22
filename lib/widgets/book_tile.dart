// lib/widgets/book_tile.dart
import 'package:flutter/material.dart';
import '../models/book.dart';
import 'book_image.dart';
import '../theme/design_system.dart';

class BookTile extends StatelessWidget {
  final Book book;
  final String heroTag; // required unique tag for this tile's hero
  final VoidCallback onTap;
  const BookTile({required this.book, required this.heroTag, required this.onTap, Key? key}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: AppDim.pagePadding),
        child: Row(
          children: [
            BookImage(book: book, width: 64, height: 96, heroTag: heroTag),
            const SizedBox(width: AppDim.smallGap),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(book.title, style: AppText.title),
                  const SizedBox(height: 4),
                  Text(book.author, style: AppText.subtitle),
                  const SizedBox(height: 8),
                  Text(book.description, style: AppText.body, maxLines: 2, overflow: TextOverflow.ellipsis),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
