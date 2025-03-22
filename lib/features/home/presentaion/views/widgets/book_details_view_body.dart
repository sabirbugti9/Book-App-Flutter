import 'package:flutter/material.dart';
import 'package:zzzbookly/features/home/data/models/book_model/book_model.dart';
import 'package:zzzbookly/features/home/presentaion/views/widgets/book_details_buttons.dart';
import 'package:zzzbookly/features/home/presentaion/views/widgets/bookly_app_bar.dart';
import 'package:zzzbookly/features/home/presentaion/views/widgets/bookly_tabbar.dart';

import 'book_header_container.dart';

class BookDetailsBody extends StatefulWidget {
  const BookDetailsBody({super.key, required this.bookModel});

  @override
  State<BookDetailsBody> createState() => _BookDetailsBodyState();
  final BookModel bookModel ;

}

class _BookDetailsBodyState extends State<BookDetailsBody>
    with TickerProviderStateMixin {

  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          NestedScrollView(
            headerSliverBuilder: (context, innerBoxIsScrolled) => [
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    const BooklyAppBar(
                      showBackArrow: true,
                      title: "",
                    ),
                    const SizedBox(height: 40),
                    BookHeaderContainer(bookModel: widget.bookModel,),
                  ],
                ),
              ),
              SliverPersistentHeader(
                pinned: true,
                delegate: TabBarDelegate(
                  TabBar(
                    controller: _tabController,
                    labelPadding: EdgeInsets.zero,
                    labelColor: Theme.of(context).colorScheme.primary,
                    unselectedLabelColor:
                        Theme.of(context).colorScheme.onSecondary,
                    indicatorColor: Theme.of(context).colorScheme.primary,
                    tabs: const [
                      Tab(text: 'Overview'),
                      Tab(text: 'Details'),
                    ],
                  ),
                ),
              ),
            ],
            body: BooklyTabBarView(
              tabController: _tabController,
              bookModel: widget.bookModel,
            ),
          ),
          Positioned(
            bottom: 16,
            left: 16,
            right: 16,
            child: BottomButtons(context: context, downloadLink: widget.bookModel.saleInfo!.buyLink ??
              widget.bookModel.accessInfo!.pdf!.acsTokenLink ??
              widget.bookModel.accessInfo!.epub!.acsTokenLink ?? '', previewLink: widget.bookModel.volumeInfo!.previewLink ??
                widget.bookModel.accessInfo!.webReaderLink ?? '',),
          ),
        ],
      ),
    );
  }
}
