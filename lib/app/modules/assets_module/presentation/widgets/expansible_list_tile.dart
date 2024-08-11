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
    final itemChilds = widget.item.children;
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
            padding: const EdgeInsets.fromLTRB(32, 8, 0, 8),
            decoration: BoxDecoration(
              border: !isExpanded
                  ? null
                  : Border(
                      left: BorderSide(
                      color: colorScheme.secondaryFixed,
                    )),
            ),
            child: Column(
              children: [
                ...itemChilds.map((child) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4.0),
                      child: ExpansibleListTile(
                        item: child,
                        listNodes: widget.listNodes,
                      ),
                    )),
              ],
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
