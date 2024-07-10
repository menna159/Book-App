import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_application_1/Core/errors/failure.dart';
import 'package:flutter_application_1/Features/home/data/data_sources/home_local_datasource.dart';
import 'package:flutter_application_1/Features/home/data/data_sources/home_remote_datasource.dart';
import 'package:flutter_application_1/Features/home/domain/entities/book_entity.dart';
import 'package:flutter_application_1/Features/home/domain/repos/homerpo.dart';

class HomeRpoImplementation extends HomeRepo{
  final HomeRemoteDataSource homeRemoteDataSource;
  final HomeLocalDataSource homeLocalDataSource;

  HomeRpoImplementation({required this.homeRemoteDataSource, required this.homeLocalDataSource});
  @override
  Future<Either<Failure, List<BookEntity>>> fetchFeaturedBooks({int pageNumber=0})async {

  try {
     List<BookEntity> books;
 books= homeLocalDataSource.fetchFeaturedBooks(pageNumber: pageNumber);
  if(books.isNotEmpty){
    return right(books);
  }
  books=await homeRemoteDataSource.fetchFeaturedBooks(pageNumber: pageNumber);
  return right(books);
}  catch (e) {
  if(e is DioException){
    return left(ServerFailure.fromDioError(e));
  }
  return left(ServerFailure(error: e.toString()));
}
  }

  @override
  Future<Either<Failure, List<BookEntity>>> fetchNewstBooks({int pageNumber=0}) async{
   try {
    List<BookEntity> books;
   books= homeLocalDataSource.fetchNewstBooks(pageNumber: pageNumber);
  if(books.isNotEmpty){
    return right(books);
  }
  books=await homeRemoteDataSource.fetchNewstBooks(pageNumber: pageNumber);
  return right(books);
}  catch (e) {
   if(e is DioException){
    return left(ServerFailure.fromDioError(e));
  }
  return left(ServerFailure(error: 'There was an error'));
}
  }

}