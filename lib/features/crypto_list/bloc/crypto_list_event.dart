part of 'crypto_list_bloc.dart';

class CryptoListEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoadCryptoList extends CryptoListEvent {
  final Completer? completer;
  LoadCryptoList({this.completer});

  @override
  List<Object?> get props => [completer];
}
