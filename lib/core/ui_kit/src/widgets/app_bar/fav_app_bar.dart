import 'package:fav/core/theme/theme.dart';
import 'package:fav/core/ui_kit/ui_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class FavAppBar extends ConsumerWidget implements PreferredSizeWidget {
  const FavAppBar({
    this.pageName,
    this.backgroundColor,
    this.actions,
    super.key,
  });

  final String? pageName;
  final Color? backgroundColor;
  final List<Widget>? actions;

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pageName = this.pageName;
    final actions = this.actions;
    final theme = ref.readTheme;
    final isFirstRoute = ModalRoute.of(context)?.isFirst ?? true;

    return AppBar(
      backgroundColor: backgroundColor,
      foregroundColor: theme.textColor,
      title: pageName == null
          ? null
          : Padding(
              padding: const EdgeInsets.only(left: Dimensions.margin16),
              child: Text(pageName, style: theme.text1),
            ),
      centerTitle: false,
      elevation: 0,
      titleSpacing: 0,
      leading: !isFirstRoute ? AppBarBackButton(onTap: context.pop) : null,
      automaticallyImplyLeading: false,
      actions: actions,
    );
  }
}
