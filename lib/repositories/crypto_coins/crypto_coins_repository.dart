import 'package:crypto_coins_list/repositories/crypto_coins/abstract_coins_repository.dart';
import 'package:crypto_coins_list/repositories/crypto_coins/models/crypto_coin_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

// import 'models/crypto_coin_model.dart';

class CryptoCoinsRepository implements AbstractCoinsRepository {
  CryptoCoinsRepository({required this.dio});
  final Dio dio;
  @override
  Future<List<CryptoCoin>> getCoinsList() async {
    final responce = await Dio().get(
        'https://min-api.cryptocompare.com/data/pricemultifull?fsyms=BTC,ETH,BNB,SOL,AID,CAG,DOV&tsyms=USD');
    final data = responce.data as Map<String, dynamic>;
    final dataRaw = data['RAW'] as Map<String, dynamic>;
    final dataList = dataRaw.entries.map((e) {
      final usdData =
          (e.value as Map<String, dynamic>)['USD'] as Map<String, dynamic>;
      final imageUrl = usdData['IMAGEURL'];
      final price = usdData['PRICE'];

      return CryptoCoin(name: e.key, priceInUSD: price, imageUrl: imageUrl);
    }).toList();

    return dataList;
  }
}
