import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zzzbookly/features/home/presentaion/managers/featured_books_cubit/featured_books_cubit.dart';
import 'package:zzzbookly/features/home/presentaion/managers/featured_books_cubit/featured_books_state.dart';
import 'package:zzzbookly/features/home/presentaion/views/widgets/book_item.dart';

class BookItemList extends StatelessWidget {
  const BookItemList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeaturedBooksCubit, FeaturedBooksState>(
      builder: (context, state) {
        if (state is FeaturedBooksSuccess) {
          return SliverList.builder(
            itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: BookItem(bookModel: state.books[index],
                )),
            itemCount: state.books.length,
          );
        } else if (state is FeaturedBooksFailure) {
          return SliverToBoxAdapter(
            child: Center(
              child: Text(state.errMessage,
                  style: Theme.of(context).textTheme.titleLarge),
            ),
          );
        } else if (state is FeaturedBooksLoading) {
          return const SliverToBoxAdapter(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
        return const SliverToBoxAdapter(
          child: Center(
            child: Text("Something went wrong"),
          ),
        );
      },
    );
  }
}
