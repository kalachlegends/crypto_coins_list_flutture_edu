import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'models/novella_model.dart';

// import 'models/crypto_coin_model.dart';

class NovellaRepository {
  Future<List<dynamic>> getNovellaList() async {
    final responce = await Dio()
        .get('https://api.novella-designer.com/api/v1/public/novella_news');
    final data = responce.data as Map<String, dynamic>;
    final novellaList = data['novella']
        .map((e) => Novella(
            name: e['novella']['name'], imgUrl: e['novella']['img_url']))
        .toList();
    print(novellaList);
    return novellaList;
  }
}
