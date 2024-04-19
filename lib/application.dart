import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:rankai/core/router/router.dart';
import 'package:rankai/core/theme/rankai_theme.dart';
import 'package:rankai/generated/l10n.dart';

class Application extends ConsumerWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final GoRouter router = ref.watch(routerProvider);
    return KeyboardDismissOnTap(
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        theme: rankaiTheme,
        themeMode: ThemeMode.light,
        routerConfig: router,
        title: 'Rankai',
        supportedLocales: S.delegate.supportedLocales,
        localizationsDelegates: const <LocalizationsDelegate>[
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          FormBuilderLocalizations.delegate,
        ],
      ),
    );
  }
}
