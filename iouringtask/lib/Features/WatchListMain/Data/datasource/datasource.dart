
import 'package:iouringtask/Features/WatchListMain/Data/model/watchlistmodel.dart';

abstract interface class WatchListDatasource {
  Future<List<WatchListModel>> fetchdata();
}