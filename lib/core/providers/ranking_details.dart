import 'package:rankai/core/data/repositories/ranking_repository.dart';
import 'package:rankai/core/providers/models/ranking.dart';
import 'package:rankai/core/providers/rankings_history.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'ranking_details.g.dart';

@Riverpod(keepAlive: true)
class RankingDetails extends _$RankingDetails {
  @override
  Future<Ranking> build({required String userPrompt}) async {
    try {
      state = const AsyncLoading<Ranking>();

      final Ranking ranking = await ref
          .read(rankingRepositoryProvider)
          .getRanking(userPrompt: userPrompt);

      ref.read(rankingsHistoryProvider.notifier).addRanking(ranking);

      return ranking;
    } catch (e) {
      rethrow;
    }
  }
}
