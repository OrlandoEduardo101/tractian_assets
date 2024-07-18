import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../interactor/models/assets_model.dart';

class AssetsModelWidget extends StatelessWidget {
  final AssetsModel item;
  final bool isExpanded;
  final bool isComponent;
  final void Function()? onTap;

  const AssetsModelWidget({
    super.key,
    required this.item,
    required this.isExpanded,
    required this.isComponent,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;
    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
          if (!isComponent)
            Icon(
              isExpanded ? CupertinoIcons.chevron_down : CupertinoIcons.chevron_right,
            ),
          Padding(
            padding: const EdgeInsets.all(2.0),
            child: Icon(
              isComponent ? CupertinoIcons.cube_box : CupertinoIcons.cube,
              color: colorScheme.primary,
            ),
          ),
          Flexible(
            child: Text(
              item.name,
              style: textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w500),
            ),
          ),
          if (item.status.contains('operating'))
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(
                CupertinoIcons.bolt_fill,
                color: Colors.green,
                size: 18,
              ),
            ),
          if (item.status.contains('alert'))
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(
                CupertinoIcons.circle_fill,
                size: 12,
                color: colorScheme.error,
              ),
            ),
        ],
      ),
    );
  }
}
