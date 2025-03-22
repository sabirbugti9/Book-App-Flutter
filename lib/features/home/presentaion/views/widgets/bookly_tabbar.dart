import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:zzzbookly/features/home/data/models/book_model/book_model.dart';
import 'package:zzzbookly/features/home/presentaion/views/widgets/book_cover_card_list.dart';

class BooklyTabBarView extends StatelessWidget {
  const BooklyTabBarView({
    super.key,
    required TabController tabController, required this.bookModel,
  }) : _tabController = tabController;

  final TabController _tabController;
  final BookModel bookModel;

  @override
  Widget build(BuildContext context) {
    return TabBarView(
      controller: _tabController,
      children: [
        SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "About Book",
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 16),
              Text(bookModel.volumeInfo!.description ??
                  "No description available" ,
                  style: Theme.of(context).textTheme.bodyLarge),
              const SizedBox(height: 16),
              Divider(
                  color: Theme.of(context).colorScheme.tertiary,
                  thickness: 1.5,
                  height: 40),
              Text(
                "You may also like",
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 16),
              const BookCoverList(
                height: 200,
              ),
            ],
          ),
        ),
        SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              Text(
                "Book Details",
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 16),
              Text("Title: ${bookModel.volumeInfo!.title}", style: Theme.of(context).textTheme.bodyLarge),
              Text("Authors: ${bookModel.volumeInfo!.authors?.join(", ") ?? "Unknown"}", style: Theme.of(context).textTheme.bodyLarge),
              Text("Publisher: ${bookModel.volumeInfo!.publisher ?? "Unknown"}", style: Theme.of(context).textTheme.bodyLarge),
              Text("Published Date: ${bookModel.volumeInfo!.publishedDate ?? "Unknown"}", style: Theme.of(context).textTheme.bodyLarge),
              Text("Page Count: ${bookModel.volumeInfo!.pageCount ?? "Unknown"}", style: Theme.of(context).textTheme.bodyLarge),
              Text("Categories: ${bookModel.volumeInfo!.categories?.join(", ") ?? "Unknown"}", style: Theme.of(context).textTheme.bodyLarge),
              Text("Language: ${bookModel.volumeInfo!.language ?? "Unknown"}", style: Theme.of(context).textTheme.bodyLarge),
              Text("Maturity Rating: ${bookModel.volumeInfo!.maturityRating ?? "Unknown"}", style: Theme.of(context).textTheme.bodyLarge),
              Text("Content Version: ${bookModel.volumeInfo!.contentVersion ?? "Unknown"}", style: Theme.of(context).textTheme.bodyLarge),
              Text("Print Type: ${bookModel.volumeInfo!.printType ?? "Unknown"}", style: Theme.of(context).textTheme.bodyLarge),
              SizedBox(
                width: double.infinity,
                child: InkWell(
                  child: Text("<<<<<<<<<<Info Link>>>>>>>>>>", textAlign: TextAlign.center, style: Theme.of(context).textTheme.bodyLarge),
                  onTap: () {
                    launchUrlString(bookModel.volumeInfo!.infoLink!);
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class TabBarDelegate extends SliverPersistentHeaderDelegate {
  final TabBar tabBar;

  TabBarDelegate(this.tabBar);

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: tabBar,
    );
  }

  @override
  double get maxExtent => tabBar.preferredSize.height;

  @override
  double get minExtent => tabBar.preferredSize.height;

  @override
  bool shouldRebuild(TabBarDelegate oldDelegate) => false;
}
