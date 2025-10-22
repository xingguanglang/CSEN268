// lib/pages/detail_page.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/book.dart';
import '../cubit/book_cubit.dart';
import '../theme/design_system.dart';
import '../widgets/book_image_adaptive.dart';
import '../widgets/padded_text.dart';

class DetailPage extends StatelessWidget {
  final Book book;
  final String heroTag;

  const DetailPage({
    required this.book,
    required this.heroTag,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // 计算可用宽度（左右 padding 后的宽度）
    final screenWidth = MediaQuery.of(context).size.width;
    final horizontalPadding = AppDim.pagePadding;
    final coverWidth = screenWidth - horizontalPadding * 2;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black87),
          onPressed: () {
            // 按作业要求：leading widget 需要触发 cubit 发出显示列表的 state
            // 这里先调用 cubit 的方法，然后 pop 回去
            try {
              context.read<BookCubit>().showListView();
            } catch (_) {
              // 如果 cubit 不在上下文中则忽略（避免 crash）
            }
            Navigator.of(context).pop();
          },
        ),
        centerTitle: true,
        title: Text('Book Detail', style: AppText.appBarTitle),
        actions: [
          IconButton(
            icon: const Icon(Icons.more_vert, color: Colors.black87),
            onPressed: () {},
          ),
        ],
      ),
      body: SafeArea(
        bottom: true,
        child: SingleChildScrollView(
          padding: EdgeInsets.fromLTRB(
            horizontalPadding,
            12,
            horizontalPadding,
            MediaQuery.of(context).viewInsets.bottom + 16,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 自适应图片组件：会根据图片本身宽高计算高度，确保不被裁切
              Center(
                child: BookImageAdaptive(
                  book: book,
                  maxWidth: coverWidth,
                  heroTag: heroTag,
                  fit: BoxFit.fitWidth,
                ),
              ),

              const SizedBox(height: 18),

              // 标题
              PaddedText(
                text: book.title,
                style: AppText.title,
                padding: const EdgeInsets.symmetric(horizontal: 0),
              ),

              // 作者
              PaddedText(
                text: 'by ${book.author}',
                style: AppText.subtitle,
                padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 6),
              ),

              const SizedBox(height: 6),

              // 描述
              PaddedText(
                text: book.description,
                style: AppText.body,
                padding: const EdgeInsets.symmetric(horizontal: 0),
              ),

              const SizedBox(height: 28),
            ],
          ),
        ),
      ),
    );
  }
}
