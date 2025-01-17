import 'package:iouringtask/Features/WatchListMain/Data/model/watchlistmodel.dart';

abstract interface class WatchListrepos {
  Future<List<WatchListModel>> watchListdataRepos();
}