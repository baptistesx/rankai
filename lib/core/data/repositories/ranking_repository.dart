import 'package:rankai/core/data/api/ranking_api.dart';
import 'package:rankai/core/providers/models/ranking.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'ranking_repository.g.dart';

@Riverpod(keepAlive: true)
RankingRepository rankingRepository(RankingRepositoryRef ref) {
  return HttpRankingRepository(
    rankingApi: ref.watch(rankingApiProvider),
  );
}

class HttpRankingRepository implements RankingRepository {
  final RankingApi _rankingApi;

  HttpRankingRepository({
    required RankingApi rankingApi,
  }) : _rankingApi = rankingApi;

  @override
  Future<Ranking> getRanking({
    required String userPrompt,
  }) async {
    try {
      final Map<dynamic, dynamic> res =
          await _rankingApi.getRanking(userPrompt);

      return Ranking.fromJson(res as Map<String, dynamic>);
    } catch (e) {
      rethrow;
    }
  }
}

abstract class RankingRepository {
  Future<Ranking> getRanking({required String userPrompt});
}
