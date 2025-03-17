import 'package:accessibility_app/cards_app/models/details.dart';
import 'package:accessibility_app/cards_app/widgets/card.dart';
import 'package:flutter/material.dart';

class Scroll extends StatelessWidget {
  const Scroll(this.details, {super.key});

  final CardDetails details;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ListWheelScrollView'),
        centerTitle: true,
      ),
      body: ListWheelScrollView(
        itemExtent: 180,
        squeeze: 1.0,
        physics: const FixedExtentScrollPhysics(),
        children: [
          SingleCard(details),
          SingleCard(details),
          SingleCard(details),
          SingleCard(details),
        ],
      )
    );
  }
}