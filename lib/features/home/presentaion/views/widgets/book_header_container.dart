
import 'package:flutter/material.dart';
import 'package:zzzbookly/features/home/data/models/book_model/book_model.dart';
import 'package:zzzbookly/features/home/presentaion/views/widgets/book_cover_card.dart';
import 'package:zzzbookly/features/home/presentaion/views/widgets/book_details_widgets.dart';
import 'package:zzzbookly/features/home/presentaion/views/widgets/book_rate.dart';

class BookHeaderContainer extends StatelessWidget {
  const BookHeaderContainer({
    super.key, required this.bookModel,
  });

  final BookModel bookModel;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none, // Allows overflow for the elevated card
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          width: MediaQuery.of(context).size.width,
          height: 180,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Theme.of(context).colorScheme.tertiary,
          ),
        ),
        Positioned(
          left: 30,
          top: -34,
          bottom: 20,
          child: Container(
            height: 250,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
            ),
            child:  BookCoverCard(bookModel: bookModel,),
          ),
        ),
        Positioned(
          top: 50,
          left: 180,
          right: 24,
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.5,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                 BookName(bookName: bookModel.volumeInfo!.title ?? "Unknown"),
                 const SizedBox(height: 4),
                 AuthorName(authorName: bookModel.volumeInfo!.authors?[0] ?? "Unknown",),
                 const SizedBox(height: 8),
                 ReleaseDate(releaseDate: bookModel.volumeInfo!.publishedDate ?? "Unknown",),
                BookRate(
                  textStyle: Theme.of(context).textTheme.displayMedium,
                  iconSize: 20,
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}