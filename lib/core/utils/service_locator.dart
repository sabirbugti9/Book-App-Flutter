import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:zzzbookly/core/utils/api_service.dart';
import 'package:zzzbookly/features/home/data/repos/home_repo_impl.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton<APIService>(APIService(Dio()));
  getIt.registerSingleton<HomeRepoImpl>(HomeRepoImpl(
    getIt.get<APIService>(),
  ));
}
