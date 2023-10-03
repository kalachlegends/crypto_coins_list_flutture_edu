import 'package:crypto_coins_list/repositories/novella/models/novella_model.dart';
import 'package:crypto_coins_list/repositories/novella/novella_list_repository.dart';
import 'package:crypto_coins_list/widgets/bottom_navigation.dart';
import 'package:flutter/material.dart';

class NovellaListScreen extends StatefulWidget {
  const NovellaListScreen({super.key, required this.title});
  final String title;

  @override
  State<NovellaListScreen> createState() => _NovellaListScreenState();
}

class _NovellaListScreenState extends State<NovellaListScreen> {
  List<dynamic>? novellaList;
  @override
  @override
  void initState() {
    Future.delayed(Duration.zero, () async {
      novellaList = await NovellaRepository().getNovellaList();
      setState(() {});
      //here is the async code, you can execute any async code here
    });

    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BotttomNavigation(),
        body: (novellaList == null)
            ? Text('Loading....')
            : ListView.builder(
                itemCount: novellaList!.length,
                itemBuilder: (context, i) {
                  final novella = novellaList![i];
                  return Card(
                      child: ListTile(
                    leading: Image.network(novella.imgUrl),
                    title: Text(novella.name),
                  ));
                }),
        appBar: AppBar(
          title: Text(
            widget.title,
            textAlign: TextAlign.center,
          ),
        ));
  }
}
