// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    DetailRoute.name: (routeData) {
      final args = routeData.argsAs<DetailRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: DetailScreen(
          key: args.key,
          model: args.model,
        ),
      );
    },
    PersonListRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const PersonListScreen(),
      );
    },
  };
}

/// generated route for
/// [DetailScreen]
class DetailRoute extends PageRouteInfo<DetailRouteArgs> {
  DetailRoute({
    Key? key,
    required PersonResponse model,
    List<PageRouteInfo>? children,
  }) : super(
          DetailRoute.name,
          args: DetailRouteArgs(
            key: key,
            model: model,
          ),
          initialChildren: children,
        );

  static const String name = 'DetailRoute';

  static const PageInfo<DetailRouteArgs> page = PageInfo<DetailRouteArgs>(name);
}

class DetailRouteArgs {
  const DetailRouteArgs({
    this.key,
    required this.model,
  });

  final Key? key;

  final PersonResponse model;

  @override
  String toString() {
    return 'DetailRouteArgs{key: $key, model: $model}';
  }
}

/// generated route for
/// [PersonListScreen]
class PersonListRoute extends PageRouteInfo<void> {
  const PersonListRoute({List<PageRouteInfo>? children})
      : super(
          PersonListRoute.name,
          initialChildren: children,
        );

  static const String name = 'PersonListRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
