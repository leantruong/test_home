import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:test_home/features/person/presentation/screens/detail_screen.dart';
import 'package:test_home/features/person/presentation/screens/person_screen.dart';
import 'package:test_home/shared/domain/models/person/person_response.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class AppRouter extends _$AppRouter {
  @override
  RouteType get defaultRouteType => const RouteType.material();

  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: PersonListRoute.page, initial: true),
        AutoRoute(page: DetailRoute.page, ),
      ];
}
