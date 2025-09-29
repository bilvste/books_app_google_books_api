import 'package:books_app/core/networking/api_endpoints.dart';
import 'package:books_app/core/networking/dio_helper.dart';
import 'package:books_app/features/home_screen/model/book_model.dart';
import 'package:dartz/dartz.dart';

class BookRepo {
  final DioHelper _dioHelper;

  BookRepo(this._dioHelper);

  Future<Either<String, BookModel>> getBooksRaw({
    required String query,
    String filter = '',
    String orderBy = 'newest',
  }) async {
    try {
      final res = await _dioHelper.getRequest(
        endPoint: ApiEndpoints.volumes,
        query: {'q': query, 'Filter': filter, 'Sorting': orderBy},
      );

      if (res.statusCode == 200) {
        return Right(BookModel.fromJson(res.data));
      } else {
        return Left("Error: ${res.statusCode}");
      }
    } catch (e) {
      return Left(e.toString());
    }
  }

  Future<Either<String, List<Item>>> getBooks({
    required String query,
    String filter = '',
    String orderBy = 'newest',
  }) async {
    final res = await getBooksRaw(
      query: query,
      filter: filter,
      orderBy: orderBy,
    );
    return res.fold(
      (error) => Left(error),
      (bookModel) => Right(bookModel.items ?? []),
    );
  }
}
