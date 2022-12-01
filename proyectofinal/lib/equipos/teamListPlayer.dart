import 'package:flutter/material.dart';
import 'team.dart';
import 'teamItemPlayer.dart';

class teamListPlayer extends StatelessWidget {
  final List<Team> items;

  const teamListPlayer({required Key key, required this.items});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        return teamItemPlayer(item: items[index]);
      },
    );
  }
}
