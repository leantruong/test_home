import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_home/routes/app_router.dart';

class App extends ConsumerWidget {
  App({super.key});
  final appRouter = AppRouter();

  @override
  Widget build(BuildContext context, WidgetRef ref) {


    return MaterialApp.router(
      title: 'Test Home',
      routeInformationParser: appRouter.defaultRouteParser(),
      routerDelegate: appRouter.delegate(),
    );
  }
}
