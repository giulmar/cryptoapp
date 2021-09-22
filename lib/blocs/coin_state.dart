part of 'coin_bloc.dart';

abstract class CoinState extends Equatable {
  const CoinState();
}

class FetchingCoinsState extends CoinState{
  @override
  List<Object> get props => [];
}

class FetchedCoinsState extends CoinState{
  final List<Coin>? coins;

  FetchedCoinsState({@required this.coins});


  @override
  // TODO: implement props
  List<Object?> get props => [coins];
}
