import 'package:flutter/material.dart';

class ListTileDrawer extends StatelessWidget {
  const ListTileDrawer({
    Key key,
    this.title,
    this.onTap,
    this.icon
  }) : super(key: key);
  final String title;
  final VoidCallback onTap;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title,
        style: TextStyle(
          color: Colors.white,
          fontFamily: 'Dubai',
          fontWeight: FontWeight.bold,
          fontSize: 25,
        ),
      ),
      trailing: Icon(
        icon,
        color: Colors.white,
        size: 30,
      ),
      onTap: onTap,
    );
  }
}
