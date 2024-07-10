import 'package:flutter_application_1/Features/home/domain/entities/book_entity.dart';
import 'package:flutter_application_1/Features/home/presentation/views/bookdetailsview.dart';
import 'package:flutter_application_1/Features/home/presentation/views/homeview.dart';
import 'package:flutter_application_1/Features/search/presentation/views/searchview.dart';
import 'package:flutter_application_1/Features/splach/presentation/views/splach_view.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static const homeviewroute = '/HomeView';
  static const searchviewroute = '/searchView';
  static const bookdetailsviewroute = '/bookdetailsview:book';
  static final router = GoRouter(routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const SplachView(),
    ),
    GoRoute(
      path: homeviewroute,
      builder: (context, state) => const HomeView(),
    ),
    GoRoute(
      path: searchviewroute,
      builder: (context, state) => const SearchView(),
    ),
    GoRoute(
      path: bookdetailsviewroute,
      builder: (context, state) {
       final   book=state.extra! as BookEntity;
        return  BookDetailsview(
        book:book
      );
})
  ]);
}
