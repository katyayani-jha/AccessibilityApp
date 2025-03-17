import 'package:uuid/uuid.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

final formatter = DateFormat.yMd();

const uuid = Uuid();

enum Category { emergency, travel, leisure, work }

const categoryIcons = {
  Category.emergency: Icons.emergency,
  Category.travel: Icons.flight_takeoff,
  Category.leisure: Icons.movie,
  Category.work: Icons.work,
};

class CardDetails {
  CardDetails({
    required this.title,
    required this.category,
    required this.date,
  }) : id = uuid.v4();

  final String title;
  final Category category;
  final String id;
  final DateTime date;

  String get formattedDate {
    return formatter.format(date);
  }
}



