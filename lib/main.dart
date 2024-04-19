import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:rankai/application.dart';
import 'package:rankai/core/providers/package_info.dart';
import 'package:rankai/core/providers/shared_preferences.dart';
import 'package:rankai/environnements.dart';
import 'package:rankai/firebase_options_dev.dart' as firebase_dev;
import 'package:rankai/firebase_options_preprod.dart' as firebase_preprod;
import 'package:rankai/firebase_options_prod.dart' as firebase_prod;
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final Environment env = Environment.fromEnv();

  SystemChrome.setPreferredOrientations(<DeviceOrientation>[
    DeviceOrientation.portraitUp,
  ]);

  // Init Firebase
  await env.map(
    dev: (_) => Firebase.initializeApp(
      options: firebase_dev.DefaultFirebaseOptions.currentPlatform,
    ),
    preprod: (_) => Firebase.initializeApp(
      options: firebase_preprod.DefaultFirebaseOptions.currentPlatform,
    ),
    prod: (_) => Firebase.initializeApp(
      options: firebase_prod.DefaultFirebaseOptions.currentPlatform,
    ),
  );

  runApp(
    ProviderScope(
      overrides: <Override>[
        packageInfoProvider.overrideWithValue(
          await PackageInfo.fromPlatform(),
        ),
        sharedPreferencesProvider.overrideWithValue(
          await SharedPreferences.getInstance(),
        ),
      ],
      child: const Application(),
    ),
  );
}
