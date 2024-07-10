import 'package:flutter/material.dart';
import 'package:flutter_application_1/Core/utils/functions/buildsnackbar.dart';
import 'package:flutter_application_1/Features/home/domain/entities/book_entity.dart';
import 'package:flutter_application_1/Features/home/presentation/manager/featuredbooks_cubit/featuredbookscubit.dart';
import 'package:flutter_application_1/Features/home/presentation/views/widgets/featured_book_listview.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class FeaturedBooksListViewBlocConsumer extends StatefulWidget {
  const FeaturedBooksListViewBlocConsumer({
    super.key,
  });

  @override
  State<FeaturedBooksListViewBlocConsumer> createState() => _FeaturedBooksListViewBlocConsumerState();
}

class _FeaturedBooksListViewBlocConsumerState extends State<FeaturedBooksListViewBlocConsumer> {
  List <BookEntity> books=[];
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FeaturedbookscubitCubit, FeaturedbookscubitState>(
      listener: (context, state) {
        if(state is FeaturedbookscubitSuccess){
               books.addAll(state.books);
        }
       if(state is FeaturedbookscubitPaginationFailure){
        ScaffoldMessenger.of(context).showSnackBar(buildSnackBar(state.error));
       }
      },
      builder: (context, state) {
        
         if(state is FeaturedbookscubitSuccess
         ||state is FeaturedbookscubitPaginationLoading
         ||state is FeaturedbookscubitPaginationFailure){
             return  FeaturedBookListView(
              
              books: books,
             );
        }
        else if (state is FeaturedbookscubitFailure){
          return Text(state.error);
        }
        else{
          return const Center(child:  CircularProgressIndicator());
        }
  
      },
    );
  }
}