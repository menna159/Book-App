import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Core/utils/styles.dart';
import 'package:flutter_application_1/Features/home/domain/entities/book_entity.dart';
import 'package:flutter_application_1/Features/home/presentation/views/widgets/bookrating.dart';
import 'package:flutter_application_1/constants.dart';


class NewstListViewItem extends StatelessWidget {
  const NewstListViewItem({super.key,
    this.authorName,
    this.title,
     this.price,
      this.rating, this.image,this.book,this.function});
  final String? authorName,price,title,rating,image;
  final BookEntity? book;
  final dynamic function;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 125,
      child: GestureDetector(
        onTap: function,
        child: Row(
          children: [
            AspectRatio(
              aspectRatio: 2.5 / 4,
              child: Container(
                height: MediaQuery.of(context).size.height * 0.3,
                width: MediaQuery.of(context).size.width,
              
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    ),
                     child:ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: CachedNetworkImage(
          imageUrl: image!,
         
           ),
      ),
              ),
            ),
            const SizedBox(width: 30),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.5,
                    child: Text(
                      authorName!,
                      style: Styles.textstyle20
                          .copyWith(fontFamily: kGtsectrafine),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                   Text(
                   title!,
                    style: Styles.textstyle20,
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  Row(
                    children: [
                      Text(
                        price!='0'?price!:'free',
                        style: Styles.textstyle20
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                      const Spacer(),
                      BookRating(rating: rating!='null'?rating!:'0',)
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
