import 'package:flutter/material.dart';
import 'package:portfolio_webapp/app/theme/custom_theme.dart';

class DrawerListTile extends StatelessWidget {
  const DrawerListTile(
      {super.key, required this.title, required this.onTap});

  final String title;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: CustomTheme.secondaryColor,
              width: 0.1,
            ),
          ),
        ),
        child: GestureDetector(
          onTap: onTap,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Padding(padding: const EdgeInsets.all(16.0), child: Text(title),),
            ],
          ),
        ),
      ),
    );
  }
}
