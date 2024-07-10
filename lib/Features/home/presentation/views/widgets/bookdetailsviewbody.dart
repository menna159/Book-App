import 'package:flutter/material.dart';
import 'package:flutter_application_1/Features/home/domain/entities/book_entity.dart';
import 'package:flutter_application_1/Features/home/presentation/views/widgets/bookdetailssection.dart';
import 'package:flutter_application_1/Features/home/presentation/views/widgets/similarbookssection.dart';

class BookDetailsviewBody extends StatelessWidget {
  const BookDetailsviewBody({super.key,required this.book});
  final BookEntity book;
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding:const EdgeInsets.symmetric(vertical: 30.0),
      child: CustomScrollView(
        slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
            child: Column(
              children: [
                BookDetailsSection(book: book,),
              const  Expanded(
                    child: SizedBox(
                  height: 50,
                )),
               const SimilarBooksSection(),
               const SizedBox(
                  height: 30,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
