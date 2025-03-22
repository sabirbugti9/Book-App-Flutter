import 'package:equatable/equatable.dart';
import 'package:zzzbookly/features/home/data/models/book_model/book_model.dart';

sealed class TrandingBooksState extends Equatable {
  const TrandingBooksState();

  @override
  List<Object> get props => [];
}

final class TrandingBooksInitial extends TrandingBooksState {}

final class TrandingBooksLoading extends TrandingBooksState {}

final class TrandingBooksSuccess extends TrandingBooksState {
  final List<BookModel> books;
  const TrandingBooksSuccess(this.books);
}

final class TrandingBooksFailure extends TrandingBooksState {
  final String errMessage;
  const TrandingBooksFailure(this.errMessage);
}
