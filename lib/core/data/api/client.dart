import 'package:http/http.dart' as http;
import 'package:rankai/environnements.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

final Provider<Client> clientProvider =
    Provider<Client>((ProviderRef<Client> ref) {
  // final token = ref.watch(tokenProvider); // TODO
  final Environment env = Environment
      .fromEnv(); // Assurez-vous que cette classe existe ou modifiez selon votre implémentation
  return Client(env.openAiKey, env.backendUrl);
});

class Client {
  final String? token;
  final String backendUrl;
  http.Client httpClient;

  Client(this.token, this.backendUrl) : httpClient = http.Client();

  void dispose() {
    httpClient.close();
  }

  Future<http.Response> get(String endpoint) async {
    final Uri uri = Uri.parse('$backendUrl$endpoint');
    final Map<String, String> headers = token != null
        ? <String, String>{'Authorization': 'Bearer $token'}
        : <String, String>{};
    return httpClient.get(uri, headers: headers);
  }

  Future<http.Response> post(String endpoint, {required dynamic body}) async {
    final Uri uri = Uri.parse('$backendUrl$endpoint');
    final Map<String, String> headers = <String, String>{
      'Content-Type': 'application/json',
      if (token != null) 'Authorization': 'Bearer $token',
    };
    return httpClient.post(uri, headers: headers, body: body);
  }
}
