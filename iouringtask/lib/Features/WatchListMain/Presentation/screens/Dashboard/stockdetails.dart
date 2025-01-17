import 'package:flutter/material.dart';
import '../../../../../core/Themes/stylecolors.dart';

class StockDetailScreen extends StatelessWidget {
  final dynamic stock;

  const StockDetailScreen({Key? key, required this.stock}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(stock.stockName),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildStockDetail("StockName", stock.stockName),
            _buildStockDetail("Exchange", stock.exchange),
            _buildStockDetail("Price", "\$${stock.price}"),
            _buildStockDetail("NAV Value", "\$${stock.navValue}"),
            _buildStockDetail("Change", "${stock.change} (${stock.percentageChange}%)"),
            const SizedBox(height: 16),
            _buildStockDetail("Available Margin", "\$1000", color: Colors.green),
            const SizedBox(height: 20),
            _buildBuySellButtons(context),
          ],
        ),
      ),
    );
  }

  Widget _buildStockDetail(String label, String value, {Color color = ColorPallete.dark_textcolor}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "$label: $value",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: color),
        ),
        const SizedBox(height: 8),
      ],
    );
  }

  Widget _buildBuySellButtons(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildButton("Buy", ColorPallete.dark_secondaryColor, () => _showDialog(context, "Buy")),
        _buildButton("Sell", ColorPallete.dark_sellColor, () => _showDialog(context, "Sell")),
      ],
    );
  }

  Widget _buildButton(String text, Color color, VoidCallback onPressed) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(text),
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 12),
        textStyle: const TextStyle(fontSize: 16),
      ),
    );
  }

  void _showDialog(BuildContext context, String action) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("$action Stock"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                decoration: const InputDecoration(labelText: "Quantity"),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 8),
              Text("Total: \$${stock.price * 10}"),
            ],
          ),
          actions: <Widget>[
            _buildDialogButton("Cancel", ColorPallete.dark_textcolor, () => Navigator.of(context).pop()),
            _buildDialogButton("Confirm", ColorPallete.dark_textcolor, () => Navigator.of(context).pop()),
          ],
        );
      },
    );
  }

  Widget _buildDialogButton(String text, Color color, VoidCallback onPressed) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(text, style: TextStyle(color: color)),
    );
  }
}
