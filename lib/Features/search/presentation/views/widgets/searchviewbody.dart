import 'package:flutter/material.dart';
import 'package:flutter_application_1/Core/utils/styles.dart';
import 'package:flutter_application_1/Features/home/presentation/views/widgets/newst_listview.dart';
import 'package:flutter_application_1/Features/search/presentation/views/widgets/customtextfield.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 16,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: CustomTextField(),
        ),
        SizedBox(
          height: 16,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: Text(
            'Best seller',
            style: Styles.textstyle18,
          ),
        ),
        SizedBox(
          height: 16,
        ),
        Expanded(child: NewstListView(newstBooks: [],)),
      ],
    );
  }
}
