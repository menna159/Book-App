import 'package:flutter/material.dart';
import 'package:flutter_application_1/Features/home/domain/entities/book_entity.dart';
import 'package:flutter_application_1/Features/home/presentation/manager/featuredbooks_cubit/featuredbookscubit.dart';
import 'package:flutter_application_1/Features/home/presentation/views/widgets/custom_book_item.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FeaturedBookListView extends StatefulWidget {
   const FeaturedBookListView({super.key, required this.books});
 final List <BookEntity> books;
 
  @override
  State<FeaturedBookListView> createState() => _FeaturedBookListViewState();
}

class _FeaturedBookListViewState extends State<FeaturedBookListView> {
   late final ScrollController _scrollController;
  int nextPage=1;
  bool isLoading=false;
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
      if(!isLoading){
        isLoading=true;
     await BlocProvider.of<FeaturedbookscubitCubit>(context).fetchFeauredBooks(
        pageNumber:nextPage++ 
      );
      isLoading=false;
    }}
  }
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.3,
      child: ListView.builder(
        controller: _scrollController,
        itemCount: widget.books.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: ((context, index) {
          return  Padding(
            padding:const EdgeInsets.only(left: 10, top: 15),
            child: CustomBookItem(image: widget.books[index].image??''),
          );
        }),
      ),
    );
  }
}