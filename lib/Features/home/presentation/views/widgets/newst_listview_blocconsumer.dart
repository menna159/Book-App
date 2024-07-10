import 'package:flutter/material.dart';
import 'package:flutter_application_1/Features/home/domain/entities/book_entity.dart';
import 'package:flutter_application_1/Features/home/presentation/manager/cubit/newstbookscubit_cubit.dart';
import 'package:flutter_application_1/Features/home/presentation/views/widgets/newst_listview.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewstListViewBlocConsumer extends StatefulWidget {
  const NewstListViewBlocConsumer({super.key});

  @override
  State<NewstListViewBlocConsumer> createState() => _NewstListViewBlocConsumerState();
}

class _NewstListViewBlocConsumerState extends State<NewstListViewBlocConsumer> {
  List <BookEntity> books=[];

  @override
  Widget build(BuildContext context) {
    return  BlocConsumer<NewstbookscubitCubit, NewstbookscubitState>(
      listener: (context, state) {
       if(state is NewstbookscubitSuccess){
        books.addAll(state.books);      
       }
      },
      builder: (context, state) {
        
         if(state is NewstbookscubitSuccess||state is NewstbookscubitLoadingPagination){
          return NewstListView(newstBooks: books,);
        }
        else{
         return const Center(
          child: CircularProgressIndicator(),
         );
        }
       
      },
    );
  }
}