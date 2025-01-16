

import 'package:iouringtask/Features/WatchListMain/Data/model/watchlistmodel.dart';
import 'package:iouringtask/Features/WatchListMain/Domain/Repository/watchlistRepo.dart';

class WatchListUseCase {
  final WatchListrep watchlistrep;

  WatchListUseCase({required this.watchlistrep});
  Future<List<WatchListModel>> getdata() async =>
      await watchlistrep.watchListRep();
}