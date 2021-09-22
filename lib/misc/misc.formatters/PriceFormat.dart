import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

class PriceFormat{
  NumberFormat? _formatter;

PriceFormat({
String currencyName = 'EUR',
String symbol = '€',
int decimalDigits = 2,

}) {
  _formatter = NumberFormat.currency(name: currencyName, symbol: symbol, decimalDigits: decimalDigits);
}

String? format({@required dynamic price}){
  return _formatter!.format(price);
}
}