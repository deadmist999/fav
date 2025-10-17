part of '../movie_details_page.dart';

class _ImagePart extends ConsumerWidget {
  const _ImagePart({required this.imagePath, required this.rating});

  final String imagePath;
  final int rating;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watchTheme;

    return Column(
      spacing: Dimensions.margin8,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(Dimensions.radius15),
          child: Image.network(
            imagePath,
            fit: BoxFit.cover,
            loadingBuilder: (context, child, loadingProgress) {
              return SizedBox(
                height: MediaQuery.sizeOf(context).height / 2.1,
                child: child,
              );
            },
          ),
        ),
        Text('Rating: $rating', style: theme.text5),
      ],
    );
  }
}
