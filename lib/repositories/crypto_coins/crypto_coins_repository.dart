import 'package:crypto_coins_list/repositories/crypto_coins/models/crypto_coin_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

// import 'models/crypto_coin_model.dart';

class CryptoCoinsRepository {
  void initState() {}
  Future<List<CryptoCoin>> getCoinsList() async {
    final responce = await Dio().get(
        'https://min-api.cryptocompare.com/data/pricemulti?fsyms=BTC,ETH,BNB,SOL,AID,CAG,DOV&tsyms=USD');
    final data = responce.data as Map<String, dynamic>;
    final dataList = data.entries
        .map((e) => CryptoCoin(
            name: e.key, priceInUSD: (e.value as Map<String, dynamic>)['USD']))
        .toList();

    return dataList;
  }
}
