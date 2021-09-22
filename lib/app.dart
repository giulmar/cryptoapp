import 'package:cryptoapplicazione/network/rest_client.dart';
import 'package:cryptoapplicazione/pages/home_page.dart';
import 'package:cryptoapplicazione/repositories/coin_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';

class MyApp extends StatelessWidget{

  @override
  Widget build(BuildContext context) => _providers(child: MaterialApp(
    title: 'Crypto App',
    theme: ThemeData(
        primarySwatch: Colors.orange,
        visualDensity: VisualDensity.adaptivePlatformDensity),
    home: HomePage(),
  ),
  );

  Widget _providers({@required Widget? child}) => MultiRepositoryProvider(
    child: Center(child: child),
    providers: [
      RepositoryProvider(
      create: (_) => CoinRepository(restClient: RestClient(Dio())),
      )
    ],
  );
}