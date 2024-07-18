import 'package:asp/asp.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tractian_assets/app/modules/assets_module/interactor/models/node_entity.dart';
import 'package:tractian_assets/app/shared/widgets/text_input/custom_search_field.dart';

import '../../../shared/widgets/buttons/Selectable_buttons.dart';
import '../../../shared/widgets/buttons/custom_toggle_button.dart';
import '../interactor/actions/assets_actions.dart';
import '../interactor/atoms/assets_atoms.dart';
import 'widgets/expansible_list_tile.dart';

class AssetsPage extends StatefulWidget {
  const AssetsPage({super.key, required this.companyId});
  final String companyId;

  @override
  State<AssetsPage> createState() => _AssetsPageState();
}

class _AssetsPageState extends State<AssetsPage> {
  @override
  void initState() {
    super.initState();
    getAssetsListAction(widget.companyId).whenComplete(() {
      getLocationListAction(widget.companyId).whenComplete(() {
        computeListAction();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    context.select(() => [
          assetsListState,
          locationsListState,
          nodesComputedListState,
          nodesComputedListStateFiltered,
          isLoadingState,
          errorMessage,
        ]);
    final List<NodeEntity> listNodes = nodesComputedListStateFiltered.value;
    final listNodesNoParents = listNodes
        .where(
          (value) =>
              value.parentId == null ||
              !listNodes.any((element) => value.parentId == element.id || value.locationId == element.id),
        )
        .toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Assets',
          style: textTheme.headlineMedium?.copyWith(color: colorScheme.primary, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 22.0, vertical: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CustomSearchField(
              hintText: 'Buscar Ativo ou Local',
              onChanged: (value) {
                filterListFromText(value);
              },
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              child: SelectableButtons(
                onUnselectAll: computeListAction,
                children: [
                  CustomToggleButton(
                    icon: CupertinoIcons.bolt,
                    text: 'Sensor de Energia',
                    onPressed: filterListFromEnergySensors,
                  ),
                  CustomToggleButton(
                    icon: Icons.error_outline,
                    text: 'Crítico',
                    onPressed: filterListFromCriticalAlert,
                  ),
                ],
              ),
            ),
            if (isLoadingState.value)
              const Center(
                child: CircularProgressIndicator.adaptive(),
              )
            else if (errorMessage.value.isNotEmpty)
              Center(
                child: Text(errorMessage.value),
              )
            else if (listNodes.isEmpty)
              const Center(
                child: Text('Assets not found'),
              )
            else
              Expanded(
                child: ListView.separated(
                  shrinkWrap: true,
                  itemCount: listNodesNoParents.length,
                  separatorBuilder: (context, index) => const SizedBox(
                    height: 8,
                  ),
                  itemBuilder: (context, index) {
                    final item = listNodesNoParents[index];
                    return ExpansibleListTile(
                      item: item,
                      listNodes: nodesComputedListState.value,
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
