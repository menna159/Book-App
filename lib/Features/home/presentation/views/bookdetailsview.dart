import 'package:flutter/material.dart';
import 'package:flutter_application_1/Features/home/domain/entities/book_entity.dart';
import 'package:flutter_application_1/Features/home/presentation/views/widgets/bookdetailsviewbody.dart';

class BookDetailsview extends StatelessWidget {
  const BookDetailsview({super.key,required this.book});
   final BookEntity book;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(child: BookDetailsviewBody(book:book
      )),
    );
  }
}
