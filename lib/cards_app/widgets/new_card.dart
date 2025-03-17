import 'package:flutter/material.dart';
import 'package:accessibility_app/cards_app/models/details.dart';
import 'package:flutter_signature_pad/flutter_signature_pad.dart';

// Widget for adding a new card
class NewCard extends StatefulWidget {
  final String? initText; // Initial text for the card
  const NewCard({super.key, required this.onAddCard, this.initText});

  // Callback function to handle adding a new card
  final void Function(CardDetails cardDetails) onAddCard;

  @override
  State<NewCard> createState() {
    return _NewCardState();
  }
}

class _NewCardState extends State<NewCard> {
  // Controllers for text field and signature pad
  final _textController = TextEditingController();
  final GlobalKey<SignatureState> _signatureKey = GlobalKey();
  DateTime? _selectedDate; // Selected date
  Category _selectedCategory = Category.emergency; // Selected category

  // Function to present date picker
  void _presentDatePicker() async {
    final now = DateTime.now();
    final firstDate = DateTime(now.year - 1, now.month, now.day);
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: firstDate,
      lastDate: now,
    );
    setState(() {
      _selectedDate = pickedDate;
    });
  }

  // Function to submit card data
  void _submitCardData() {
    if (_textController.text.trim().isEmpty) {
      // Show alert dialog if text field is empty
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: const Text('Invalid Input'),
          content: const Text(
              'Please make sure a valid message, date and category was entered.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(ctx);
              },
              child: const Text('Okay'),
            ),
          ],
        ),
      );
      return;
    }

    // Invoke the callback function to add the card details
    widget.onAddCard(
      CardDetails(
        title: _textController.text,
        category: _selectedCategory,
        date: _selectedDate!,
      ),
    );

    Navigator.pop(context); // Close the screen after adding the card
  }

  @override
  void dispose() {
    _textController.dispose(); // Dispose text controller
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 48, 16, 16),
      child: Column(
        children: [
          TextField(
            maxLength: 25, // Set maximum length for text field
            controller: _textController, // Bind controller to text field
            decoration: const InputDecoration(
              label: Text('Enter your Text'), // Label for text field
            ),
          ),
          Container(
            height: 200,
            child: Signature(
              color: Colors.black, // Signature color
              strokeWidth: 2.0, // Signature stroke width
              key: _signatureKey, // Bind key to signature pad
            ),
          ),
          const SizedBox(height: 16), // Add vertical space
          Row(
            children: [
              const SizedBox(width: 16), // Add horizontal space
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      _selectedDate == null
                          ? 'No date selected'
                          : formatter.format(_selectedDate!), // Format selected date
                    ),
                    IconButton(
                      onPressed: _presentDatePicker, // Show date picker
                      icon: const Icon(
                        Icons.calendar_month, // Calendar icon
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 16,
          ), // Add vertical space
          Row(
            children: [
              DropdownButton(
                value: _selectedCategory, // Current selected category
                items: Category.values
                    .map(
                      (category) => DropdownMenuItem(
                        value: category,
                        child: Text(
                          category.name.toUpperCase(), // Uppercase category name
                        ),
                      ),
                    )
                    .toList(),
                onChanged: (value) {
                  if (value == null) {
                    return;
                  }
                  setState(() {
                    _selectedCategory = value; // Update selected category
                  });
                },
              ),
              const Spacer(), // Fill remaining space
              TextButton(
                onPressed: () {
                  Navigator.pop(context); // Close screen on cancel
                },
                child: const Text('Cancel'), // Cancel button
              ),
              ElevatedButton(
                onPressed: _submitCardData, // Submit card data
                child: const Text('Save', style: TextStyle(color: Colors.white),), // Save button
              ),
            ],
          )
        ],
      ),
    );
  }
}