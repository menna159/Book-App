import 'package:flutter/material.dart';
import 'package:flutter_application_1/Core/utils/widgets/custom_fading_widget.dart';
import 'package:flutter_application_1/Features/home/presentation/views/widgets/custom_book_item_loadingindicator.dart';

class FeaturedBooksListViewLoadingIndicator extends StatelessWidget {
  const FeaturedBooksListViewLoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return  CustomFadingWidget(
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.3,
        child: ListView.builder(
          itemCount: 15,
          scrollDirection: Axis.horizontal,
          itemBuilder: ((context, index) {
            return const Padding(
              padding: EdgeInsets.only(left: 10, top: 15),
              child:CustomBookItemLoadingIndicator()
            );
          }),
        ),
      ),
    );
  }
}