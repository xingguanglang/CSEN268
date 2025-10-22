// lib/widgets/padded_text.dart
import 'package:flutter/material.dart';
import '../theme/design_system.dart';

class PaddedText extends StatelessWidget {
  final String text;
  final TextStyle? style;
  final EdgeInsetsGeometry padding;

  const PaddedText({
    required this.text,
    this.style,
    this.padding = const EdgeInsets.symmetric(horizontal: AppDim.pagePadding, vertical: 8),
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(padding: padding, child: Text(text, style: style ?? AppText.body));
  }
}
