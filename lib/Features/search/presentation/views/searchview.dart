import 'package:flutter/material.dart';
import 'package:flutter_application_1/Features/search/presentation/views/widgets/searchviewbody.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(child: SearchViewBody()),
    );
  }
}
