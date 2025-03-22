import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zzzbookly/features/home/presentaion/managers/tranding_books_cubit/tranding_books_cubit.dart';
import 'package:zzzbookly/features/home/presentaion/managers/tranding_books_cubit/tranding_books_state.dart';
import 'package:zzzbookly/features/home/presentaion/views/widgets/book_cover_card.dart';

class BookCoverList extends StatelessWidget {
  const BookCoverList({
    super.key,
    this.height = 250,
  });
  final double? height;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TrandingBooksCubit, TrandingBooksState>(
      builder: (context, state) {
        if (state is TrandingBooksSuccess) {
          return SizedBox(
            height: height,
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: state.books.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: BookCoverCard(
                    bookModel: state.books[index],
                  ),
                );
              },
            ),
          );
        } else if (state is TrandingBooksFailure) {
          return Center(
            child: Text(state.errMessage,
                style: Theme.of(context).textTheme.titleLarge),
          );
        } else if (state is TrandingBooksLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return const Center(
          child: Text("Something went wrong"),
        );
      },
    );
  }
}
