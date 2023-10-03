import 'package:crypto_coins_list/repositories/crypto_coins/crypto_coins_repository.dart';
import 'package:crypto_coins_list/repositories/crypto_coins/models/crypto_coin_model.dart';
import 'package:flutter/material.dart';

import '../../../widgets/bottom_navigation.dart';
import '../widgets/crypto_coin_title.dart';

class CryptoListScreen extends StatefulWidget {
  const CryptoListScreen({super.key, required this.title});
  final String title;

  @override
  State<CryptoListScreen> createState() => _CryptoListScreenState();
}

class _CryptoListScreenState extends State<CryptoListScreen> {
  // @override void initState() {
  //   CryptoCoinsRepository()
  //   super.initState();
  // }
  List<CryptoCoin>? _cryptoCoinsList;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
        floatingActionButton: FloatingActionButton(
            onPressed: () async {
              _cryptoCoinsList = await CryptoCoinsRepository().getCoinsList();
              setState(() {});
            },
            child: const Icon(Icons.dangerous)),
        appBar: AppBar(
          title: Text(
            widget.title,
            textAlign: TextAlign.center,
          ),
        ),
        bottomNavigationBar: BotttomNavigation(),
        body: (_cryptoCoinsList == null)
            ? SizedBox()
            : ListView.separated(
                itemCount: _cryptoCoinsList!.length,
                separatorBuilder: (context, index) => Divider(),
                itemBuilder: (context, i) {
                  final coin = _cryptoCoinsList![i];
                  final coinName = coin.name;
                  return CoinListTitle(
                    theme: theme,
                    coinName: coinName,
                    priceInUSD: coin.priceInUSD,
                  );
                }));
  }
}
