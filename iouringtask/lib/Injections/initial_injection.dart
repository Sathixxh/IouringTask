import 'package:get_it/get_it.dart';
import 'package:iouringtask/Features/WatchListMain/Data/datasource/dataimplementation.dart';
import 'package:iouringtask/Features/WatchListMain/Data/datasource/datasource.dart';
import 'package:iouringtask/Features/WatchListMain/Data/repository/implwatchlistrepo.dart';
import 'package:iouringtask/Features/WatchListMain/Domain/Repository/watchlistRepo.dart';
import 'package:iouringtask/Features/WatchListMain/Domain/UseCase/watchlistusecase.dart';
import 'package:iouringtask/Features/WatchListMain/Presentation/bloc/bloc_cubit.dart';
import 'package:iouringtask/Features/WatchListMain/Presentation/bloc/bottomnavigationcubit.dart';


class ServiceLocator {
  static final GetIt serviceLocator = GetIt.instance;
  static Future<void> init() async {
    serviceLocator.registerLazySingleton<WatchListDatasource>(
      () => WatchListDataSourceimpl(),
    );
    serviceLocator.registerLazySingleton<WatchListrepos>(
      () => WatchListRepImpl(watchListDatasource: serviceLocator.call()),
    );
    serviceLocator.registerLazySingleton<WatchListUseCase>(
      () => WatchListUseCase(watchlistrep: serviceLocator.call()),
    );
    serviceLocator.registerFactory<WatchListBloc>(
      () => WatchListBloc(watchListUseCase: serviceLocator.call()),
    );
    serviceLocator.registerFactory<BottomNavigationCubit>(
      () => BottomNavigationCubit(),
    );
  }
}