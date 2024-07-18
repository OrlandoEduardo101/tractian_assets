import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../interactor/models/location_model.dart';

class LocationModelWidget extends StatelessWidget {
  final LocationModel item;
  final bool isExpanded;
  final bool showChevron;
  final void Function()? onTap;

  const LocationModelWidget({
    super.key,
    required this.item,
    required this.isExpanded,
    required this.showChevron,
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
          if (showChevron)
            Icon(
              isExpanded ? CupertinoIcons.chevron_down : CupertinoIcons.chevron_right,
            ),
          Padding(
            padding: const EdgeInsets.all(2.0),
            child: Icon(
              CupertinoIcons.placemark,
              color: colorScheme.primary,
            ),
          ),
          Flexible(
            child: Text(
              item.name,
              style: textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w500),
            ),
          ),
        ],
      ),
    );
  }
}
