import 'package:flutter/material.dart';
import 'package:flutter_ar/router/router_config.dart';
import 'package:flutter_ar/utils/colors.dart';
import 'package:flutter_ar/utils/constant.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../router/routers.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () async {
      goToNext(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    //final userData = ref.watch(goRouterProvider).goNamed(RoutesPath.dashboard);
    //goToNext(context, ref);
    return Container(
      color: AppColors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Icon(
            Icons.eco,
            size: 256,
            color: AppColors.accentColor,
          )
        ],
      ),
    );
  }

  goToNext(BuildContext context) async {
    context.goNamed(
      Routes.dashboard.name,
    );
    // goRouterProvider
    //ref.read(goRouterProvider);

    //goRouterProvider.read(Routes.dashboard);

    //GoRouter.of(context).pushReplacementNamed(goRouterProvider.);
    //goRouterProvider

    //deleteMovie(movie.id, ref, context),
    //GoRouter.of(context).pushReplacementNamed(RoutesPath.dashboard);
    //Navigator.pushReplacementNamed(context, Routes.home);
    // Future.delayed(const Duration(seconds: 3), () {
    //   Navigator.pushReplacementNamed(context, Routes.home);
    // });
  }
}
