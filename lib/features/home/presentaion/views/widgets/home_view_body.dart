import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sliver_tools/sliver_tools.dart';
import 'package:zzzbookly/features/home/presentaion/managers/search_books_cubit/search_books_cubit.dart';
import 'package:zzzbookly/features/home/presentaion/managers/search_books_cubit/search_books_state.dart';
import 'package:zzzbookly/features/home/presentaion/views/widgets/book_cover_card_list.dart';
import 'package:zzzbookly/features/home/presentaion/views/widgets/book_item.dart';
import 'package:zzzbookly/features/home/presentaion/views/widgets/book_item_list.dart';
import 'package:zzzbookly/features/home/presentaion/views/widgets/bookly_app_bar.dart';
import 'package:zzzbookly/features/home/presentaion/views/widgets/bookly_search_bar.dart';
import 'package:zzzbookly/features/home/presentaion/views/widgets/widget_headline.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  late final SearchBooksCubit _searchCubit;

  @override
  void initState() {
    super.initState();
    _searchCubit = context.read<SearchBooksCubit>();
  }

  @override
  void dispose() {
    _searchCubit.reset();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBooksCubit, SearchBooksState>(
      builder: (context, state) {
        final isSearching = _searchCubit.currentQuery?.isNotEmpty ?? false;

        return RefreshIndicator(
          onRefresh: () async => _searchCubit.reset(),
          child: CustomScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            slivers: [
              const SliverToBoxAdapter(
                child: Column(
                  children: [
                    BooklyAppBar(
                      showBackArrow: false,
                    ),
                    BooklySearchBar(),
                  ],
                ),
              ),
              if (isSearching)
                _buildSearchResults(state)
              else
                _buildNormalContent(),
            ],
          ),
        );
      },
    );
  }

  Widget _buildSearchResults(SearchBooksState state) {
    if (state is SearchBooksSuccess) {
      return SliverList.builder(
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.all(8.0),
          child: BookItem(bookModel: state.searchBooks[index]),
        ),
        itemCount: state.searchBooks.length,
      );
    } else if (state is SearchBooksFailure) {
      return SliverToBoxAdapter(
        child: Center(child: Text(state.errMessage)),
      );
    } else if (state is SearchBooksLoading) {
      return const SliverToBoxAdapter(
        child: Center(child: CircularProgressIndicator()),
      );
    }
    return const SliverToBoxAdapter(child: SizedBox.shrink());
  }

  Widget _buildNormalContent() {
    return MultiSliver(
      children: [
        const SliverToBoxAdapter(
            child: WidgetHeadline(title: 'Trending books')),
        const BookCoverList(),
        const SliverToBoxAdapter(child: WidgetHeadline(title: 'My favourites')),
        const BookItemList(),
      ],
    );
  }
}
