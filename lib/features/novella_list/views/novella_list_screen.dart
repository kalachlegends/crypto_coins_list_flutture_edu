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
    _loading();
    super.initState();
  }

  _loading() async {
    novellaList = await NovellaRepository().getNovellaList();
    setState(() {});
  }

  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BotttomNavigation(),
        body: (novellaList == null)
            ? const Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemCount: novellaList!.length,
                itemBuilder: (context, i) {
                  final novella = novellaList![i];
                  return Container(
                      margin: const EdgeInsets.only(
                          left: 20.0, right: 20.0, bottom: 10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.white12,
                            blurRadius: 4,
                            offset: Offset(0, 2), // Shadow position
                          ),
                        ],
                        border: Border.all(
                          color: Color.fromARGB(255, 38, 39, 39),
                          width: 1,
                        ),
                      ),
                      child: Row(children: [
                        Expanded(
                          flex: 2,
                          child: Align(
                              alignment: Alignment.topLeft,
                              child: Padding(
                                padding: EdgeInsets.all(16.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      novella.name,
                                      textAlign: TextAlign.left,
                                      textDirection: TextDirection.rtl,
                                      style: TextStyle(
                                          fontSize: 20, color: Colors.black),
                                    ),
                                    novella.description != null
                                        ? Text(
                                            novella.description,
                                            style: TextStyle(
                                                fontSize: 10,
                                                color: Colors.black),
                                          )
                                        : const Text('')
                                  ],
                                ),
                              )),
                        ),
                        Expanded(
                            flex: 1,
                            child: Padding(
                              padding: EdgeInsets.all(16.0),
                              child: Image.network(
                                novella.imgUrl,
                                height: 100,
                                fit: BoxFit.fitWidth,
                              ),
                            )),
                      ]));
                }),
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text(
            widget.title,
            textAlign: TextAlign.center,
          ),
        ));
  }
}
