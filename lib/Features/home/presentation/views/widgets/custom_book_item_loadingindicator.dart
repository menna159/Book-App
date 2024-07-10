import 'package:flutter/material.dart';

class CustomBookItemLoadingIndicator extends StatelessWidget {
  const CustomBookItemLoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return  AspectRatio(
      aspectRatio: 2.6 / 4,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Container(
          color: Colors.grey[50],
        )
      ),
    );
  }
}