import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zzzbookly/core/utils/app_router.dart';
import 'package:zzzbookly/core/utils/service_locator.dart';
import 'package:zzzbookly/core/utils/theme.dart';
import 'package:zzzbookly/features/home/data/repos/home_repo_impl.dart';
import 'package:zzzbookly/features/home/presentaion/managers/featured_books_cubit/featured_books_cubit.dart';
import 'package:zzzbookly/features/home/presentaion/managers/tranding_books_cubit/tranding_books_cubit.dart';

import 'features/home/presentaion/managers/search_books_cubit/search_books_cubit.dart';

void main() {
  setupServiceLocator();
  runApp(const BooklyApp());
}

class BooklyApp extends StatelessWidget {
  const BooklyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => FeaturedBooksCubit(getIt.get<HomeRepoImpl>())
            ..fetchFeaturedBooks(),
        ),
        BlocProvider(
          create: (context) => TrandingBooksCubit(getIt.get<HomeRepoImpl>())
            ..fetchTrandingBooks(),
        ),
        BlocProvider(
          create: (context) => SearchBooksCubit(getIt.get<HomeRepoImpl>()),
        ),
      ],
      child: MaterialApp.router(
        routerConfig: AppRouter.router,
        debugShowCheckedModeBanner: false,
        theme: lightTheme,
      ),
    );
  }
}
