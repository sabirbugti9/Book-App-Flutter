import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:zzzbookly/features/home/data/models/book_model/book_model.dart';

import '../../../../../core/utils/app_router.dart';

class BookCoverCard extends StatelessWidget {
  const BookCoverCard({
    super.key, required this.bookModel,
  });

  final BookModel bookModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push(AppRouter.kBookDetailsView, extra: bookModel);
      },
      child: SizedBox(
        height: 250,
        child: AspectRatio(
          aspectRatio: 1 / 1.5,
          child: ClipRRect(
              borderRadius: const BorderRadius.all(
                Radius.circular(16),
              ),
              child: CachedNetworkImage(
                imageUrl: bookModel.volumeInfo!.imageLinks!.thumbnail ?? "",
                fit: BoxFit.cover,
                errorWidget: (context, url, error) =>
                    const Icon(Icons.error_outline, size: 40),
              )),
        ),
      ),
    );
  }
}
