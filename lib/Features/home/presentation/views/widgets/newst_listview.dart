import 'package:flutter/material.dart';
import 'package:flutter_application_1/Core/utils/approuter.dart';
import 'package:flutter_application_1/Features/home/domain/entities/book_entity.dart';
import 'package:flutter_application_1/Features/home/presentation/manager/cubit/newstbookscubit_cubit.dart';
import 'package:flutter_application_1/Features/home/presentation/views/widgets/newst_listviewitem.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class NewstListView extends StatefulWidget {
  const NewstListView({super.key, required this.newstBooks});
final List <BookEntity> newstBooks;

  @override
  State<NewstListView> createState() => _NewstListViewState();
}

class _NewstListViewState extends State<NewstListView> {
 late final ScrollController _scrollController;
 int nextPage=1;
 bool isloading=false;
  BookEntity? book;
 @override
  void initState() {
     _scrollController=ScrollController();
    _scrollController.addListener(_scrollListener);
    super.initState();
  }
   void _scrollListener() async{
     var currentPosition=_scrollController.position.pixels;
    var maxLenght=_scrollController.position.maxScrollExtent;
    if(currentPosition>=0.7*maxLenght){
      if(!isloading){
        isloading=true;
    await BlocProvider.of<NewstbookscubitCubit>(context).fetchNewstBooks(
    pageNumber: nextPage++
);
isloading=false;
      }   
    }
  }
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: _scrollController,
      itemCount: widget.newstBooks.length,
      // physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return  Padding(
          padding:const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15),
          
          child: NewstListViewItem(
            function: (){
             book=widget.newstBooks[index];
             GoRouter.of(context).push(AppRouter.bookdetailsviewroute,extra: book);
            },
            authorName: widget.newstBooks[index].author,
            price:widget.newstBooks[index].price.toString(),
            rating: widget.newstBooks[index].rating.toString(),
            title: widget.newstBooks[index].title,
            image: widget.newstBooks[index].image,
          ),
        );
      },
    );
  }

 
}
