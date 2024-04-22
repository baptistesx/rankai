import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:rankai/core/providers/models/ranking.dart';
import 'package:rankai/core/providers/ranking_details.dart';
import 'package:rankai/generated/l10n.dart';
import 'package:rankai/modules/results/ui/widgets/ranking_body.dart';

class ResultsPage extends ConsumerWidget {
  final String? userPrompt;
  final String? rankingId;

  const ResultsPage({super.key, required this.userPrompt, this.rankingId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<Ranking> res = ref.watch(
      rankingDetailsProvider(userPrompt: userPrompt, id: rankingId),
    );

    return Scaffold(
      body: SafeArea(
        child: res.when(
          data: (Ranking ranking) => RankingBody(ranking: ranking),
          error: (Object error, StackTrace stackTrace) =>
              Center(child: Text(S.of(context).resultsPageError)),
          loading: () => const Center(child: CircularProgressIndicator()),
        ),
      ),
    );
  }
}
