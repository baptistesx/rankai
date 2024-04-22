// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:rankai/generated/intl/messages_all.dart';

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'fr'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (Locale supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  static S? _current;

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static S get current {
    assert(
      _current != null,
      'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.',
    );
    return _current!;
  }

  S();

  /// `Get any kind of ranking as the best movies of 2023, the best books for entrepreneurs in few seconds thanks to Chat GPT 4.`
  String get appDescription {
    return Intl.message(
      'Get any kind of ranking as the best movies of 2023, the best books for entrepreneurs in few seconds thanks to Chat GPT 4.',
      name: 'appDescription',
      desc: '',
      args: <Object>[],
    );
  }

  /// `RankAI`
  String get appTitle {
    return Intl.message(
      'RankAI',
      name: 'appTitle',
      desc: '',
      args: <Object>[],
    );
  }

  /// `Unknown`
  String get entityCardAuthorUnknown {
    return Intl.message(
      'Unknown',
      name: 'entityCardAuthorUnknown',
      desc: '',
      args: <Object>[],
    );
  }

  /// `Unknown`
  String get entityCardDescriptionUnknown {
    return Intl.message(
      'Unknown',
      name: 'entityCardDescriptionUnknown',
      desc: '',
      args: <Object>[],
    );
  }

  /// `See More`
  String get entityCardSeeMoreButton {
    return Intl.message(
      'See More',
      name: 'entityCardSeeMoreButton',
      desc: '',
      args: <Object>[],
    );
  }

  /// `Unknown`
  String get entityCardTitleUnknown {
    return Intl.message(
      'Unknown',
      name: 'entityCardTitleUnknown',
      desc: '',
      args: <Object>[],
    );
  }

  /// `Your last `
  String get lastRankingsSectionTitlePartOne {
    return Intl.message(
      'Your last ',
      name: 'lastRankingsSectionTitlePartOne',
      desc: '',
      args: <Object>[],
    );
  }

  /// `rankings`
  String get lastRankingsSectionTitlePartTwo {
    return Intl.message(
      'rankings',
      name: 'lastRankingsSectionTitlePartTwo',
      desc: '',
      args: <Object>[],
    );
  }

  /// `Providing rankings in seconds`
  String get rankaiSlogan {
    return Intl.message(
      'Providing rankings in seconds',
      name: 'rankaiSlogan',
      desc: '',
      args: <Object>[],
    );
  }

  /// `Get a different ranking`
  String get resultPageOtherRankingButton {
    return Intl.message(
      'Get a different ranking',
      name: 'resultPageOtherRankingButton',
      desc: '',
      args: <Object>[],
    );
  }

  /// `Here it is`
  String get resultPageTitle {
    return Intl.message(
      'Here it is',
      name: 'resultPageTitle',
      desc: '',
      args: <Object>[],
    );
  }

  /// `An error occured`
  String get resultsPageError {
    return Intl.message(
      'An error occured',
      name: 'resultsPageError',
      desc: '',
      args: <Object>[],
    );
  }

  /// `Getting the best ranking, `
  String get searchingPageMessagePartOne {
    return Intl.message(
      'Getting the best ranking, ',
      name: 'searchingPageMessagePartOne',
      desc: '',
      args: <Object>[],
    );
  }

  /// `just for you...`
  String get searchingPageMessagePartTwo {
    return Intl.message(
      'just for you...',
      name: 'searchingPageMessagePartTwo',
      desc: '',
      args: <Object>[],
    );
  }

  /// `What ranking are you interested for ?`
  String get searchPageCatchPhrase {
    return Intl.message(
      'What ranking are you interested for ?',
      name: 'searchPageCatchPhrase',
      desc: '',
      args: <Object>[],
    );
  }

  /// `The 10 best books for entrepreneurs`
  String get searchPageFieldHint {
    return Intl.message(
      'The 10 best books for entrepreneurs',
      name: 'searchPageFieldHint',
      desc: '',
      args: <Object>[],
    );
  }

  /// `Ranking, please`
  String get searchPageGoButton {
    return Intl.message(
      'Ranking, please',
      name: 'searchPageGoButton',
      desc: '',
      args: <Object>[],
    );
  }

  static Future<S> load(Locale locale) {
    final String name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final String localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final S instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  static S of(BuildContext context) {
    final S? instance = S.maybeOf(context);
    assert(
      instance != null,
      'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?',
    );
    return instance!;
  }
}
