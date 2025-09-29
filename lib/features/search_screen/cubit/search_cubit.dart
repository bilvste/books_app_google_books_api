import 'package:books_app/features/home_screen/repos/book_repo.dart';
import 'package:books_app/features/search_screen/cubit/search_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit(this._bookRepo) : super(SearchInitial());
  final BookRepo _bookRepo;

  Future<void> searchBooks(String query) async {
    if (query.isEmpty) {
      emit(SearchInitial());
      return;
    }
    emit(SearchLoading());

    final res = await _bookRepo.getBooks(query: query);
    res.fold((failer) => emit(SearchError(failer)), (books) {
      if (books.isEmpty) {
        emit(SearchEmpty());
      } else {
        emit(SearchLoaded(books));
      }
    });
  }
}
