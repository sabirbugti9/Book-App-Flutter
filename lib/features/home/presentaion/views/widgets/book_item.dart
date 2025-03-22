import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:zzzbookly/core/utils/app_router.dart';
import 'package:zzzbookly/features/home/data/models/book_model/book_model.dart';
import 'package:zzzbookly/features/home/presentaion/views/widgets/book_cover_card.dart';
import 'package:zzzbookly/features/home/presentaion/views/widgets/book_rate.dart';

class BookItem extends StatelessWidget {
  const BookItem({
    super.key, required this.bookModel,
  });
  final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push(AppRouter.kBookDetailsView, extra: bookModel);
      },
      child: Container(
        height: 150,
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.secondary,
            borderRadius: const BorderRadius.all(Radius.circular(16)),
            boxShadow: [
              const BoxShadow(
                color: Color.fromARGB(30, 0, 0, 0),
                blurRadius: 4,
                offset: Offset(0, 4),
              ),
            ]),
        child: Row(children: [
          BookCoverCard(bookModel: bookModel,),
          const SizedBox(
            width: 16,
          ),
          Expanded(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.5,
                    child: Text(
                      bookModel.volumeInfo!.title!,
                      style: Theme.of(context).textTheme.titleMedium,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(height: 4),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.5,
                    child: Text(
                      'By ${bookModel.volumeInfo!.authors?.join(", ")}',
                      style: Theme.of(context).textTheme.labelMedium,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(height: 4),
                  BookRate(
                    textStyle: Theme.of(context).textTheme.labelSmall,
                    iconSize: 16,
                  )
                ]),
          )
        ]),
      ),
    );
  }
}
