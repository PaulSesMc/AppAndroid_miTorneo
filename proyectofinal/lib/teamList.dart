import 'package:flutter/material.dart';
import 'team.dart';
import 'teamItem.dart';

class TeamList extends StatelessWidget {
  final List<Team> items;

  const TeamList({required Key key, required this.items});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        return TeamItem(item: items[index]);
      },
    );
  }
}
