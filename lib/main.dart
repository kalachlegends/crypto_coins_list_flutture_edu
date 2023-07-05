import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'dart:developer';

void main() {
  runApp(const CryptoList());
}

class CryptoList extends StatelessWidget {
  const CryptoList({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      routes: {
        '/': (context) => CryptoListScreen(
              title: "Coins List",
            ),
        '/coin': (context) => CryptoCoinScreen()
      },
      theme: ThemeData(
        scaffoldBackgroundColor: Color.fromARGB(255, 43, 43, 43),
        dividerColor: Colors.white24,
        appBarTheme: const AppBarTheme(
            backgroundColor: Color.fromARGB(255, 43, 43, 43),
            titleTextStyle: TextStyle(
              color: Colors.white,
              fontSize: 24,
            )),
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 251, 255, 4)),
        primarySwatch: Colors.yellow,
        useMaterial3: true,
        listTileTheme: ListTileThemeData(iconColor: Colors.white),
        textTheme: const TextTheme(
            bodyMedium: TextStyle(color: Colors.white, fontSize: 20),
            bodyLarge: TextStyle(color: Colors.white, fontSize: 20),
            bodySmall: TextStyle(color: Colors.white)),
      ),
    );
  }
}

class CryptoListScreen extends StatefulWidget {
  const CryptoListScreen({super.key, required this.title});
  final String title;

  @override
  State<CryptoListScreen> createState() => _CryptoListScreenState();
}

class _CryptoListScreenState extends State<CryptoListScreen> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
        appBar: AppBar(
          title: Text(
            widget.title,
            textAlign: TextAlign.center,
          ),
        ),
        body: ListView.separated(
            itemCount: 10,
            separatorBuilder: (context, index) => Divider(),
            itemBuilder: (context, i) {
              final coinName = 'Bitcoin';
              return ListTile(
                leading: SvgPicture.asset(
                  'assets/images/svg12.svg',
                  height: 45,
                  width: 45,
                ),
                title: Text(
                  "Bitcoin",
                  style: theme.textTheme.bodyMedium,
                ),
                subtitle: Text(
                  "20000\$",
                  style: theme.textTheme.bodySmall,
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                ),
                onTap: () => {
                  Navigator.of(context)
                      .pushNamed('/coin', arguments: '$coinName $i')
                },
              );
            }));
  }
}

class CryptoCoinScreen extends StatefulWidget {
  const CryptoCoinScreen({super.key});

  @override
  State<CryptoCoinScreen> createState() => _CryptoCoinScreenState();
}

class _CryptoCoinScreenState extends State<CryptoCoinScreen> {
  String? coinName;
  @override
  void didChangeDependencies() {
    final args = ModalRoute.of(context)?.settings.arguments;
    if (args == null) {
      //  log('You must provide args');
      return;
    }
    if (args is! String) {
      // log('You must provide args');
      return;
    }
    coinName = args;
    setState(() {});
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(coinName ?? '..'),
      ),
    );
  }
}
