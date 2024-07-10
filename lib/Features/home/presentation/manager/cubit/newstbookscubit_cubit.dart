
import 'package:flutter_application_1/Features/home/domain/entities/book_entity.dart';
import 'package:flutter_application_1/Features/home/domain/usecase/fetchnewstbooksusecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'newstbookscubit_state.dart';

class NewstbookscubitCubit extends Cubit<NewstbookscubitState> {
  NewstbookscubitCubit({required this.fetchNewstBooksUseCase}) : super(NewstbookscubitInitial());
  FetchNewstBooksUseCase fetchNewstBooksUseCase;
  Future<void> fetchNewstBooks({int pageNumber=0}) async {
    if(pageNumber==0){
 emit(NewstbookscubitLoading());
    }
    else {
   emit(NewstbookscubitLoadingPagination());}
 var result= await fetchNewstBooksUseCase.call(pageNumber);
 result.fold((failure){
  emit(NewstbookscubitFailure(error: failure.error));
  
 },(books){
emit(NewstbookscubitSuccess(books: books));

 });
  }}
