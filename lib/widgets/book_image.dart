// lib/widgets/book_image.dart  (替换 build 中的核心实现)
import 'package:flutter/material.dart';
import '../models/book.dart';
import '../theme/design_system.dart';

class BookImage extends StatelessWidget {
  final Book book;
  final double? width;   // allow null -> use available width
  final double? height;  // optional; when null we keep aspect via fitWidth
  final BoxFit fit;
  final String? heroTag;

  const BookImage({
    required this.book,
    this.width,
    this.height,
    this.fit = BoxFit.fitWidth, // <-- default changed to fitWidth (完整显示宽度)
    this.heroTag,
    Key? key,
  }) : super(key: key);

  Widget _placeholderBox(double w, double h) {
    return Container(
      width: w,
      height: h,
      color: AppColors.grayLight,
      child: const Icon(Icons.book, color: Colors.white30),
    );
  }

  @override
  Widget build(BuildContext context) {
    final tag = heroTag ?? 'book-image-${book.id}';
    final w = width ?? double.infinity;
    final h = height; // may be null

    return Hero(
      tag: tag,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(AppDim.cardRadius),
        child: SizedBox(
          width: w,
          // If height is provided, constrain to that height; otherwise allow Image to size by width
          height: h,
          child: Builder(builder: (ctx) {
            final raster = book.rasterAsset;
            if (raster != null && raster.isNotEmpty) {
              // If height == null, using width + BoxFit.fitWidth will preserve aspect ratio and not crop
              return Image.asset(
                raster,
                width: w == double.infinity ? null : w,
                height: h,
                fit: fit,
                errorBuilder: (c, e, s) => _placeholderBox(w==double.infinity? (MediaQuery.of(context).size.width - 2*AppDim.pagePadding) : w, h ?? 180),
                gaplessPlayback: true,
              );
            }
            return _placeholderBox(w==double.infinity? (MediaQuery.of(context).size.width - 2*AppDim.pagePadding) : w, h ?? 180);
          }),
        ),
      ),
    );
  }
}
