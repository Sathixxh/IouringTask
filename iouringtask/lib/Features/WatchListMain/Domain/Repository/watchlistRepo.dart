import 'package:iouringtask/Features/WatchListMain/Data/model/watchlistmodel.dart';

abstract interface class WatchListrep {
  Future<List<WatchListModel>> watchListRep();
}