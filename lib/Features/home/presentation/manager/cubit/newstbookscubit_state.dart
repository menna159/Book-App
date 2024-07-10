part of 'newstbookscubit_cubit.dart';


 abstract class NewstbookscubitState {}

 class NewstbookscubitInitial extends NewstbookscubitState {}
 class NewstbookscubitLoading extends NewstbookscubitState {}
 class NewstbookscubitLoadingPagination extends NewstbookscubitState {}
  class NewstbookscubitSuccess extends NewstbookscubitState {
     final List <BookEntity> books;

  NewstbookscubitSuccess({required this.books});
  }
   class NewstbookscubitFailure extends NewstbookscubitState {
   final String error;

  NewstbookscubitFailure({required this.error});

   }