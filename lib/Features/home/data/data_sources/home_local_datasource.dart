import 'package:flutter_application_1/Features/home/domain/entities/book_entity.dart';
import 'package:flutter_application_1/constants.dart';
import 'package:hive/hive.dart';

abstract class HomeLocalDataSource{
  List<BookEntity>fetchFeaturedBooks({int pageNumber=0});
  List<BookEntity> fetchNewstBooks({int pageNumber=0});
}
class HomeLocalDataSourceImplementation extends HomeLocalDataSource{
  @override
  List<BookEntity>fetchFeaturedBooks({int pageNumber=0}) {
     int startIndex=pageNumber*10;
     int endIndex=(pageNumber+1)*10;
    var box=Hive.box<BookEntity>(kfeaturedbox);
    int boxLength=box.values.length;
    if(startIndex>=boxLength||endIndex>boxLength){
      return [];
    }
   return box.values.toList().sublist(startIndex,endIndex);
  }

  @override
  List<BookEntity> fetchNewstBooks({int pageNumber=0}) {
     int startIndex=pageNumber*10;
     int endIndex=(pageNumber+1)*10;
   var box=Hive.box<BookEntity>(knewstbox);
    int boxLength=box.values.length;
    if(startIndex>=boxLength||endIndex>boxLength){
      return [];
    }
   return box.values.toList().sublist(startIndex,endIndex);
  }

}