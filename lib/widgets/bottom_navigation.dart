import 'package:flutter/material.dart';

class BotttomNavigation extends StatelessWidget {
  const BotttomNavigation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        items: [
          const BottomNavigationBarItem(
              icon: Icon(Icons.abc), label: 'Crypto List'),
          const BottomNavigationBarItem(
              icon: Icon(Icons.abc), label: 'Novella List')
        ],
        onTap: (index) => {
              if (index == 0)
                {
                  Navigator.of(context).pushNamed(
                    '/',
                  )
                }
              else if (index == 1)
                {
                  Navigator.of(context).pushNamed(
                    '/novella_list',
                  )
                }
            });
  }
}
