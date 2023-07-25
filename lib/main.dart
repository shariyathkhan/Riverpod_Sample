import 'package:flutter/material.dart';
import 'package:flutter_ar/utils/app_themes.dart';
import 'package:flutter_ar/utils/constant.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'router/router_config.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, ref) {
    return MaterialApp.router(
      title: Constants.title,
      routerConfig: ref.read(goRouterProvider),
      // localizationsDelegates: AppLocalizations.localizationsDelegates,
      // supportedLocales: AppLocalizations.supportedLocales,
      theme: appTheme(),
    );
  }
}
