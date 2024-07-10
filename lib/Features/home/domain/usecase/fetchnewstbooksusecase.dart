import 'package:dartz/dartz.dart';
import 'package:flutter_application_1/Core/errors/failure.dart';
import 'package:flutter_application_1/Core/usecase/usecase.dart';
import 'package:flutter_application_1/Features/home/domain/entities/book_entity.dart';
import 'package:flutter_application_1/Features/home/domain/repos/homerpo.dart';
class FetchNewstBooksUseCase extends UseCase<List<BookEntity>,int>{
  final HomeRepo homeRepo;

  FetchNewstBooksUseCase(this.homeRepo);
  
  @override
  Future<Either<Failure, List<BookEntity>>> call([int? param]) async{
   return await homeRepo.fetchNewstBooks(pageNumber: param!);
  }

  

}