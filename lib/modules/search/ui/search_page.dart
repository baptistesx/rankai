import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_svg/svg.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:rankai/core/providers/models/ranking.dart';
import 'package:rankai/core/providers/ranking_details.dart';
import 'package:rankai/core/providers/rankings_history.dart';
import 'package:rankai/core/router/routes.dart';
import 'package:rankai/core/theme/extensions/text_extensions.dart';
import 'package:rankai/core/theme/rankai_palette.dart';
import 'package:rankai/core/widgets/app_sizes.dart';
import 'package:rankai/core/widgets/rankai_elevated_button.dart';
import 'package:rankai/generated/l10n.dart';
import 'package:rankai/modules/search/ui/widgets/rankings_history_section.dart';

class SearchPage extends ConsumerStatefulWidget {
  const SearchPage({super.key});

  @override
  ConsumerState<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends ConsumerState<SearchPage> {
  final GlobalKey<FormBuilderState> formKey = GlobalKey<FormBuilderState>();
  String userInput = '';

  @override
  Widget build(BuildContext context) {
    final AsyncValue<List<Ranking>> res = ref.watch(rankingsHistoryProvider);

    return Scaffold(
      backgroundColor: RankaiPalette.mainBlue,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 32, 16, 0),
          child: FormBuilder(
            key: formKey,
            onChanged: () {
              final String? formValue =
                  formKey.currentState?.fields['userPrompt']?.value;
              if (formValue != null && formValue != userInput) {
                setState(() {
                  userInput = formValue;
                });
              }
            },
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  SvgPicture.asset(
                    'assets/images/logo.svg',
                    colorFilter:
                        const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                  ),
                  sizedBoxH32,
                  Text(
                    S.of(context).searchPageCatchPhrase,
                    style:
                        RankaiTextStyles.heading3.copyWith(color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                  sizedBoxH32,
                  res.when(
                    data: (List<Ranking> data) =>
                        RankingsHistorySection(rankings: data),
                    error: (Object error, StackTrace trace) =>
                        Text(error.toString()),
                    loading: () => const CircularProgressIndicator(),
                  ),
                  sizedBoxH32,
                  FormBuilderTextField(
                    name: 'userPrompt',
                    decoration: InputDecoration(
                      hintText: S.of(context).searchPageFieldHint,
                      filled: true,
                      fillColor: Colors.white,
                    ),
                    keyboardType: TextInputType.text,
                    style: RankaiTextStyles.pSmallRegular.copyWith(
                      color: RankaiPalette.darkGrey,
                    ),
                    validator: FormBuilderValidators.compose(
                      <FormFieldValidator<String>>[
                        FormBuilderValidators.required(),
                      ],
                    ),
                  ),
                  sizedBoxH32,
                  RankaiElevatedButton.darkGrey(
                    title: S.of(context).searchPageGoButton,
                    onPressed: userInput.isEmpty
                        ? null
                        : () {
                            ref.read(
                              rankingDetailsProvider(userPrompt: userInput),
                            );
                            SearchingRoute(userPrompt: userInput).go(context);
                          },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
