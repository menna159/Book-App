import 'package:flutter/material.dart';

class CustomFadingWidget extends StatefulWidget  {
  final Widget? child;

 const  CustomFadingWidget({super.key,this.child});

  @override
  State<CustomFadingWidget> createState() => _CustomFadingWidgetState();
}

class _CustomFadingWidgetState extends State<CustomFadingWidget> with SingleTickerProviderStateMixin{
 Animation? animation;
 AnimationController? animationController;
 @override
  void initState() {
   animationController=AnimationController(vsync: this,duration: const Duration(microseconds: 800));
   animation=Tween<double>(begin: 0.2,end: 0.8).animate(animationController!);
   animationController?.addListener(() {
    setState(() {
      
    });
   });
   animationController?.repeat(reverse: true);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return 
     Opacity(
      opacity:animation?.value,
      child: widget.child,
    );
  }
}