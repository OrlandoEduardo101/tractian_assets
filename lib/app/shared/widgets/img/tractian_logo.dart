import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class TractianLogo extends StatelessWidget {
  const TractianLogo({super.key, this.colorFilter, this.width, this.height});
  final Color? colorFilter;
  final double? width;
  final double? height;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    const String assetLogo = 'assets/svg/tractian-1.svg';
    return SvgPicture.asset(
      assetLogo,
      width: width,
      height: height,
      semanticsLabel: 'Tractian Logo',
      colorFilter: ColorFilter.mode(
        colorFilter ?? colorScheme.onPrimary,
        BlendMode.srcIn,
      ),
    );
  }
}
