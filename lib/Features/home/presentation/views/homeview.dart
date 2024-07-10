import 'package:flutter/material.dart';
import 'package:flutter_application_1/Features/home/presentation/views/widgets/homeviewbody.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(child: HomeViewBody()),
    );
  }
}
