import 'package:books_app/features/home_screen/model/book_model.dart';

abstract class BookCarouselState {}

class BookCarouselInitial extends BookCarouselState {}

class BookCarouselLoading extends BookCarouselState {}

class BookCarouselLoaded extends BookCarouselState {
  final BookModel booksCarousel;
  BookCarouselLoaded(this.booksCarousel);
}

class BookCarouselError extends BookCarouselState {
  final String message;
  BookCarouselError(this.message);
}
