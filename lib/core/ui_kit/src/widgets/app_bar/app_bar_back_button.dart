import 'package:fav/core/theme/theme.dart';
import 'package:fav/core/ui_kit/src/widgets/fav_vector_image.dart';
import 'package:fav/core/ui_kit/ui_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AppBarBackButton extends ConsumerWidget {
  const AppBarBackButton({required this.onTap, super.key});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watchTheme;
    return Material(
      type: MaterialType.transparency,
      child: InkWell(
        borderRadius: BorderRadius.circular(Dimensions.radius30),
        splashColor: AppColors.amber.withValues(alpha: 0.30),
        highlightColor: Colors.transparent,
        splashFactory: InkRipple.splashFactory,
        onTap: onTap,
        child: FavVectorImage(
          assetName: AppAssets.left,
          height: Dimensions.size24,
          colorFilter: ColorFilter.mode(theme.textColor, BlendMode.srcIn),
          fit: BoxFit.scaleDown,
        ),
      ),
    );
  }
}
