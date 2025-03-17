import 'package:accessibility_app/cards_app/models/details.dart';
import 'package:flutter/material.dart';

class SingleCard extends StatelessWidget {
  const SingleCard(this.details, {super.key});

  final CardDetails details;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: 375.44,
            height: 166.33,
            decoration: ShapeDecoration(
              color: const Color(0xFF0B9CA5),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(28.51),
              ),
            ),
          ),
          Container(
            width: 356.43,
            height: 147.32,
            decoration: ShapeDecoration(
              shape: RoundedRectangleBorder(
                side: const BorderSide(width: 1.43, color: Color(0xFF0EC7D3)),
                borderRadius: BorderRadius.circular(28.51),
              ),
            ),
          ),
          Positioned(
            top: 30,
            child: SizedBox(
              width: 313,
              height: 140,
              child: Text(
                details.title.toString(),
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontFamily: 'Dongle',
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Positioned(
            top: 115,
            child: SizedBox(
              width: 199,
              height: 140,
              child: Text(
                  details.category.name.toUpperCase(),
                style: const TextStyle(
                  color: Color(0xFF0EC7D3),
                  fontSize: 15,
                  fontFamily: 'Dongle',
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
