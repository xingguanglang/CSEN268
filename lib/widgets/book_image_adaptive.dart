// lib/widgets/book_image_adaptive.dart
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../models/book.dart';
import '../theme/design_system.dart';

/// BookImageAdaptive

class BookImageAdaptive extends StatefulWidget {
  final Book book;
  final double maxWidth; 
  final BoxFit fit;
  final String? heroTag;

  const BookImageAdaptive({
    required this.book,
    required this.maxWidth,
    this.fit = BoxFit.fitWidth,
    this.heroTag,
    Key? key,
  }) : super(key: key);

  @override
  State<BookImageAdaptive> createState() => _BookImageAdaptiveState();
}

class _BookImageAdaptiveState extends State<BookImageAdaptive> {
  double? _height;
  bool _failed = false;

  @override
  void initState() {
    super.initState();
    _loadIntrinsicSize();
  }

  Future<void> _loadIntrinsicSize() async {
    final path = widget.book.rasterAsset;
    if (path == null || path.isEmpty) {
      if (mounted) setState(() => _failed = true);
      return;
    }

    try {
      final byteData = await rootBundle.load(path);
      final Uint8List bytes = byteData.buffer.asUint8List();
      final ui.Codec codec = await ui.instantiateImageCodec(bytes);
      final ui.FrameInfo fi = await codec.getNextFrame();
      final ui.Image image = fi.image;
      final double intrinsicW = image.width.toDouble();
      final double intrinsicH = image.height.toDouble();

      if (intrinsicW > 0) {
        final computedH = widget.maxWidth * (intrinsicH / intrinsicW);
        if (mounted) {
          setState(() {
          _height = computedH;
        });
        }
      } else {
        if (mounted) setState(() => _failed = true);
      }
    } catch (e) {
      if (mounted) setState(() => _failed = true);
    }
  }

  Widget _placeholder(double w, double h) {
    return Container(
      width: w,
      height: h,
      color: AppColors.grayLight,
      child: const Center(child: CircularProgressIndicator()),
    );
  }

  @override
  Widget build(BuildContext context) {
    final tag = widget.heroTag ?? 'book-image-${widget.book.id}';
    final w = widget.maxWidth;
    final h = _height;

    return Hero(
      tag: tag,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(AppDim.cardRadius),
        child: Container(
          width: w,
          height: h ?? (w * 1.5), 
          color: AppColors.grayLight,
          child: (h == null)
              ? _placeholder(w, w * 1.5)
              : Image.asset(
                  widget.book.rasterAsset!,
                  width: w,
                  height: h,
                  fit: widget.fit,
                  errorBuilder: (c, e, s) => Container(
                    width: w,
                    height: h,
                    color: AppColors.grayLight,
                    child: const Icon(Icons.broken_image),
                  ),
                ),
        ),
      ),
    );
  }
}
