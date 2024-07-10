import 'package:flutter/material.dart';

class SliddingWidget extends StatelessWidget {
  const SliddingWidget({
    Key? key,
    required this.slidinganimation,
  }) : super(key: key);

  final Animation<Offset> slidinganimation;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: slidinganimation,
        builder: (context, _) {
          return SlideTransition(
              position: slidinganimation,
              child: const Text(
                'Read free Books',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18),
              ));
        });
  }
}
