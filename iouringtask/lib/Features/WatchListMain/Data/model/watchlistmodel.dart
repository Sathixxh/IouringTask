class WatchListModel {
  final String symbol;
  final String exchange;
  final double price;
  final double change;
  final double percentageChange;
    final double navValue;

  WatchListModel({
    required this.symbol,
    required this.exchange,
    required this.price,
    required this.change,
    required this.percentageChange,
        required this.navValue,
  });
}