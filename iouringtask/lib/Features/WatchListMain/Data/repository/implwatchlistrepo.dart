
import 'package:iouringtask/Features/WatchListMain/Data/datasource/datasource.dart';
import 'package:iouringtask/Features/WatchListMain/Data/model/watchlistmodel.dart';
import 'package:iouringtask/Features/WatchListMain/Domain/Repository/watchlistRepo.dart';

class WatchListRepImpl implements WatchListrep {
  final WatchListDatasource watchListDatasource;
  WatchListRepImpl({required this.watchListDatasource});
  @override
  Future<List<WatchListModel>> watchListRep() async =>
      await watchListDatasource.fetchdata();
}