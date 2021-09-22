import 'package:cryptoapplicazione/models/coin.dart';
import 'package:cryptoapplicazione/network/rest_client.dart';
import 'package:flutter/material.dart';

class CoinRepository{
  final RestClient? restClient;

  CoinRepository({@required this.restClient});

  Future<List<Coin>> get coins => restClient!.coins();
}