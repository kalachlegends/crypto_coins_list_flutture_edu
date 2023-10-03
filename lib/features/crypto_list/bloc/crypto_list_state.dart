part of 'crypto_list_bloc.dart';

class CryptoListState {}

class CryptoListInitial extends CryptoListState {}

class CryptoListLoadded extends CryptoListState {
  CryptoListLoadded({required this.coinsList});
  final List<CryptoCoin> coinsList;
}

class CryptoListLoadingFailure extends CryptoListState {
  final Object? expection;
  CryptoListLoadingFailure({this.expection});
}
