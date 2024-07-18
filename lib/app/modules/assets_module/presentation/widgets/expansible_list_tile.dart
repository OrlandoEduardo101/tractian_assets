import 'package:flutter/material.dart';

import '../../interactor/models/assets_model.dart';
import '../../interactor/models/location_model.dart';
import '../../interactor/models/node_entity.dart';
import 'asset_tile.dart';
import 'location_tile.dart';

class ExpansibleListTile extends StatefulWidget {
  const ExpansibleListTile({super.key, required this.item, required this.listNodes});
  final NodeEntity item;
  final List<NodeEntity> listNodes;

  @override
  State<ExpansibleListTile> createState() => _ExpansibleListTileState();
}

class _ExpansibleListTileState extends State<ExpansibleListTile> {
  bool isExpanded = false;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final itemChilds =
        widget.listNodes.where((e) => e.parentId == widget.item.id || e.locationId == widget.item.id).toList();
    return Column(
      children: [
        if (widget.item is LocationModel)
          LocationModelWidget(
            item: widget.item as LocationModel,
            isExpanded: isExpanded,
            showChevron: itemChilds.isNotEmpty,
            onTap: itemChilds.isEmpty ? null : changeExpanded,
          )
        else if (widget.item is AssetsModel)
          AssetsModelWidget(
            item: widget.item as AssetsModel,
            isExpanded: isExpanded,
            isComponent: itemChilds.isEmpty || (widget.item as AssetsModel).sensorType.isNotEmpty,
            onTap: itemChilds.isEmpty ? null : changeExpanded,
          ),
        if (isExpanded)
          Container(
            margin: const EdgeInsets.only(left: 12),
            decoration: BoxDecoration(
              border: !isExpanded
                  ? null
                  : Border(
                      left: BorderSide(
                      color: colorScheme.secondaryFixed,
                    )),
            ),
            child: ListView.separated(
              padding: const EdgeInsets.fromLTRB(32, 8, 0, 8),
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: itemChilds.length,
              separatorBuilder: (context, index) => const SizedBox(
                height: 8,
              ),
              itemBuilder: (context, index) {
                final item = itemChilds[index];
                return ExpansibleListTile(
                  item: item,
                  listNodes: widget.listNodes.toList(),
                );
              },
            ),
          ),
      ],
    );
  }

  changeExpanded() {
    setState(() {
      isExpanded = !isExpanded;
    });
  }
}
