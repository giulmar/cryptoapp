import 'package:cryptoapplicazione/blocs/coin_bloc.dart';
import 'package:cryptoapplicazione/repositories/coin_repository.dart';
import 'package:cryptoapplicazione/widgets/coin_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => BlocProvider(
        create: (BuildContext context) => CoinBloc(
            coinRepository: RepositoryProvider.of<CoinRepository>(context))
          ..fetchCoins(),
        child: Scaffold(
          appBar: AppBar(
            title: Text('Cryptovalute'),
            centerTitle: true,
          ),
          body: BlocBuilder<CoinBloc, CoinState>(
            builder: (BuildContext context, CoinState state) {
              if (state is FetchedCoinsState) {
                return ListView.separated(
                    itemBuilder: (BuildContext context, int index) =>
                        CoinItem(coin: state.coins![index]),
                    separatorBuilder: (_, __) => Divider(height: 0),
                    itemCount: state.coins!.length);
              }
              return Center(
                child: LinearProgressIndicator(),
              );
            },
          ),
        ),
      );
}
