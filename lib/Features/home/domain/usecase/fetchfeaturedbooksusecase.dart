import 'package:dartz/dartz.dart';
import 'package:flutter_application_1/Core/errors/failure.dart';
import 'package:flutter_application_1/Core/usecase/usecase.dart';
import 'package:flutter_application_1/Features/home/domain/entities/book_entity.dart';
import 'package:flutter_application_1/Features/home/domain/repos/homerpo.dart';

class FetchFeaturedBooksUseCase extends UseCase<List<BookEntity>, int> {
  final HomeRepo homeRepo;

  FetchFeaturedBooksUseCase(this.homeRepo);

  @override
  Future<Either<Failure, List<BookEntity>>> call([int param=0]) async {
    return await homeRepo.fetchFeaturedBooks(pageNumber: param);
  }
}
