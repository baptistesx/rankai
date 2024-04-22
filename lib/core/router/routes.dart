import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rankai/modules/results/ui/results_page.dart';
import 'package:rankai/modules/search/ui/search_page.dart';
import 'package:rankai/modules/searching/ui/searching_page.dart';
import 'package:rankai/modules/welcome/ui/welcome_page.dart';

part 'routes.g.dart';

class ResultsRoute extends GoRouteData {
  final String? userPrompt;
  final String? rankingId;

  const ResultsRoute({
    this.userPrompt,
    this.rankingId,
  });

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return ResultsPage(
      userPrompt: userPrompt,
      rankingId: rankingId,
    );
  }
}

class SearchingRoute extends GoRouteData {
  final String userPrompt;

  const SearchingRoute({required this.userPrompt});

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return SearchingPage(userPrompt: userPrompt);
  }
}

class SearchRoute extends GoRouteData {
  const SearchRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const SearchPage();
  }
}

// Onboarding
@TypedGoRoute<WelcomeRoute>(
  path: '/welcome',
  routes: <TypedRoute<RouteData>>[
    TypedGoRoute<SearchRoute>(
      path: 'search',
      routes: <TypedRoute<RouteData>>[
        TypedGoRoute<SearchingRoute>(
          path: 'searching',
        ),
      ],
    ),
    TypedGoRoute<ResultsRoute>(
      path: 'results',
    ),
  ],
)

// Welcome
class WelcomeRoute extends GoRouteData {
  const WelcomeRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const WelcomePage();
  }
}
