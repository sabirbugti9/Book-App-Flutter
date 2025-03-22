import 'package:dartz/dartz.dart';
import 'package:zzzbookly/core/errors/failures.dart';
import 'package:zzzbookly/features/home/data/models/book_model/book_model.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<BookModel>>> fetchTrandingBooks();
  Future<Either<Failure, List<BookModel>>> fetchFeaturedBooks();
  Future<Either<Failure, List<BookModel>>> searchForBooks(String query);

}
