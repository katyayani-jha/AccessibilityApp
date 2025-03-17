import 'package:accessibility_app/cards_app/models/details.dart';
import 'package:accessibility_app/cards_app/widgets/card_item.dart';
import 'package:flutter/material.dart';

class CardsList extends StatelessWidget {
  const CardsList({
    super.key,
    required this.cards,
    required this.onRemoveCard,
  });

  final List<CardDetails> cards;
  final void Function(CardDetails cardDetails) onRemoveCard;

  @override
  Widget build(BuildContext context) {
    return ListWheelScrollView(
      
      itemExtent: 100, // Height of each item
      children: cards.map(
        (card) {
          return Dismissible(
            key: ValueKey(card),
            onDismissed: (direction) {
              onRemoveCard(card);
            },
            child: CardItem(card),
          );
        },
      ).toList(),
    );
  }
}

// ListViews are scrollable lists by default

// return ListView.builder(
      // itemBuilder: (ctx, index) => Dismissible(key: ValueKey(cards[index]), onDismissed: (direction) {
        // onRemoveCard(cards[index]);
      // }, child: CardItem(cards[index]),),
      // itemCount: cards.length,
    // );