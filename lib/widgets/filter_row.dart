// lib/widgets/filter_row.dart
import 'package:flutter/material.dart';
import '../theme/design_system.dart';

class FilterRow extends StatelessWidget {
  final bool byAuthorSelected;
  final void Function() onAuthor;
  final void Function() onTitle;
  // filterIconAsset 保留为可选字符串（若以后需要可用 Image.asset 手动加载）
  final String? filterIconAsset;

  const FilterRow({
    required this.byAuthorSelected,
    required this.onAuthor,
    required this.onTitle,
    this.filterIconAsset,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppDim.pagePadding, vertical: 8),
      child: Row(
        children: [
          // 使用系统 icon 代替 svg overlay
          const Icon(Icons.filter_list, size: 20, color: Colors.black54),
          const SizedBox(width: 8),
          Text('Sort by', style: AppText.subtitle),
          const SizedBox(width: 12),
          ChoiceChip(
            label: const Text('Author'),
            selected: byAuthorSelected,
            onSelected: (_) => onAuthor(),
            selectedColor: AppColors.accentBg,
          ),
          const SizedBox(width: 8),
          ChoiceChip(
            label: const Text('Title'),
            selected: !byAuthorSelected,
            onSelected: (_) => onTitle(),
            selectedColor: AppColors.accentBg,
          ),
          const Spacer(),
          IconButton(
            icon: const Icon(Icons.more_vert, size: 20),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
