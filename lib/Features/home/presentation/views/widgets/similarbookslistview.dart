import 'package:flutter/material.dart';
import 'package:flutter_application_1/Features/home/presentation/views/widgets/custom_book_item.dart';

class SimilarBooksListview extends StatelessWidget {
  const SimilarBooksListview({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.15,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: ((context, index) {
          return const Padding(
            padding: EdgeInsets.only(left: 10, top: 15),
            child: CustomBookItem(
              image: '',
            ),
          );
        }),
      ),
    );
  }
}
