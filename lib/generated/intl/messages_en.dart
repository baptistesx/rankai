// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
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

  String get localeName => 'en';
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "appDescription": MessageLookupByLibrary.simpleMessage(
          "Get any kind of ranking as the best movies of 2023, the best books for entrepreneurs in few seconds thanks to Chat GPT 4.",
        ),
        "appTitle": MessageLookupByLibrary.simpleMessage("RankAI"),
        "entityCardAuthorUnknown":
            MessageLookupByLibrary.simpleMessage("Unknown"),
        "entityCardDescriptionUnknown":
            MessageLookupByLibrary.simpleMessage("Unknown"),
        "entityCardSeeMoreButton":
            MessageLookupByLibrary.simpleMessage("See More"),
        "entityCardTitleUnknown":
            MessageLookupByLibrary.simpleMessage("Unknown"),
        "lastRankingsSectionTitlePartOne":
            MessageLookupByLibrary.simpleMessage("Your last "),
        "lastRankingsSectionTitlePartTwo":
            MessageLookupByLibrary.simpleMessage("rankings"),
        "rankaiSlogan": MessageLookupByLibrary.simpleMessage(
          "Providing rankings in seconds",
        ),
        "resultPageOtherRankingButton":
            MessageLookupByLibrary.simpleMessage("Get a different ranking"),
        "resultPageTitle": MessageLookupByLibrary.simpleMessage("Here it is"),
        "resultsPageError":
            MessageLookupByLibrary.simpleMessage("An error occured"),
        "searchPageCatchPhrase": MessageLookupByLibrary.simpleMessage(
          "What ranking are you interested for ?",
        ),
        "searchPageFieldHint": MessageLookupByLibrary.simpleMessage(
          "The 10 best books for entrepreneurs",
        ),
        "searchPageGoButton":
            MessageLookupByLibrary.simpleMessage("Ranking, please"),
        "searchingPageMessagePartOne":
            MessageLookupByLibrary.simpleMessage("Getting the best ranking, "),
        "searchingPageMessagePartTwo":
            MessageLookupByLibrary.simpleMessage("just for you..."),
      };
}
