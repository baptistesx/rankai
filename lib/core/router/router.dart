import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rankai/core/router/routes.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'router.g.dart';

final GlobalKey<NavigatorState> rootKey =
    GlobalKey<NavigatorState>(debugLabel: 'rootNav');

@Riverpod(keepAlive: true)
GoRouter router(RouterRef ref) {
  final GoRouter router = GoRouter(
    navigatorKey: rootKey,
    initialLocation: const WelcomeRoute().location,
    debugLogDiagnostics: kDebugMode,
    routes: $appRoutes,
  );

  ref.onDispose(() => router.dispose());

  return router;
}
