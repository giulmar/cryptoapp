part of 'coin_bloc.dart';

abstract class CoinEvent extends Equatable {
  const CoinEvent();
}

class FetchCoinEvent extends CoinEvent{

  @override
  List<Object> get props => [];
}