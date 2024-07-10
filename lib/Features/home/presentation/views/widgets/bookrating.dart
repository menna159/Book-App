import 'package:flutter/material.dart';
import 'package:flutter_application_1/Core/utils/styles.dart';
import 'package:font_awesome_icon_class/font_awesome_icon_class.dart';

// ignore: must_be_immutable
class BookRating extends StatelessWidget {
  MainAxisAlignment? mainaxisalignment;
  BookRating({super.key,
   this.mainaxisalignment = MainAxisAlignment.start,
   required this.rating});
   final String rating;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainaxisalignment!,
      children: [
        const Icon(
          FontAwesomeIcons.solidStar,
          color: Color(0xffFFDD4F),
          size: 14,
        ),
        const SizedBox(width: 6.3),
         Text(
          rating,
          style: Styles.textstyle16,
        ),
        const SizedBox(
          width: 5,
        ),
        Opacity(
            opacity: 0.5,
            child: Text('(254)',
                style:
                    Styles.textstyle14.copyWith(fontWeight: FontWeight.w600)))
      ],
    );
  }
}
