// lib/pages/home_page.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/book_cubit.dart';
import '../cubit/book_state.dart';
import '../models/book.dart';
import '../widgets/book_tile.dart';
import '../widgets/horizontal_book_scroll.dart';
import '../widgets/filter_row.dart';
import '../theme/design_system.dart';
import 'detail_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late BookCubit _cubit;

  @override
  void initState() {
    super.initState();
    _cubit = context.read<BookCubit>();
    _cubit.init();
  }

  void _openDetail(Book book, String heroTag) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => DetailPage(book: book, heroTag: heroTag)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Book Club Home'),
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
         actions: [
          IconButton(
            icon: const Icon(Icons.person_outline), 
            onPressed: () {},
            tooltip: 'Profile',
          ),
  ],
      ),
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: BlocBuilder<BookCubit, BookState>(
          builder: (context, state) {
            if (state.loading) {
              return const Center(child: CircularProgressIndicator());
            }

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // filter row (not using svg overlay)
                FilterRow(
                  filterIconAsset: null, // no svg
                  byAuthorSelected: state.sortMode == SortMode.author,
                  onAuthor: () => _cubit.sortBy(SortMode.author),
                  onTitle: () => _cubit.sortBy(SortMode.title),
                ),

                const SizedBox(height: 6),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: AppDim.pagePadding),
                  child: Text('Books', style: AppText.title),
                ),

                // horizontal scroll
                HorizontalBookScroll(
                  books: state.books,
                  onTap: (book, heroTag) => _openDetail(book, heroTag),
                  height: 130,
                ),

                // vertical list uses remaining space
                Expanded(
                  child: ListView.builder(
                    padding: EdgeInsets.zero,
                    itemCount: state.books.length,
                    itemBuilder: (context, idx) {
                      final book = state.books[idx];
                      final heroTag = 'book-image-${book.id}-v-$idx';
                      return BookTile(
                        book: book,
                        heroTag: heroTag,
                        onTap: () => _openDetail(book, heroTag),
                      );
                    },
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
