import 'package:flutter_application_1/Core/utils/api_services.dart';
import 'package:flutter_application_1/Core/utils/functions/savedata.dart';
import 'package:flutter_application_1/Features/home/data/models/book_model/book_model/book_model.dart';
import 'package:flutter_application_1/Features/home/domain/entities/book_entity.dart';
import 'package:flutter_application_1/constants.dart';
abstract class HomeRemoteDataSource{
  Future<List<BookEntity>> fetchFeaturedBooks({int pageNumber=0});
  Future<List<BookEntity>> fetchNewstBooks({int pageNumber=0});
}
class HomeRemoteDataSourceImplementation extends HomeRemoteDataSource{
  final ApiServices apiServices;
  HomeRemoteDataSourceImplementation( this.apiServices);
  @override
  Future<List<BookEntity>> fetchFeaturedBooks({int pageNumber=0})async {
    var data=await apiServices.get(endpoint: 'volumes?Filtering=free-ebooks&q=programming&startIndex=${pageNumber*10}');
    List<BookEntity> books = getBookList(data);
    saveData(books,kfeaturedbox);
      return books;
  }

  

  

  @override
  Future<List<BookEntity>> fetchNewstBooks({int pageNumber=0}) async{
    var data=await apiServices.get(endpoint: 'volumes?Filtering=free-ebooks&Sorting=newst&q=programming&startIndex=${pageNumber*10}');
    List<BookEntity> books = getBookList(data);
     saveData(books,knewstbox);
      return books;
  }
List<BookEntity> getBookList(Map<String, dynamic> data) {
      List <BookEntity> books=[];
    for (var bookMap in data['items']){
     books.add(BookModel.fromJson(bookMap));
    }
    return books;
  }                                                                                                              
}