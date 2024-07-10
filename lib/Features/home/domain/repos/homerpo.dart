import 'package:dartz/dartz.dart';
import 'package:flutter_application_1/Core/errors/failure.dart';
import 'package:flutter_application_1/Features/home/domain/entities/book_entity.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<BookEntity>>> fetchFeaturedBooks({int pageNumber=0});
  Future<Either<Failure, List<BookEntity>>> fetchNewstBooks({int pageNumber=0});
}
