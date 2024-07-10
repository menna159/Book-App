import 'package:flutter_application_1/Features/home/domain/entities/book_entity.dart';
import 'package:flutter_application_1/Features/home/domain/usecase/fetchfeaturedbooksusecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'featuredbookscubit_state.dart';

class FeaturedbookscubitCubit extends Cubit<FeaturedbookscubitState> {
  FeaturedbookscubitCubit({ required this.featuredBooksUseCase}) : super(FeaturedbookscubitInitial());
  int? pageNumber;
  FetchFeaturedBooksUseCase featuredBooksUseCase;
Future <void> fetchFeauredBooks({int pageNumber=0})async{
  if(pageNumber==0){
emit(FeaturedbookscubitLoading());
  }
  else{
  emit(FeaturedbookscubitPaginationLoading());
  }

var result=await featuredBooksUseCase.call(pageNumber);
result.fold((failure){
  if(pageNumber==0){
emit(FeaturedbookscubitFailure(error: failure.error));
  }else{
  emit(FeaturedbookscubitPaginationFailure(error: failure.error));
  }
},
(featuredbooks){
  emit(FeaturedbookscubitSuccess(books: featuredbooks));
});
}
}
