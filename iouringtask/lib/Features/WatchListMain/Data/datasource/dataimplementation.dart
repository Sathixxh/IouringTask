import 'package:iouringtask/Features/WatchListMain/Data/datasource/datasource.dart';
import 'package:iouringtask/Features/WatchListMain/Data/model/watchlistmodel.dart';



class WatchListDataSourceimpl implements WatchListDatasource {
  @override
  Future<List<WatchListModel>> fetchdata() async {
    List<WatchListModel> watchListDetails = [
      WatchListModel(
          stockName: 'GOLD 26JUL 59500 CE',
          exchange: 'MCX',
          price: 298.50,
          change: 23.50,
          percentageChange: 8.54, navValue: 0),
      WatchListModel(
          stockName: 'ACCELYA',
          exchange: 'NSE',
          price: 1337.70,
          change: 1.05,
          percentageChange: 0.07, navValue: 0),
      WatchListModel(
          stockName: 'ACC',
          exchange: 'BSE',
          price: 1795.20,
          change: 27.20,
          percentageChange: 1.53, navValue: 400),
      WatchListModel(
          stockName: 'ACC',
          exchange: 'NSE',
          price: 1792.30,
          change: 25.40,
          percentageChange: 1.43, navValue: 400),
    ];
    return await Future.delayed(
        const Duration(seconds: 1), () => watchListDetails);
  }
}
