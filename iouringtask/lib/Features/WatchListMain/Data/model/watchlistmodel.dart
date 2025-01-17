class WatchListModel {
  final String stockName;
  final String exchange;
  final double price;
  final double change;
  final double percentageChange;
    final int navValue;

  WatchListModel({
    required this.stockName,
    required this.exchange,
    required this.price,
    required this.change,
    required this.percentageChange,
        required this.navValue,
  });
}
