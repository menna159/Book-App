part of 'featuredbookscubit.dart';


 abstract class FeaturedbookscubitState {}

 class FeaturedbookscubitInitial extends FeaturedbookscubitState {}
 class FeaturedbookscubitLoading extends FeaturedbookscubitState {}
 class FeaturedbookscubitPaginationLoading extends FeaturedbookscubitState {}
class FeaturedbookscubitFailure extends FeaturedbookscubitState {
  final String error;

  FeaturedbookscubitFailure({required this.error});
}
class FeaturedbookscubitPaginationFailure extends FeaturedbookscubitState {
  final String error;

  FeaturedbookscubitPaginationFailure({required this.error});
}
class FeaturedbookscubitSuccess extends FeaturedbookscubitState {
  final List <BookEntity> books;

  FeaturedbookscubitSuccess({required this.books});
}