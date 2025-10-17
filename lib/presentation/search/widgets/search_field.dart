part of '../search_page.dart';

class _SearchField extends ConsumerStatefulWidget {
  const _SearchField();

  @override
  ConsumerState<_SearchField> createState() => _SearchFieldState();
}

class _SearchFieldState extends ConsumerState<_SearchField> {
  Timer? _debounce;

  @override
  Widget build(BuildContext context) {
    final theme = ref.watchTheme;

    return TextField(
      onChanged: (value) {
        if (value.isEmpty) {
          ref.read(searchQueryProvider.notifier).state = value;
        }

        if (_debounce?.isActive ?? false) _debounce!.cancel();

        _debounce = Timer(const Duration(milliseconds: 1500), () {
          ref.read(searchQueryProvider.notifier).state = value;
        });
      },
      onTapOutside: (_) => FocusScope.of(context).unfocus(),
      style: theme.text2.copyWith(fontWeight: FontWeight.bold),
      decoration: InputDecoration(
        prefixIcon: FavVectorImage(
          assetName: AppAssets.search,
          colorFilter: ColorFilter.mode(theme.textColor, BlendMode.srcIn),
          fit: BoxFit.scaleDown,
        ),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        filled: true,
        hintText: 'Search',
        hintStyle: theme.text2.copyWith(
          color: theme.textColor.withValues(alpha: 0.20),
        ),
        fillColor: theme.searchColor,
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(Dimensions.radius10),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _debounce?.cancel();
    super.dispose();
  }
}
