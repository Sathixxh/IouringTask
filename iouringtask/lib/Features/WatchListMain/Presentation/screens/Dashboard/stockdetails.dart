
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
     
            Text(
              "StockName: ${stock.stockName}",
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text("Exchange: ${stock.exchange}"),
            const SizedBox(height: 8),
            Text("Price: \$${stock.price}"),
            const SizedBox(height: 8),
            Text("NAV Value: \$${stock.navValue}"),
            const SizedBox(height: 8),
            Text("Change: ${stock.change} (${stock.percentageChange}%)"),
            const SizedBox(height: 16),
            Text(
              "Available Margin: \$1000", 
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.green),
            ),
            const SizedBox(height: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Add your Buy functionality here
                    _showBuyDialog(context);
                  },
                  child: const Text("Buy"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: ColorPallete.dark_secondaryColor,
                    padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 12),
                    textStyle: const TextStyle(fontSize: 16),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                  
                    _showSellDialog(context);
                  },
                  child: const Text("Sell"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor:ColorPallete.dark_sellColor,
                    padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 12),
                    textStyle: const TextStyle(fontSize: 16),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }


  void _showBuyDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Buy Stock"),
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
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("Cancel",style: TextStyle(color: ColorPallete.dark_textcolor),),
            ),
            ElevatedButton(
              onPressed: () {
               
                Navigator.of(context).pop();
              },
              child: const Text("Confirm",style: TextStyle(color: ColorPallete.dark_textcolor),),
            ),
          ],
        );
      },
    );
  }


  void _showSellDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Sell Stock"),
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
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("Cancel",style: TextStyle(color: ColorPallete.dark_textcolor),),
            ),
            ElevatedButton(
              onPressed: () {
               
                Navigator.of(context).pop();
              },
              child: const Text("Confirm",style: TextStyle(color: ColorPallete.dark_textcolor),),
            ),
          ],
        );
      },
    );
  }
}
