class WatchListModel {
  final String stockName;
  final String exchange;
  final double price;
    final int navValue;
  final double change;
  final double percentageChange;

  WatchListModel({
    required this.stockName,
    required this.exchange,
    required this.price,
        required this.navValue,
    required this.change,
    required this.percentageChange,
  });
}
