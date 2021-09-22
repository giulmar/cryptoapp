import 'package:cryptoapplicazione/models/coin.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';


part 'rest_client.g.dart';

@RestApi(baseUrl: 'https://api.coingecko.com/api/v3')
abstract class RestClient{

  factory RestClient(Dio dio) => _RestClient(dio);

  @GET('/coins/markets')
  Future<List<Coin>> coins({
  @Query('vs_currency') String currency = 'EUR',
  @Query('order') String order = 'market_cap_desc',
  @Query('per_page') int items = 250,
  @Query('page') int page = 1,
  @Query('parkline') bool parkLine = false,
  });

}