// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a fr locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final MessageLookup messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  final Map<String, Function> messages =
      _notInlinedMessages(_notInlinedMessages);

  String get localeName => 'fr';
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "appDescription": MessageLookupByLibrary.simpleMessage(
          "Obtenez tout type de classement comme les meilleurs films de 2023, les meilleurs livres pour entrepreneurs en quelques secondes grâce à Chat GPT 4.",
        ),
        "appTitle": MessageLookupByLibrary.simpleMessage("RankAI"),
        "entityCardAuthorUnknown":
            MessageLookupByLibrary.simpleMessage("Inconnu"),
        "entityCardDescriptionUnknown":
            MessageLookupByLibrary.simpleMessage("Inconnue"),
        "entityCardSeeMoreButton":
            MessageLookupByLibrary.simpleMessage("Voir plus"),
        "entityCardTitleUnknown":
            MessageLookupByLibrary.simpleMessage("Inconnu"),
        "lastRankingsSectionTitlePartOne":
            MessageLookupByLibrary.simpleMessage("Vos derniers "),
        "lastRankingsSectionTitlePartTwo":
            MessageLookupByLibrary.simpleMessage("classements"),
        "rankaiSlogan": MessageLookupByLibrary.simpleMessage(
          "Des classements en quelques secondes",
        ),
        "resultPageOtherRankingButton":
            MessageLookupByLibrary.simpleMessage("Autre classement"),
        "resultPageTitle": MessageLookupByLibrary.simpleMessage("Et voilà"),
        "resultsPageError":
            MessageLookupByLibrary.simpleMessage("Une erreur est survenue"),
        "searchPageCatchPhrase": MessageLookupByLibrary.simpleMessage(
          "Quel classement vous intéresse ?",
        ),
        "searchPageFieldHint": MessageLookupByLibrary.simpleMessage(
          "Les 10 meilleurs livres pour entrepreneurs",
        ),
        "searchPageGoButton":
            MessageLookupByLibrary.simpleMessage("C\'est parti"),
        "searchingPageMessagePartOne": MessageLookupByLibrary.simpleMessage(
          "Obtention du meilleur classement, ",
        ),
        "searchingPageMessagePartTwo":
            MessageLookupByLibrary.simpleMessage("juste pour vous..."),
      };
}
