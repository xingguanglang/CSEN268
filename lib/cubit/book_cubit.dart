// lib/cubit/book_cubit.dart
import 'package:bloc/bloc.dart';
import '../models/book.dart';
import 'book_state.dart';

class BookCubit extends Cubit<BookState> {
  BookCubit() : super(BookState.initial());

  // call on homepage initState
  void init() async {
    emit(state.copyWith(loading: true));
    await Future.delayed(const Duration(milliseconds: 200)); // simulate loading
    final initial = _sampleBooks();
    emit(state.copyWith(books: initial, loading: false));
  }

  List<Book> _sampleBooks() {
    // NOTE: ensure id is unique for each book
    return [
      Book(
        id: 'book1',
        title: "Don't Look Back",
        author: 'Isaac Nelson',
        description: 'Lorem ipsum dolor sit amet consectetur. Id tincidunt tristique vitae at pharetra. Commodo volutpat lacus adipiscing at elit semper eget turpis ut. Gravida faucibus faucibus ornare consectetur enim cursus tellus. Est varius vel egestas velit orci. Neque nam ultricies augue nunc vel pulvinar sed massa. Pellentesque netus pellentesque egestas aliquam maecenas amet libero integer. Ut eleifend platea massa diam ut. Egestas odio massa aliquet pellentesque quis laoreet sed. Sodales rhoncus nisi sit vel non leo ultricies ut facilisi. Adipiscing a augue id volutpat rhoncus in nec enim. In dictum egestas at dui. Quam quis consectetur nec id accumsan et fusce. Diam amet morbi lorem massa risus libero ac. Elit integer ut libero malesuada et tortor elementum porttitor. Arcu sed augue orci felis nam volutpat placerat. Sapien nulla diam fringilla ut vestibulum eget. Sodales id orci habitant at. Rhoncus pharetra eu posuere porttitor. Mauris odio vehicula eu orci consectetur dui sit varius. Laoreet sed viverra massa malesuada odio dictum justo quam quisque. Eros bibendum neque cras ut. Purus dolor ut pretium diam. Nunc lectus lacus sapien ultricies est pharetra. Sagittis eu rhoncus integer ridiculus morbi. Auctor in ultricies euismod sit in tincidunt velit aliquam. Egestas arcu et at feugiat elit risus et diam. Placerat urna sapien proin neque habitasse vivamus scelerisque. Id id cursus egestas nibh. Dictum non malesuada vitae proin. Nulla tempus odio tellus phasellus viverra ac sit dui ornare. Potenti a in massa iaculis faucibus in. Adipiscing posuere id blandit libero suspendisse. Suspendisse sed lobortis nec tellus. Velit adipiscing fames gravida nulla. Hac fermentum volutpat sit fusce sem pharetra orci. Odio facilisi dui turpis tortor mattis. Blandit faucibus ut tortor sed non vivamus venenatis. Cursus neque tortor in platea. Etiam fringilla vel tempor urna et sed placerat.',
        rasterAsset: 'assets/images/dont_look_back.png',
      ),
      Book(
        id: 'book2',
        title: 'James and the Giant Peach',
        author: 'Roald Dahl',
        description: 'Lorem ipsum dolor sit amet consectetur. Id tincidunt tristique vitae at pharetra. Commodo volutpat lacus adipiscing at elit semper eget turpis ut. Gravida faucibus faucibus ornare consectetur enim cursus tellus. Est varius vel egestas velit orci. Neque nam ultricies augue nunc vel pulvinar sed massa. Pellentesque netus pellentesque egestas aliquam maecenas amet libero integer. Ut eleifend platea massa diam ut. Egestas odio massa aliquet pellentesque quis laoreet sed. Sodales rhoncus nisi sit vel non leo ultricies ut facilisi. Adipiscing a augue id volutpat rhoncus in nec enim. In dictum egestas at dui. Quam quis consectetur nec id accumsan et fusce. Diam amet morbi lorem massa risus libero ac. Elit integer ut libero malesuada et tortor elementum porttitor. Arcu sed augue orci felis nam volutpat placerat. Sapien nulla diam fringilla ut vestibulum eget. Sodales id orci habitant at. Rhoncus pharetra eu posuere porttitor. Mauris odio vehicula eu orci consectetur dui sit varius. Laoreet sed viverra massa malesuada odio dictum justo quam quisque. Eros bibendum neque cras ut. Purus dolor ut pretium diam. Nunc lectus lacus sapien ultricies est pharetra. Sagittis eu rhoncus integer ridiculus morbi. Auctor in ultricies euismod sit in tincidunt velit aliquam. Egestas arcu et at feugiat elit risus et diam. Placerat urna sapien proin neque habitasse vivamus scelerisque. Id id cursus egestas nibh. Dictum non malesuada vitae proin. Nulla tempus odio tellus phasellus viverra ac sit dui ornare. Potenti a in massa iaculis faucibus in. Adipiscing posuere id blandit libero suspendisse. Suspendisse sed lobortis nec tellus. Velit adipiscing fames gravida nulla. Hac fermentum volutpat sit fusce sem pharetra orci. Odio facilisi dui turpis tortor mattis. Blandit faucibus ut tortor sed non vivamus venenatis. Cursus neque tortor in platea. Etiam fringilla vel tempor urna et sed placerat.',
        rasterAsset: 'assets/images/james_and_giant_peach.png',
      ),
      Book(
        id: 'book3',
        title: 'Big Deal',
        author: 'Hisham Al Gurg',
        description: 'Lorem ipsum dolor sit amet consectetur. Id tincidunt tristique vitae at pharetra. Commodo volutpat lacus adipiscing at elit semper eget turpis ut. Gravida faucibus faucibus ornare consectetur enim cursus tellus. Est varius vel egestas velit orci. Neque nam ultricies augue nunc vel pulvinar sed massa. Pellentesque netus pellentesque egestas aliquam maecenas amet libero integer. Ut eleifend platea massa diam ut. Egestas odio massa aliquet pellentesque quis laoreet sed. Sodales rhoncus nisi sit vel non leo ultricies ut facilisi. Adipiscing a augue id volutpat rhoncus in nec enim. In dictum egestas at dui. Quam quis consectetur nec id accumsan et fusce. Diam amet morbi lorem massa risus libero ac. Elit integer ut libero malesuada et tortor elementum porttitor. Arcu sed augue orci felis nam volutpat placerat. Sapien nulla diam fringilla ut vestibulum eget. Sodales id orci habitant at. Rhoncus pharetra eu posuere porttitor. Mauris odio vehicula eu orci consectetur dui sit varius. Laoreet sed viverra massa malesuada odio dictum justo quam quisque. Eros bibendum neque cras ut. Purus dolor ut pretium diam. Nunc lectus lacus sapien ultricies est pharetra. Sagittis eu rhoncus integer ridiculus morbi. Auctor in ultricies euismod sit in tincidunt velit aliquam. Egestas arcu et at feugiat elit risus et diam. Placerat urna sapien proin neque habitasse vivamus scelerisque. Id id cursus egestas nibh. Dictum non malesuada vitae proin. Nulla tempus odio tellus phasellus viverra ac sit dui ornare. Potenti a in massa iaculis faucibus in. Adipiscing posuere id blandit libero suspendisse. Suspendisse sed lobortis nec tellus. Velit adipiscing fames gravida nulla. Hac fermentum volutpat sit fusce sem pharetra orci. Odio facilisi dui turpis tortor mattis. Blandit faucibus ut tortor sed non vivamus venenatis. Cursus neque tortor in platea. Etiam fringilla vel tempor urna et sed placerat.',
        rasterAsset: 'assets/images/the_big_deal.png',
      ),
      Book(
        id: 'book4',
        title: 'The Imperfections of Memory',
        author: 'Angelina Aludo',
        description: 'Lorem ipsum dolor sit amet consectetur. Id tincidunt tristique vitae at pharetra. Commodo volutpat lacus adipiscing at elit semper eget turpis ut. Gravida faucibus faucibus ornare consectetur enim cursus tellus. Est varius vel egestas velit orci. Neque nam ultricies augue nunc vel pulvinar sed massa. Pellentesque netus pellentesque egestas aliquam maecenas amet libero integer. Ut eleifend platea massa diam ut. Egestas odio massa aliquet pellentesque quis laoreet sed. Sodales rhoncus nisi sit vel non leo ultricies ut facilisi. Adipiscing a augue id volutpat rhoncus in nec enim. In dictum egestas at dui. Quam quis consectetur nec id accumsan et fusce. Diam amet morbi lorem massa risus libero ac. Elit integer ut libero malesuada et tortor elementum porttitor. Arcu sed augue orci felis nam volutpat placerat. Sapien nulla diam fringilla ut vestibulum eget. Sodales id orci habitant at. Rhoncus pharetra eu posuere porttitor. Mauris odio vehicula eu orci consectetur dui sit varius. Laoreet sed viverra massa malesuada odio dictum justo quam quisque. Eros bibendum neque cras ut. Purus dolor ut pretium diam. Nunc lectus lacus sapien ultricies est pharetra. Sagittis eu rhoncus integer ridiculus morbi. Auctor in ultricies euismod sit in tincidunt velit aliquam. Egestas arcu et at feugiat elit risus et diam. Placerat urna sapien proin neque habitasse vivamus scelerisque. Id id cursus egestas nibh. Dictum non malesuada vitae proin. Nulla tempus odio tellus phasellus viverra ac sit dui ornare. Potenti a in massa iaculis faucibus in. Adipiscing posuere id blandit libero suspendisse. Suspendisse sed lobortis nec tellus. Velit adipiscing fames gravida nulla. Hac fermentum volutpat sit fusce sem pharetra orci. Odio facilisi dui turpis tortor mattis. Blandit faucibus ut tortor sed non vivamus venenatis. Cursus neque tortor in platea. Etiam fringilla vel tempor urna et sed placerat.',
        rasterAsset: 'assets/images/the_imperfections_of_memory.png',
      ),
      Book(
        id: 'book5',
        title: 'A Clockwork Orange',
        author: 'Anthony Burgess',
        description: 'Lorem ipsum dolor sit amet consectetur. Id tincidunt tristique vitae at pharetra. Commodo volutpat lacus adipiscing at elit semper eget turpis ut. Gravida faucibus faucibus ornare consectetur enim cursus tellus. Est varius vel egestas velit orci. Neque nam ultricies augue nunc vel pulvinar sed massa. Pellentesque netus pellentesque egestas aliquam maecenas amet libero integer. Ut eleifend platea massa diam ut. Egestas odio massa aliquet pellentesque quis laoreet sed. Sodales rhoncus nisi sit vel non leo ultricies ut facilisi. Adipiscing a augue id volutpat rhoncus in nec enim. In dictum egestas at dui. Quam quis consectetur nec id accumsan et fusce. Diam amet morbi lorem massa risus libero ac. Elit integer ut libero malesuada et tortor elementum porttitor. Arcu sed augue orci felis nam volutpat placerat. Sapien nulla diam fringilla ut vestibulum eget. Sodales id orci habitant at. Rhoncus pharetra eu posuere porttitor. Mauris odio vehicula eu orci consectetur dui sit varius. Laoreet sed viverra massa malesuada odio dictum justo quam quisque. Eros bibendum neque cras ut. Purus dolor ut pretium diam. Nunc lectus lacus sapien ultricies est pharetra. Sagittis eu rhoncus integer ridiculus morbi. Auctor in ultricies euismod sit in tincidunt velit aliquam. Egestas arcu et at feugiat elit risus et diam. Placerat urna sapien proin neque habitasse vivamus scelerisque. Id id cursus egestas nibh. Dictum non malesuada vitae proin. Nulla tempus odio tellus phasellus viverra ac sit dui ornare. Potenti a in massa iaculis faucibus in. Adipiscing posuere id blandit libero suspendisse. Suspendisse sed lobortis nec tellus. Velit adipiscing fames gravida nulla. Hac fermentum volutpat sit fusce sem pharetra orci. Odio facilisi dui turpis tortor mattis. Blandit faucibus ut tortor sed non vivamus venenatis. Cursus neque tortor in platea. Etiam fringilla vel tempor urna et sed placerat.',
        rasterAsset: 'assets/images/a_clockwork_orange.png',
      ),
      Book(
        id: 'book6',
        title: 'Little Gods',
        author: 'Meng Jin',
        description: 'Lorem ipsum dolor sit amet consectetur. Id tincidunt tristique vitae at pharetra. Commodo volutpat lacus adipiscing at elit semper eget turpis ut. Gravida faucibus faucibus ornare consectetur enim cursus tellus. Est varius vel egestas velit orci. Neque nam ultricies augue nunc vel pulvinar sed massa. Pellentesque netus pellentesque egestas aliquam maecenas amet libero integer. Ut eleifend platea massa diam ut. Egestas odio massa aliquet pellentesque quis laoreet sed. Sodales rhoncus nisi sit vel non leo ultricies ut facilisi. Adipiscing a augue id volutpat rhoncus in nec enim. In dictum egestas at dui. Quam quis consectetur nec id accumsan et fusce. Diam amet morbi lorem massa risus libero ac. Elit integer ut libero malesuada et tortor elementum porttitor. Arcu sed augue orci felis nam volutpat placerat. Sapien nulla diam fringilla ut vestibulum eget. Sodales id orci habitant at. Rhoncus pharetra eu posuere porttitor. Mauris odio vehicula eu orci consectetur dui sit varius. Laoreet sed viverra massa malesuada odio dictum justo quam quisque. Eros bibendum neque cras ut. Purus dolor ut pretium diam. Nunc lectus lacus sapien ultricies est pharetra. Sagittis eu rhoncus integer ridiculus morbi. Auctor in ultricies euismod sit in tincidunt velit aliquam. Egestas arcu et at feugiat elit risus et diam. Placerat urna sapien proin neque habitasse vivamus scelerisque. Id id cursus egestas nibh. Dictum non malesuada vitae proin. Nulla tempus odio tellus phasellus viverra ac sit dui ornare. Potenti a in massa iaculis faucibus in. Adipiscing posuere id blandit libero suspendisse. Suspendisse sed lobortis nec tellus. Velit adipiscing fames gravida nulla. Hac fermentum volutpat sit fusce sem pharetra orci. Odio facilisi dui turpis tortor mattis. Blandit faucibus ut tortor sed non vivamus venenatis. Cursus neque tortor in platea. Etiam fringilla vel tempor urna et sed placerat.',
        rasterAsset: 'assets/images/little_gods.png',
      ),
      Book(
        id: 'book7',
        title: 'Carmer and Grit',
        author: 'Sarah Jean Horwitz',
        description: 'Lorem ipsum dolor sit amet consectetur. Id tincidunt tristique vitae at pharetra. Commodo volutpat lacus adipiscing at elit semper eget turpis ut. Gravida faucibus faucibus ornare consectetur enim cursus tellus. Est varius vel egestas velit orci. Neque nam ultricies augue nunc vel pulvinar sed massa. Pellentesque netus pellentesque egestas aliquam maecenas amet libero integer. Ut eleifend platea massa diam ut. Egestas odio massa aliquet pellentesque quis laoreet sed. Sodales rhoncus nisi sit vel non leo ultricies ut facilisi. Adipiscing a augue id volutpat rhoncus in nec enim. In dictum egestas at dui. Quam quis consectetur nec id accumsan et fusce. Diam amet morbi lorem massa risus libero ac. Elit integer ut libero malesuada et tortor elementum porttitor. Arcu sed augue orci felis nam volutpat placerat. Sapien nulla diam fringilla ut vestibulum eget. Sodales id orci habitant at. Rhoncus pharetra eu posuere porttitor. Mauris odio vehicula eu orci consectetur dui sit varius. Laoreet sed viverra massa malesuada odio dictum justo quam quisque. Eros bibendum neque cras ut. Purus dolor ut pretium diam. Nunc lectus lacus sapien ultricies est pharetra. Sagittis eu rhoncus integer ridiculus morbi. Auctor in ultricies euismod sit in tincidunt velit aliquam. Egestas arcu et at feugiat elit risus et diam. Placerat urna sapien proin neque habitasse vivamus scelerisque. Id id cursus egestas nibh. Dictum non malesuada vitae proin. Nulla tempus odio tellus phasellus viverra ac sit dui ornare. Potenti a in massa iaculis faucibus in. Adipiscing posuere id blandit libero suspendisse. Suspendisse sed lobortis nec tellus. Velit adipiscing fames gravida nulla. Hac fermentum volutpat sit fusce sem pharetra orci. Odio facilisi dui turpis tortor mattis. Blandit faucibus ut tortor sed non vivamus venenatis. Cursus neque tortor in platea. Etiam fringilla vel tempor urna et sed placerat.',
        rasterAsset: 'assets/images/carmer_and_grit.png',
      ),
    ];
  }

  void sortBy(SortMode mode) {
    List<Book> newList = List.from(state.books);
    if (mode == SortMode.author) {
      newList.sort((a, b) => a.author.compareTo(b.author));
    } else {
      newList.sort((a, b) => a.title.compareTo(b.title));
    }
    emit(state.copyWith(books: newList, sortMode: mode));
  }

  // required by assignment: emit state when leading in detail page is pressed
  void showListView() {
    emit(state.copyWith()); // version++ will force rebuild
  }
}
