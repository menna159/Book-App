import 'package:flutter/material.dart';
import 'package:flutter_application_1/Core/utils/approuter.dart';
import 'package:flutter_application_1/Core/utils/service_locator.dart';
import 'package:flutter_application_1/Core/utils/simpleobserver.dart';
import 'package:flutter_application_1/Features/home/data/repos/home_repo_implementation.dart';
import 'package:flutter_application_1/Features/home/domain/entities/book_entity.dart';
import 'package:flutter_application_1/Features/home/domain/usecase/fetchfeaturedbooksusecase.dart';
import 'package:flutter_application_1/Features/home/domain/usecase/fetchnewstbooksusecase.dart';
import 'package:flutter_application_1/Features/home/presentation/manager/cubit/newstbookscubit_cubit.dart';
import 'package:flutter_application_1/Features/home/presentation/manager/featuredbooks_cubit/featuredbookscubit.dart';
import 'package:flutter_application_1/constants.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/adapters.dart';

void main() async{
   setup();
  await Hive.initFlutter();
  Hive.registerAdapter(BookEntityAdapter());
  await Hive.openBox<BookEntity>(kfeaturedbox);
  await Hive.openBox<BookEntity>(knewstbox);
  Bloc.observer=MyBlocObserver();
 
  runApp(const BooklyApp());
  
}

class BooklyApp extends StatelessWidget {
  const BooklyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => FeaturedbookscubitCubit(
            featuredBooksUseCase: FetchFeaturedBooksUseCase(
              locator.get<HomeRpoImplementation>()
            )
          )..fetchFeauredBooks(),
        ),
        BlocProvider(
          create: (context) => NewstbookscubitCubit(
           fetchNewstBooksUseCase: FetchNewstBooksUseCase(
            locator.get<HomeRpoImplementation>()
           )
          )..fetchNewstBooks(),
        ),
      ],
      child:  MaterialApp.router(
      routerConfig: AppRouter.router,
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: kprimarycolor,
          textTheme:
              GoogleFonts.montserratTextTheme(ThemeData.dark().textTheme)),
    )
    );
    
   
  }
}
