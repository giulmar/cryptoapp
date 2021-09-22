import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cryptoapplicazione/models/coin.dart';
import 'package:cryptoapplicazione/repositories/coin_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'coin_event.dart';
part 'coin_state.dart';

class CoinBloc extends Bloc<CoinEvent, CoinState> {

  final CoinRepository? coinRepository;

  CoinBloc({@required this.coinRepository}) : super(FetchingCoinsState());

  @override
  Stream<CoinState> mapEventToState(
    CoinEvent event,
  ) async* {
   if(event is FetchCoinEvent){
     yield FetchingCoinsState();

     List<Coin> coins = await coinRepository!.coins;

     yield FetchedCoinsState(coins: coins);
   }
  }

  @override
  CoinState get initialState => FetchingCoinsState();

void fetchCoins() => add(FetchCoinEvent());
}
