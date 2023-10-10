part of 'crypto_list_bloc.dart';

abstract class CryptoListState extends Equatable {
  @override
  List<Object?> get props => [];
}

class CryptoListInitial extends CryptoListState {
  @override
  List<Object?> get props => [];
}

class CryptoListLoading extends CryptoListState {
  @override
  List<Object?> get props => [];
}

class CryptoListLoadded extends CryptoListState {
  CryptoListLoadded({required this.coinsList});
  final List<CryptoCoin> coinsList;
  @override
  List<Object?> get props => [coinsList];
}

class CryptoListLoadingFailure extends CryptoListState {
  final Object? expection;
  CryptoListLoadingFailure({this.expection});

  @override
  List<Object?> get props => [expection];
}
