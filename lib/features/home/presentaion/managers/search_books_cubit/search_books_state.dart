import 'package:equatable/equatable.dart';
import 'package:zzzbookly/features/home/data/models/book_model/book_model.dart';

sealed class SearchBooksState extends Equatable {
  const SearchBooksState();

  @override
  List<Object> get props => [];
}

final class SearchBooksInitial extends SearchBooksState {}

final class SearchBooksLoading extends SearchBooksState {}

final class SearchBooksSuccess extends SearchBooksState {
  final List<BookModel> searchBooks;
  const SearchBooksSuccess(this.searchBooks);
}

final class SearchBooksFailure extends SearchBooksState {
  final String errMessage;
  const SearchBooksFailure(this.errMessage);
}
