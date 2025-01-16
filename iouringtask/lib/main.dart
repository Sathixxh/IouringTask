import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iouringtask/Features/WatchListMain/Presentation/bloc/bloc_cubit.dart';
import 'package:iouringtask/Features/WatchListMain/Presentation/bloc/bottomnavigationcubit.dart';
import 'package:iouringtask/Features/WatchListMain/Presentation/screens/Dashboard/homescreen.dart';
import 'package:iouringtask/Injections/initial_injection.dart';
import 'package:iouringtask/core/Themes/apptheme.dart';

void main() async {
  await ServiceLocator.init();

  runApp(MultiBlocProvider(providers: [
    BlocProvider<WatchListBloc>(
        create: (_) => ServiceLocator.serviceLocator<WatchListBloc>()),
    BlocProvider<BottomNavigationCubit>(
      create: (context) =>
          ServiceLocator.serviceLocator<BottomNavigationCubit>(),
    )
  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Watchlist',
      theme: AppTheme.Darkmode(context),
      home: HomeScreen(),
    );
  }
}