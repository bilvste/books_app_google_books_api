import 'package:books_app/features/home_screen/cubit/book_carousel_state.dart';
import 'package:books_app/features/home_screen/repos/book_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookCarouselCubit extends Cubit<BookCarouselState> {
  BookCarouselCubit(this._bookRepo) : super(BookCarouselInitial());
  final BookRepo _bookRepo;

  Future<void> fetchCarouselBooks({String query = "marvel"}) async {
    emit(BookCarouselLoading());

    final res = await _bookRepo.getBooksRaw(query: query);

    res.fold(
      (error) => emit(BookCarouselError(error)),
      (books) => emit(BookCarouselLoaded(books)),
    );
  }
}
