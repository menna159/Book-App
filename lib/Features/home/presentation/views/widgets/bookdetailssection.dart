import 'package:flutter/material.dart';
import 'package:flutter_application_1/Core/utils/styles.dart';
import 'package:flutter_application_1/Features/home/domain/entities/book_entity.dart';
import 'package:flutter_application_1/Features/home/presentation/views/widgets/bookrating.dart';
import 'package:flutter_application_1/Features/home/presentation/views/widgets/booksaction.dart';
import 'package:flutter_application_1/Features/home/presentation/views/widgets/custom_book_item.dart';
import 'package:flutter_application_1/Features/home/presentation/views/widgets/custombookdetailsappbar.dart';

class BookDetailsSection extends StatelessWidget {
  const BookDetailsSection({super.key, this.book});
  final BookEntity? book;
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        const CustomBookDetailsAppBar(),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.3),
          child:  CustomBookItem(
          image:  book?.image??''
          ),
        ),
        const SizedBox(
          height: 43,
        ),
        Text(
          book?.title??"No title",
          style: Styles.textstyle30.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 6,
        ),
        Opacity(
          opacity: 0.7,
          child: Text(
           book?.author.toString()??'No name',
            style: Styles.textstyle18.copyWith(
                fontStyle: FontStyle.italic, fontWeight: FontWeight.w500),
          ),
        ),
        BookRating(
          rating: book?.rating.toString()!='null'?
          book!.rating.toString():'0',
          mainaxisalignment: MainAxisAlignment.center,
        ),
        const SizedBox(
          height: 37,
        ),
         Padding(
          padding:const EdgeInsets.symmetric(horizontal: 38.0),
          child: BooksAction(price:book?.price.toString()==null?
          '${book?.price.toString()} pounds':'free'),
        ),
      ],
    );
  }
}
