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

    await ref
        .read(sharedPreferencesProvider)
        .setString('rankingsHistory', json.encode(newState));

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

      return (json.decode(rankingsHistoryString) as List<dynamic>)
          .map((dynamic e) => Ranking.fromJson(e))
          .toList();
    } catch (e) {
      rethrow;
    }
  }
}
