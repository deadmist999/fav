import 'package:fav/core/theme/theme.dart';
import 'package:fav/core/ui_kit/ui_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FavMainButton extends ConsumerWidget {
  const FavMainButton({
    required this.text,
    this.onPressed,
    this.backgroundColor,
    this.foregroundColor,
    this.borderColor,
    super.key,
  });

  final String text;
  final VoidCallback? onPressed;
  final Color? foregroundColor;
  final Color? backgroundColor;
  final Color? borderColor;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final borderColor = this.borderColor;
    final theme = ref.watchTheme;

    return TextButton(
      onPressed: onPressed,

      style: ButtonStyle(
        minimumSize: const WidgetStatePropertyAll(
          Size(double.infinity, Dimensions.size48),
        ),
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadiusGeometry.circular(Dimensions.radius30),
            side: borderColor != null
                ? BorderSide(color: borderColor)
                : BorderSide.none,
          ),
        ),
        backgroundColor: WidgetStatePropertyAll(backgroundColor),
      ),
      child: Text(
        text,
        style: theme.buttonText.copyWith(color: foregroundColor),
      ),
    );
  }
}
