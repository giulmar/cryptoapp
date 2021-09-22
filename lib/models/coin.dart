import 'package:json_annotation/json_annotation.dart';

part 'coin.g.dart';

@JsonSerializable(createToJson: false)
class Coin{
  String? id;
  String? name;
  String? symbol;
  String? image;

@JsonKey(name: 'current_price')
  double? currentPrice;

@JsonKey(name: 'market_cap')
  int? marketCap;

@JsonKey(name: 'price_change_percentage_24h')
  double? priceChangePercentage24h;

  Coin({this.id, this.name, this.symbol, this.image, this.currentPrice,
      this.marketCap, this.priceChangePercentage24h});

factory Coin.fromJson(Map<String,dynamic> json) => _$CoinFromJson(json);
}