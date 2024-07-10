import 'package:flutter/material.dart';
import 'package:flutter_application_1/Core/utils/widgets/custombutton.dart';

class BooksAction extends StatelessWidget {
  const BooksAction({super.key, required this.price});
 final String price;
  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
        CustomButton(
            borderRadius:const BorderRadius.only(
                topLeft: Radius.circular(12), bottomLeft: Radius.circular(12)),
            fontSize: 18,
            textcolor: Colors.black,
            backgroundColor: Colors.white,
            text: price),
      const  CustomButton(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(12),
                bottomRight: Radius.circular(12)),
            fontSize: 16,
            textcolor: Colors.white,
            backgroundColor: Color(0xffEF8262),
            text: 'Free Preview'),
      ],
    );
  }
}
