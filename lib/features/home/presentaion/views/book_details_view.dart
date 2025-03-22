import 'package:flutter/material.dart';
import 'package:zzzbookly/features/home/data/models/book_model/book_model.dart';
import 'package:zzzbookly/features/home/presentaion/views/widgets/book_details_view_body.dart';

class BookDetails extends StatelessWidget {
  const BookDetails({super.key, required this.bookModel});

  final BookModel bookModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BookDetailsBody(bookModel: bookModel,),
      
    );
  }
}
