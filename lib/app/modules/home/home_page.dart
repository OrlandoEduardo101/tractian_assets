import 'package:asp/asp.dart';
import 'package:flutter/material.dart';
import 'package:tractian_assets/app/modules/home/interactor/actions/home_actions.dart';

import '../../shared/widgets/img/custom_companies_icon.dart';
import '../../shared/widgets/img/tractian_logo.dart';
import 'interactor/atoms/home_atom.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    getCompaniesListAction();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;
    final size = MediaQuery.of(context).size;

    context.select(() => [
          companiesListState,
          isLoadingState,
          errorMessage,
        ]);

    return Scaffold(
      appBar: AppBar(
        // backgroundColor: colorScheme.primary,
        title: TractianLogo(
          width: size.width * 0.35,
          colorFilter: colorScheme.primary,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 22.0, vertical: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            if (isLoadingState.value)
              const Center(
                child: CircularProgressIndicator.adaptive(),
              )
            else if (errorMessage.value.isNotEmpty)
              Center(
                child: Text(errorMessage.value),
              )
            else if (companiesListState.value.isEmpty)
              const Center(
                child: Text('Companies not found'),
              )
            else
              Expanded(
                child: ListView.separated(
                  itemCount: companiesListState.value.length,
                  separatorBuilder: (context, index) => const SizedBox(
                    height: 16,
                  ),
                  itemBuilder: (context, index) {
                    final item = companiesListState.value[index];
                    return InkWell(
                      child: Container(
                        // alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: colorScheme.primary,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 32),
                        child: Row(
                          children: [
                            CustomCompaniesIcon(color: colorScheme.onPrimary),
                            const SizedBox(width: 16),
                            Text(
                              item.name,
                              style: textTheme.headlineMedium
                                  ?.copyWith(color: colorScheme.onPrimary, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
          ],
        ),
      ),
    );
  }
}
