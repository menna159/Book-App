import 'package:flutter/cupertino.dart';
import 'package:flutter_application_1/Core/utils/styles.dart';
import 'package:flutter_application_1/Features/home/presentation/views/widgets/customhome_appbar.dart';
import 'package:flutter_application_1/Features/home/presentation/views/widgets/featuredbookslistviewblocConsumer.dart';
import 'package:flutter_application_1/Features/home/presentation/views/widgets/newst_listview_blocconsumer.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});
  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(slivers: [
      SliverToBoxAdapter(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.0),
              child: CustomAppBar(),
            ),
            FeaturedBooksListViewBlocConsumer(),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.0),
              child: Text(
                'Newst Books',
                style: Styles.textstyle18,
              ),
            ),
            SizedBox(
              height: 20,
            )
          ],
        ),
      ),
      SliverFillRemaining(
        child:NewstListViewBlocConsumer(),
      )
    ]);
  }
}


