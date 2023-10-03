import 'package:crypto_coins_list/repositories/crypto_coins/abstract_coins_repository.dart';
import 'package:crypto_coins_list/repositories/crypto_coins/crypto_coins.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

part 'crypto_list_event.dart';
part 'crypto_list_state.dart';

class CryptoListBloc extends Bloc<CryptoListEvent, CryptoListState> {
  CryptoListBloc(this.coinsRepository) : super(CryptoListInitial()) {
    on<LoadCryptoList>((event, emit) async {
      try {
        final coinsList =
            await GetIt.I<AbstractCoinsRepository>().getCoinsList();
        emit(CryptoListLoadded(coinsList: coinsList));
      } catch (e) {
        emit(CryptoListLoadingFailure(expection: e));
      }
    });
  }
  final AbstractCoinsRepository coinsRepository;
}
