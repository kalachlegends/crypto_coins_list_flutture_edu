import 'dart:async';

import 'package:crypto_coins_list/features/crypto_list/bloc/crypto_list_bloc.dart';
import 'package:crypto_coins_list/repositories/crypto_coins/crypto_coins.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../../../widgets/bottom_navigation.dart';
import '../widgets/crypto_coin_title.dart';

class CryptoListScreen extends StatefulWidget {
  const CryptoListScreen({super.key, required this.title});
  final String title;

  @override
  State<CryptoListScreen> createState() => _CryptoListScreenState();
}

class _CryptoListScreenState extends State<CryptoListScreen> {
  @override
  final _cryptoListBloc = CryptoListBloc(GetIt.I<AbstractCoinsRepository>());
  void initState() {
    _cryptoListBloc.add(LoadCryptoList());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          widget.title,
          textAlign: TextAlign.center,
        ),
      ),
      bottomNavigationBar: const BotttomNavigation(),
      body: RefreshIndicator(
        onRefresh: () async {
          final completer = Completer();
          _cryptoListBloc.add(LoadCryptoList(completer: completer));
          return completer.future;
        },
        child: BlocBuilder<CryptoListBloc, CryptoListState>(
          bloc: _cryptoListBloc,
          builder: (context, state) {
            if (state is CryptoListLoading) {
              return const Center(child: CircularProgressIndicator());
            }
            if (state is CryptoListLoadingFailure) {
              return Center(
                  child: Column(
                children: [
                  const Text('Something went wrong'),
                  const SizedBox(
                    height: 30,
                  ),
                  TextButton(
                      onPressed: () {
                        _cryptoListBloc.add(LoadCryptoList());
                      },
                      child: Text("Try Again"))
                ],
              ));
            }

            if (state is CryptoListLoadded) {
              return ListView.separated(
                  itemCount: state.coinsList.length,
                  separatorBuilder: (context, index) => Divider(),
                  itemBuilder: (context, i) {
                    final coin = state.coinsList[i];
                    final coinName = coin.name;
                    return CoinListTitle(
                      theme: theme,
                      coinName: coinName,
                      imageUrl:
                          'https://www.cryptocompare.com/${coin.imageUrl}',
                      priceInUSD: coin.priceInUSD,
                    );
                  });
            }
            return const Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
