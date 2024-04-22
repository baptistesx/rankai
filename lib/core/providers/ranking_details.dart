import 'package:rankai/core/data/repositories/ranking_repository.dart';
import 'package:rankai/core/providers/models/ranking.dart';
import 'package:rankai/core/providers/rankings_history.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'ranking_details.g.dart';

@Riverpod(keepAlive: true)
class RankingDetails extends _$RankingDetails {
  @override
  Future<Ranking> build({String? userPrompt, String? id}) async {
    try {
      if (id != null) {
        // Retrieve the list of rankings from the rankingsHistoryProvider
        final AsyncValue<List<Ranking>> rankingsHistory =
            ref.read(rankingsHistoryProvider);

        // Find the ranking with the matching ID
        final Ranking selectedRanking =
            (rankingsHistory.value as List<Ranking>).firstWhere(
          (Ranking ranking) => ranking.id == id,
        );

        return selectedRanking;
      } else {
        state = const AsyncLoading<Ranking>();

        final Ranking ranking = await ref
            .read(rankingRepositoryProvider)
            .getRanking(userPrompt: userPrompt!);

        ref.read(rankingsHistoryProvider.notifier).addRanking(ranking);

        return ranking;
      }
    } catch (e) {
      rethrow;
    }
  }

  void selectRankingFromHistory(String id) {
    // Retrieve the list of rankings from the rankingsHistoryProvider
    final AsyncValue<List<Ranking>> rankingsHistory =
        ref.read(rankingsHistoryProvider);

    if (rankingsHistory.value != null) {
      // Find the ranking with the matching ID
      final Ranking selectedRanking =
          (rankingsHistory.value as List<Ranking>).firstWhere(
        (Ranking ranking) => ranking.id == id,
      );

      // Check if a ranking was found and update the state
      state = AsyncData<Ranking>(selectedRanking);
    }
  }
}
