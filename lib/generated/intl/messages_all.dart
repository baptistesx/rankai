// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that looks up messages for specific locales by
// delegating to the appropriate library.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:implementation_imports, file_names, unnecessary_new
// ignore_for_file:unnecessary_brace_in_string_interps, directives_ordering
// ignore_for_file:argument_type_not_assignable, invalid_assignment
// ignore_for_file:prefer_single_quotes, prefer_generic_function_type_aliases
// ignore_for_file:comment_references

import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';
import 'package:intl/src/intl_helpers.dart';
import 'package:rankai/generated/intl/messages_en.dart' as messages_en;
import 'package:rankai/generated/intl/messages_fr.dart' as messages_fr;

Map<String, LibraryLoader> _deferredLibraries = <String, LibraryLoader>{
  'en': () => new SynchronousFuture(null),
  'fr': () => new SynchronousFuture(null),
};

/// User programs should call this before using [localeName] for messages.
Future<bool> initializeMessages(String localeName) {
  final String? availableLocale = Intl.verifiedLocale(
    localeName,
    (String locale) => _deferredLibraries[locale] != null,
    onFailure: (_) => null,
  );
  if (availableLocale == null) {
    return new SynchronousFuture(false);
  }
  final LibraryLoader? lib = _deferredLibraries[availableLocale];
  lib == null ? new SynchronousFuture(false) : lib();
  initializeInternalMessageLookup(() => new CompositeMessageLookup());
  messageLookup.addLocale(availableLocale, _findGeneratedMessagesFor);
  return new SynchronousFuture(true);
}

MessageLookupByLibrary? _findExact(String localeName) {
  switch (localeName) {
    case 'en':
      return messages_en.messages;
    case 'fr':
      return messages_fr.messages;
    default:
      return null;
  }
}

MessageLookupByLibrary? _findGeneratedMessagesFor(String locale) {
  final String? actualLocale =
      Intl.verifiedLocale(locale, _messagesExistFor, onFailure: (_) => null);
  if (actualLocale == null) return null;
  return _findExact(actualLocale);
}

bool _messagesExistFor(String locale) {
  try {
    return _findExact(locale) != null;
  } catch (e) {
    return false;
  }
}

typedef Future<dynamic> LibraryLoader();
