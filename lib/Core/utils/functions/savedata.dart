import 'package:flutter_application_1/Features/home/domain/entities/book_entity.dart';
import 'package:hive/hive.dart';

void saveData(List<BookEntity> books,String boxName) {
     var box=Hive.box<BookEntity>(boxName);
    box.addAll(books);
  }