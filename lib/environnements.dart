import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'environnements.freezed.dart';
part 'environnements.g.dart';

const String _kBackendUrl = String.fromEnvironment(
  'BACKEND_URL',
);
const String _kEnvironmentInput =
    String.fromEnvironment('ENV', defaultValue: 'dev');
const String _kName =
    String.fromEnvironment('NAME', defaultValue: 'development');
const String _kOpenAiKey = String.fromEnvironment('OPEN_AI_KEY');

@Riverpod(keepAlive: true)
Environment environment(EnvironmentRef ref) => Environment.fromEnv();

@freezed
sealed class Environment with _$Environment {
  const factory Environment.dev({
    required String name,
    required String backendUrl,
    required String openAiKey,
  }) = DevEnvironment;

  factory Environment.fromEnv() {
    switch (_kEnvironmentInput) {
      case 'dev':
        return const Environment.dev(
          name: _kName,
          backendUrl: _kBackendUrl,
          openAiKey: _kOpenAiKey,
        );
      case 'preprod':
        return const Environment.preprod(
          name: _kName,
          backendUrl: _kBackendUrl,
          openAiKey: _kOpenAiKey,
        );
      case 'prod':
        return const Environment.prod(
          name: _kName,
          backendUrl: _kBackendUrl,
          openAiKey: _kOpenAiKey,
        );
      default:
        throw Exception('Unknown environment $_kEnvironmentInput');
    }
  }

  const factory Environment.preprod({
    required String name,
    required String backendUrl,
    required String openAiKey,
  }) = PreProdEnvironment;

  const factory Environment.prod({
    required String name,
    required String backendUrl,
    required String openAiKey,
  }) = ProdEnvironment;

  const Environment._();
}
