import 'package:zzzbookly/features/home/data/repos/home_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zzzbookly/features/home/presentaion/managers/search_books_cubit/search_books_state.dart';

class SearchBooksCubit extends Cubit<SearchBooksState> {
  SearchBooksCubit(this.homeRepo) : super(SearchBooksInitial());

  final HomeRepo homeRepo;
  String? currentQuery;

  void reset() {
    currentQuery = null;
    emit(SearchBooksInitial());
  }

  Future<void> searchForBooks(String query) async {
    currentQuery = query;
    if (query.trim().isEmpty) {
      emit(SearchBooksInitial());
      return;
    }
    emit(SearchBooksLoading());
    final result = await homeRepo.searchForBooks(query);
    result.fold(
          (failure) => emit(SearchBooksFailure(failure.errMessage)),
          (books) => emit(SearchBooksSuccess(books)),
    );
  }
}