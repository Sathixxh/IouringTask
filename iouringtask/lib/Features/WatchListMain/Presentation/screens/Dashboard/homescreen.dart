import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iouringtask/Features/WatchListMain/Presentation/bloc/bottomnavigationcubit.dart';
import 'package:iouringtask/Features/WatchListMain/Presentation/screens/bottomNaavigation.dart/watchlistscreen.dart';


class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  static List<Widget> Screens = <Widget>[
    WatchlistScreen(),
    const Center(child: Text('Orders Screen')),
    const Center(child: Text('Portfolio Screen')),
    const Center(child: Text('Movers Screen')),
    const Center(child: Text('More Screen')),
  ];

  @override
  Widget build(BuildContext context) {
    var index = context.watch<BottomNavigationCubit>().state;
    return Scaffold(
      body: Screens[index],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Watchlist',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag),
            label: 'Orders',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.pie_chart),
            label: 'Portfolio',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.trending_up),
            label: 'Movers',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.more_horiz),
            label: 'More',
          ),
        ],
        onTap: (value) {
          context.read<BottomNavigationCubit>().changeIndex(index: value);
        },
      ),
    );
  }
}