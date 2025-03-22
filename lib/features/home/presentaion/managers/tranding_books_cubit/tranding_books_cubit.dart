import 'package:zzzbookly/features/home/data/repos/home_repo.dart';
import 'package:zzzbookly/features/home/presentaion/managers/tranding_books_cubit/tranding_books_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TrandingBooksCubit extends Cubit<TrandingBooksState> {
  TrandingBooksCubit(this.homeRepo) : super(TrandingBooksInitial());

  final HomeRepo homeRepo;
  Future<void> fetchTrandingBooks() async {
    emit(TrandingBooksLoading());
    var result = await homeRepo.fetchTrandingBooks();
    result.fold((failure) => emit(TrandingBooksFailure(failure.errMessage)),
        (books) => emit(TrandingBooksSuccess(books)));
  }
}
