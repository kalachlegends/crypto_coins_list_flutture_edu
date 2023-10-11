import 'package:crypto_coins_list/firebase_options.dart';
import 'package:dio/dio.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import 'package:crypto_coins_list/repositories/crypto_coins/crypto_coins.dart';
import 'crypto_coins_lis_app.dart';
// import 'package:talker_flutter/talker_flutter.dart';

void main() async {
  // final talker = TalkerFlutter.init();
  // GetIt.I.registerSingleton(talker);
  // GetIt.I<Talker>().debug('Talker started');

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  GetIt.I.registerLazySingleton<AbstractCoinsRepository>(
      () => CryptoCoinsRepository(dio: Dio()));
  runApp(const CryptoListApp());
}
