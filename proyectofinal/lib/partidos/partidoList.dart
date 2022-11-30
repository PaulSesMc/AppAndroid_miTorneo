import 'package:flutter/material.dart';
import 'partido.dart';
import 'partidoItem.dart';

class PartidoList extends StatelessWidget {
  final List<Partido> items;

  const PartidoList({required Key key, required this.items});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        return PartidoItem(item: items[index]);
      },
    );
  }
}
