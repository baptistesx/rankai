import 'dart:convert';

import 'package:http/src/response.dart';
import 'package:rankai/core/data/api/client.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'ranking_api.g.dart';

@Riverpod(keepAlive: true)
HttpRankingApi rankingApi(RankingApiRef ref) {
  return HttpRankingApi(
    client: ref.watch(clientProvider),
  );
}

class HttpRankingApi implements RankingApi {
  final Client _client;

  HttpRankingApi({
    required client,
  }) : _client = client;

  @override
  Future<Map<dynamic, dynamic>> getRanking(
    String userPrompt,
  ) async {
    try {
      final Response response = await _client.post(
        '/v1/chat/completions',
        body: jsonEncode(
          <String, Object>{
            'model': 'gpt-3.5-turbo',
            'messages': <Map<String, String>>[
              <String, String>{
                'role': 'user',
                'content': _enrichUserPrompt(userPrompt),
              },
            ],
          },
        ),
      );

      if (response.bodyBytes.isNotEmpty) {
        final Map<dynamic, dynamic> decodedResponse =
            jsonDecode(utf8.decode(response.bodyBytes))
                as Map<dynamic, dynamic>;

        if (response.statusCode != 200 && response.statusCode != 201) {
          throw decodedResponse['message'];
        } else {
          return json
              .decode(decodedResponse['choices'][0]['message']['content']);
        }
      } else {
        throw 'Error';
      }
    } catch (e) {
      rethrow;
    }
  }

  String _enrichUserPrompt(String userPrompt) {
    return '''
      Here is a ranking need (user prompt): "$userPrompt"

      Here is the desired JSON format for the response:
            {
              "id": string,
              "title": string,
              "prompt": string,
              "userPrompt": string,
              "promptDate": iso date time string,
              "entities": [
                          {
                            "id": string,
                            "ranking": int,
                            "rating": double?,
                            "author": string?,
                            "imageUrl": string?,
                            "date": iso date string?,
                            "description": string?,
                            "name": string,
                            "rankingSourceUrl": string,
                            "category": string?,
                            "price": string?
                          }
            ]}
      "promptDate" is the current date with iso format.
      "id" fields correspond to a uuid you generate, title to the user prompt nicely formatted (following its language), 'prompt' is the total prompt you received from me and 'entitied' correspond to the list of element you have to provide ranked.
      Return only the json needed based on what you knoew, no need of real-time or up-to-date information .
      Please include all relevant information such as the author, publication date with iso format, cover image url, brief description, etc... 
      For the description field, use the language of the initial prompt between " ".
      Don't give fake or example urls, just real usable urls or don't return the field.
     ''';
  }
}

abstract class RankingApi {
  Future<Map<dynamic, dynamic>> getRanking(String userPrompt);
}
