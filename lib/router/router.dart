import 'package:crypto_coins_list/features/novella_list/novella_list.dart';

import '../features/crypto_coin/views/crypto_coin_screen.dart';
import '../features/crypto_list/view/crypto_list_screen.dart';

final routes = {
  '/': (context) => const CryptoListScreen(
        title: "Coins List",
      ),
  '/novella_list': (context) => const NovellaListScreen(
        title: "Novella List",
      ),
  '/coin': (context) => const CryptoCoinScreen()
};
