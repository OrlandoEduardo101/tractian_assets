import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomSearchField extends StatelessWidget {
  final String? hintText;
  final void Function(String)? onChanged;

  const CustomSearchField({super.key, this.hintText, this.onChanged});
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    return TextFormField(
      onChanged: onChanged,
      decoration: InputDecoration(
        filled: true,
        fillColor: colorScheme.secondaryFixed,
        prefixIcon: Icon(CupertinoIcons.search, color: colorScheme.onSecondaryFixed),
        hintText: hintText,
        hintStyle: TextStyle(color: colorScheme.onSecondaryFixed),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
