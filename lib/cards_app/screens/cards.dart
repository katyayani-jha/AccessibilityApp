import 'package:accessibility_app/cards_app/widgets/cards_list.dart';
import 'package:accessibility_app/cards_app/models/details.dart';
import 'package:accessibility_app/cards_app/widgets/new_card.dart';
import 'package:flutter/material.dart';

// Widget for managing cards
class Cards extends StatefulWidget {
  const Cards({Key? key}) : super(key: key);

  @override
  State<Cards> createState() {
    return _CardsState();
  }
}

class _CardsState extends State<Cards> {
  final List<CardDetails> _registeredCardDetails = [
    CardDetails(
      title: 'How are you?',
      category: Category.leisure,
      date: DateTime.now(),
    ),
  ]; // List of registered card details
  final TextEditingController _searchController = TextEditingController(); // Text controller for search
  List<String> _cardTitles = []; // List of card titles
  List<CardDetails> _filteredCardDetails = []; // List of filtered card details

  @override
  void initState() {
    super.initState();
    _filteredCardDetails.addAll(_registeredCardDetails);
    _searchController.addListener(_onSearchChanged); // Add listener for search controller
    _cardTitles = _registeredCardDetails.map((card) => card.title).toList();
  }

  @override
  void dispose() {
    _searchController.dispose(); // Dispose search controller
    super.dispose();
  }

  // Function to handle search changes
  void _onSearchChanged() {
    String query = _searchController.text.toLowerCase();
    setState(() {
      _filteredCardDetails = _registeredCardDetails.where((card) {
        final title = card.title.toLowerCase();
        return title.contains(query);
      }).toList();
    });
  }

  // Function to open add card overlay
  void _openAddCardOverlay() {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (ctx) => NewCard(
        onAddCard: _addCard,
      ),
    );
  }

  // Function to add a new card
  void _addCard(CardDetails cardDetails) {
    setState(() {
      _registeredCardDetails.add(cardDetails);
      _cardTitles.add(cardDetails.title);
      _filteredCardDetails.add(cardDetails);
    });
  }

  // Function to remove a card
  void _removeCard(CardDetails cardDetails) {
    final cardIndex = _registeredCardDetails.indexOf(cardDetails);
    setState(() {
      _registeredCardDetails.remove(cardDetails);
      _cardTitles.remove(cardDetails.title);
      _filteredCardDetails.remove(cardDetails);
    });
    ScaffoldMessenger.of(context).clearSnackBars(); // Clear existing snack bars
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 3), // Set duration for snack bar
        content: const Text('Expense deleted.'), // Snack bar content
        action: SnackBarAction(
          label: 'Undo', // Undo action label
          onPressed: () {
            setState(() {
              _registeredCardDetails.insert(cardIndex, cardDetails);
              _cardTitles.insert(cardIndex, cardDetails.title);
              _filteredCardDetails.insert(cardIndex, cardDetails);
            });
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget mainContent = const Center(
      child: Text('No cards found. Start adding some!'), // Display message if no cards found
    );

    if (_filteredCardDetails.isNotEmpty) {
      mainContent = CardsList(cards: _filteredCardDetails, onRemoveCard: _removeCard); // Display card list
    }

    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Icon(Icons.search), // Search icon
            SizedBox(width: 8), // Add some space between the icon and text field
            Expanded(
              child: DropdownButtonFormField<String>(
                items: _cardTitles.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    _searchController.text = newValue ?? '';
                    _onSearchChanged(); // Handle search changes
                  });
                },
                decoration: InputDecoration(
                  hintText: 'Search...', // Search hint text
                ),
              ),
            ),
            IconButton(
              onPressed: () {
                _searchController.clear(); // Clear search text
                _onSearchChanged(); // Handle search changes
              },
              icon: Icon(Icons.clear), // Clear icon
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 3,
            child: mainContent, // Main content (card list)
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: IconButton(
          icon: const Icon(Icons.add), // Add icon
          onPressed: _openAddCardOverlay, // Open add card overlay
        ),
      ),
    );
  }
}