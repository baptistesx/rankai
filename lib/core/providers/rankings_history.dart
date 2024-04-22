import 'dart:convert';

import 'package:rankai/core/providers/models/ranking.dart';
import 'package:rankai/core/providers/shared_preferences.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'rankings_history.g.dart';

@Riverpod(keepAlive: true)
class RankingsHistory extends _$RankingsHistory {
  void addRanking(Ranking ranking) async {
    final List<Ranking> newState =
        List<Ranking>.from(state.value ?? <Ranking>[]);

    newState.add(ranking);

    // Convertir la liste des rankings en JSON avant de l'enregistrer
    final String rankingsHistoryJson = json
        .encode(newState.map((Ranking ranking) => ranking.toJson()).toList());

    await ref
        .read(sharedPreferencesProvider)
        .setString('rankingsHistory', rankingsHistoryJson);

    state = AsyncData<List<Ranking>>(newState);
  }

  @override
  Future<List<Ranking>> build() async {
    try {
      state = const AsyncLoading<List<Ranking>>();

      final String? rankingsHistoryString =
          ref.read(sharedPreferencesProvider).getString('rankingsHistory');

      if (rankingsHistoryString == null) {
        return <Ranking>[];
      }

      // Décoder la chaîne JSON en liste d'objets Ranking
      return (json.decode(rankingsHistoryString) as List)
          .map((e) => Ranking.fromJson(e as Map<String, dynamic>))
          .toList();
    } catch (e) {
      rethrow;
    }
  }
}
