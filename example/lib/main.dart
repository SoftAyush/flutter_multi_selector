import 'package:flutter/material.dart';
import 'package:flutter_multi_selector/DialogBox/MultiSelectorDialogField.dart';
import 'package:flutter_multi_selector/Utils/MultiSelectorItem.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MultiSelector Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const MultiSelectExamplePage(),
    );
  }
}

class MultiSelectExamplePage extends StatefulWidget {
  const MultiSelectExamplePage({super.key});

  @override
  State<MultiSelectExamplePage> createState() => _MultiSelectExamplePageState();
}

class _MultiSelectExamplePageState extends State<MultiSelectExamplePage> {
  final _formKey = GlobalKey<FormState>();

  final List<String> animals = [
    "Dog", "Cat", "Elephant", "Tiger", "Lion", 
    "Cow", "Horse", "Monkey", "Deer", "Rabbit"
  ];

  final List<String> fruits = [
    "Apple", "Banana", "Cherry", "Date", "Elderberry",
    "Fig", "Grape", "Honeydew", "Kiwi", "Lemon"
  ];

  final List<String> tags = [
    "Work", "Personal", "Urgent", "Later", "Done"
  ];

  List<String> _selectedAnimals = [];
  List<String> _selectedFruits = [];
  List<String> _selectedTags = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MultiSelector Demo'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Example 1: Basic List Mode
              _buildSectionHeader('1. Basic List Mode (with Validation)'),
              MultiSelectorDialogField<String>(
                items: animals
                    .map((e) => MultiSelectorItem(value: e, label: e))
                    .toList(),
                initialValue: _selectedAnimals,
                title: const Text("Select Animals"),
                searchable: true,
                showSelectAll: true,
                validator: (values) {
                  if (values == null || values.isEmpty) {
                    return "Please select at least one animal";
                  }
                  return null;
                },
                autovalidateMode: AutovalidateMode.onUserInteraction,
                onConfirm: (values) {
                  setState(() {
                    _selectedAnimals = values;
                  });
                },
                decoration: InputDecoration(
                  labelText: "Animals",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  prefixIcon: const Icon(Icons.pets),
                ),
              ),

              const SizedBox(height: 32),

              // Example 2: Chip Mode
              _buildSectionHeader('2. Chip Mode (Separate Selected)'),
              MultiSelectorDialogField<String>(
                items: fruits
                    .map((e) => MultiSelectorItem(value: e, label: e))
                    .toList(),
                initialValue: _selectedFruits,
                title: const Text("Select Fruits"),
                searchable: true,
                useChipsForSelection: true, // Enable chip mode
                // separateSelectedItems: true, // Separate selected items
                onConfirm: (values) {
                  setState(() {
                    _selectedFruits = values;
                  });
                },
                decoration: InputDecoration(
                  labelText: "Fruits",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  prefixIcon: const Icon(Icons.local_florist),
                ),
              ),

              const SizedBox(height: 32),

              // Example 3: Custom Colors
              _buildSectionHeader('3. Custom Colors & Styling'),
              MultiSelectorDialogField<String>(
                items: tags
                    .map((e) => MultiSelectorItem(value: e, label: e))
                    .toList(),
                initialValue: _selectedTags,
                title: const Text("Select Tags"),
                searchable: false,
                useChipsForSelection: true,
                colorBuilder: (value) {
                  switch (value) {
                    case "Urgent": return Colors.red;
                    case "Work": return Colors.blue;
                    case "Personal": return Colors.green;
                    default: return Colors.orange;
                  }
                },
                onConfirm: (values) {
                  setState(() {
                    _selectedTags = values;
                  });
                },
                decoration: InputDecoration(
                  labelText: "Tags",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  prefixIcon: const Icon(Icons.label),
                ),
              ),

              const SizedBox(height: 48),

              Center(
                child: FilledButton.icon(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            "Animals: ${_selectedAnimals.length}, "
                            "Fruits: ${_selectedFruits.length}, "
                            "Tags: ${_selectedTags.length}"
                          ),
                          behavior: SnackBarBehavior.floating,
                        ),
                      );
                    }
                  },
                  icon: const Icon(Icons.check),
                  label: const Text("Submit Form"),
                  style: FilledButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
