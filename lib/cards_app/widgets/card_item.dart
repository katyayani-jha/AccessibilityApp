import 'package:accessibility_app/cards_app/models/details.dart';
import 'package:accessibility_app/srestha_s_application4/presentation/landing_keyboard_screen/landing_keyboard_screen.dart';
import 'package:flutter/material.dart';

class CardItem extends StatelessWidget {
  const CardItem(this.details, {super.key});

  final CardDetails details;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => LandingKeyboardScreen(
              initialText: details.title,
            ),
          ),
        );

      },
      child: Card(
        shape: RoundedRectangleBorder(
          side: BorderSide.none,
          borderRadius: BorderRadius.circular(20),
        ),
        color: const Color(0xFF0EC7D3),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 16,
          ),
          child: Column(
            children: [
              Text(
                details.title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontFamily: 'Dongle',
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 4,
              ),
              Row(
                children: [
                  Text(
                    details.category.name.toUpperCase(),
                    style: const TextStyle(
                      color: Color.fromARGB(255, 252, 252, 252),
                      fontSize: 15,
                      fontFamily: 'Dongle',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Spacer(),
                  Row(
                    children: [
                      Icon(
                        categoryIcons[details.category],
                        color: const Color.fromARGB(255, 173, 243, 248),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Text(
                        details.formattedDate,
                        style: const TextStyle(
                          color: Color.fromARGB(255, 255, 255, 255),
                          fontSize: 15,
                          fontFamily: 'Dongle',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}


