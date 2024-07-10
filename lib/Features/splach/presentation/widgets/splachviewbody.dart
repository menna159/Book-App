import 'package:flutter/cupertino.dart';
import 'package:flutter_application_1/Core/utils/approuter.dart';
import 'package:flutter_application_1/Core/utils/assets.dart';
import 'package:flutter_application_1/Features/splach/presentation/widgets/sliddingwidget.dart';
import 'package:go_router/go_router.dart';

class SplachViewbody extends StatefulWidget {
  const SplachViewbody({super.key});
  @override
  State<SplachViewbody> createState() => _SplachViewbodyState();
}

class _SplachViewbodyState extends State<SplachViewbody>
    with SingleTickerProviderStateMixin {
  late AnimationController animationcontroller;
  late Animation<Offset> slidinganimation;
  @override
  void initState() {
    super.initState();
    initSliding();
    navigateToHome();
  }

  @override
  void dispose() {
    super.dispose();
    animationcontroller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Image(
          image: AssetImage(AssetsData.logo),
          height: 400,
          fit: BoxFit.fill,
        ),
        const SizedBox(
          height: 10,
        ),
        SliddingWidget(slidinganimation: slidinganimation)
      ],
    );
  }

  void initSliding() {
    animationcontroller =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    slidinganimation =
        Tween<Offset>(begin: const Offset(0, 10), end: Offset.zero)
            .animate(animationcontroller);
    animationcontroller.forward();
  }

  void navigateToHome() {
    Future.delayed(const Duration(seconds: 2), (() {
      // Get.to(const HomeView(),
      // transition:Transition.fade,
      // duration: kTransitionDuration );
      GoRouter.of(context).push(AppRouter.homeviewroute);
    }));
  }
}
