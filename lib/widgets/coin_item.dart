import 'package:cryptoapplicazione/misc/misc.formatters/PriceFormat.dart';
import 'package:cryptoapplicazione/models/coin.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CoinItem extends StatelessWidget{


  final Coin? coin;

  const CoinItem({Key? key, this.coin}) : super(key: key);

  @override
  Widget build(BuildContext context) => ListTile(
    dense: true,
    leading: Image.network(coin!.image!),
    title: Text('${coin!.name} (${coin!.symbol!.toUpperCase()})'),
    subtitle: Text(PriceFormat(decimalDigits: 0).format(price: coin!.marketCap)!),
    trailing: _trailing(context),
  );

  Widget _trailing(BuildContext context) => SizedBox.fromSize(
      size: Size(150,40),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
    children: <Widget> [
      Text(PriceFormat().format(price: coin!.currentPrice)!),
      Container(height: 2),
      Text(NumberFormat.decimalPercentPattern(decimalDigits:2).format(coin!.priceChangePercentage24h!/100), style: Theme.of(context).textTheme.caption!.copyWith(color: coin!.priceChangePercentage24h! > 0 ? Colors.green : coin!.priceChangePercentage24h! < 0 ? Colors.red : Colors.grey) )
    ],
  ));
}