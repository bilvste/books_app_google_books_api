import 'package:books_app/features/home_screen/cubit/book_best_seller_state.dart';
import 'package:books_app/features/home_screen/repos/book_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookBestSellerCubit extends Cubit<BookState> {
  BookBestSellerCubit(this._bookRepo) : super(BookInitial());
  final BookRepo _bookRepo;

  Future<void> fetchBooks({String query = "spiderman"}) async {
    emit(BookLoading());

    final res = await _bookRepo.getBooksRaw(query: query);

    res.fold(
      (error) => emit(BookError(error)),
      (books) => emit(BookLoaded(books)),
    );
  }
}
