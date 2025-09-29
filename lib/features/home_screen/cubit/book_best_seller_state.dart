import 'package:books_app/features/home_screen/model/book_model.dart';

abstract class BookState {}

class BookInitial extends BookState {}

class BookLoading extends BookState {}

class BookLoaded extends BookState {
  final BookModel booksList;
  BookLoaded(this.booksList);
}

class BookError extends BookState {
  final String error;
  BookError(this.error);
}
