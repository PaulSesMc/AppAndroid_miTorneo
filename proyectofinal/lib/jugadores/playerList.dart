import 'package:flutter/material.dart';
import 'player.dart';
import 'playerItem.dart';

class playerList extends StatelessWidget {
  final List<Player> items;

  const playerList({required Key key, required this.items});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        return playerItem(item: items[index]);
      },
    );
  }
}
