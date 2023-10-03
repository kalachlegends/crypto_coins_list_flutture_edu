import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CoinListTitle extends StatelessWidget {
  const CoinListTitle(
      {super.key,
      required this.theme,
      required this.coinName,
      required this.priceInUSD,
      required this.imageUrl});

  final ThemeData theme;
  final String coinName;
  final double priceInUSD;
  final String imageUrl;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.network(
        imageUrl,
        height: 45,
        width: 45,
      ),
      title: Text(
        coinName,
        style: theme.textTheme.bodyMedium,
      ),
      subtitle: Text(
        "$priceInUSD\$",
        style: theme.textTheme.bodySmall,
      ),
      trailing: const Icon(
        Icons.arrow_forward_ios,
      ),
      onTap: () =>
          {Navigator.of(context).pushNamed('/coin', arguments: coinName)},
    );
  }
}
