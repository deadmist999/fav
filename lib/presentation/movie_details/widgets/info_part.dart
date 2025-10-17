part of '../movie_details_page.dart';

class _InfoPart extends ConsumerWidget {
  const _InfoPart({required this.overview, required this.releaseDate});

  final String overview;
  final DateTime releaseDate;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watchTheme;
    return Column(
      spacing: Dimensions.margin16,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(overview, style: theme.text4),
        Text(releaseDate.dateToString(), style: theme.text4),
      ],
    );
  }
}
