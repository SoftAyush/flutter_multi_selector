import 'package:flutter/material.dart';
import 'package:flutter_multi_selector/DialogBox/multi_selector_dialog_field.dart';
import 'package:flutter_multi_selector/Utils/multi_selector_item.dart';

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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        useMaterial3: true,
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
          filled: true,
          fillColor: Colors.grey.shade50,
        ),
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

  // Data Sources
  final List<String> animals = [
    "Dog", "Cat", "Elephant", "Tiger", "Lion",
    "Cow", "Horse", "Monkey", "Deer", "Rabbit"
  ];

  final List<String> fruits = [
    "Apple", "Banana", "Cherry", "Date", "Elderberry",
    "Fig", "Grape", "Honeydew", "Kiwi", "Lemon"
  ];

  final List<String> tags = [
    "Work", "Personal", "Urgent", "Later", "Done", "Meeting", "Review"
  ];

  // State Variables
  List<String> _selectedAnimals = [];
  List<String> _selectedFruits = [];
  List<String> _selectedTags = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MultiSelector Demo'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              setState(() {
                _selectedAnimals = [];
                _selectedFruits = [];
                _selectedTags = [];
                _formKey.currentState?.reset();
              });
            },
            tooltip: "Reset Form",
          )
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeader("Flutter Multi Selector", "A comprehensive demo of all features"),
              const SizedBox(height: 32),

              // ---------------------------------------------------------
              // Example 1: Basic List Mode with Search & Select All
              // ---------------------------------------------------------
              _buildSectionHeader(
                '1. Searchable List & Select All',
                'Standard dropdown with search and bulk selection capabilities.',
              ),
              MultiSelectorDialogField<String>(
                items: animals.map((e) => MultiSelectorItem(e, e)).toList(),
                initialValue: _selectedAnimals,
                title: const Text("Select Animals"),
                searchable: true,
                showSelectAll: true,
                selectAllText: "Select All Animals",
                deselectAllText: "Clear Selection",
                decoration: const InputDecoration(
                  labelText: "Animals",
                  prefixIcon: Icon(Icons.pets),
                  hintText: "Choose your favorite animals",
                ),
                onConfirm: (values) {
                  setState(() => _selectedAnimals = values);
                },
              ),

              const SizedBox(height: 32),

              // ---------------------------------------------------------
              // Example 2: Chip Mode & Validation
              // ---------------------------------------------------------
              _buildSectionHeader(
                '2. Chip Mode & Validation',
                'Displays selected items as chips. Try submitting without selecting to see validation.',
              ),
              MultiSelectorDialogField<String>(
                items: fruits.map((e) => MultiSelectorItem(e, e)).toList(),
                initialValue: _selectedFruits,
                title: const Text("Select Fruits"),
                searchable: true,
                useChipsForSelection: true,
                buttonText: const Text("Select Fruits"),
                decoration: const InputDecoration(
                  labelText: "Fruits",
                  prefixIcon: Icon(Icons.local_florist),
                ),
                validator: (values) {
                  if (values == null || values.isEmpty) {
                    return "Please select at least one fruit";
                  }
                  return null;
                },
                autovalidateMode: AutovalidateMode.onUserInteraction,
                onConfirm: (values) {
                  setState(() => _selectedFruits = values);
                },
              ),

              const SizedBox(height: 32),

              // ---------------------------------------------------------
              // Example 3: Custom Styling & Color Builder
              // ---------------------------------------------------------
              _buildSectionHeader(
                '3. Custom Styling & Colors',
                'Custom colors based on value and separate selected items view.',
              ),
              MultiSelectorDialogField<String>(
                items: tags.map((e) => MultiSelectorItem(e, e)).toList(),
                initialValue: _selectedTags,
                title: const Text("Manage Tags"),
                searchable: false,
                useChipsForSelection: true,
                separateSelectedItems: true,
                decoration: const InputDecoration(
                  labelText: "Tags",
                  prefixIcon: Icon(Icons.label),
                ),
                colorBuilder: (value) {
                  switch (value) {
                    case "Urgent": return Colors.red;
                    case "Work": return Colors.blue;
                    case "Personal": return Colors.green;
                    case "Done": return Colors.grey;
                    default: return Colors.orange;
                  }
                },
                onConfirm: (values) {
                  setState(() => _selectedTags = values);
                },
              ),

              const SizedBox(height: 48),

              // ---------------------------------------------------------
              // Submit Button
              // ---------------------------------------------------------
              Center(
                child: SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: FilledButton.icon(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _showSuccessDialog();
                      }
                    },
                    icon: const Icon(Icons.check_circle_outline),
                    label: const Text("Submit Form", style: TextStyle(fontSize: 16)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(String title, String subtitle) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
            fontWeight: FontWeight.bold,
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          subtitle,
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
            color: Colors.grey[600],
          ),
        ),
        const Divider(height: 32),
      ],
    );
  }

  Widget _buildSectionHeader(String title, String description) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            description,
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey[600],
            ),
          ),
        ],
      ),
    );
  }

  void _showSuccessDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Submission Successful"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildResultRow("Animals", _selectedAnimals),
            _buildResultRow("Fruits", _selectedFruits),
            _buildResultRow("Tags", _selectedTags),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("OK"),
          ),
        ],
      ),
    );
  }

  Widget _buildResultRow(String label, List<String> values) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("$label: ", style: const TextStyle(fontWeight: FontWeight.bold)),
          Expanded(
            child: Text(
              values.isEmpty ? "None" : values.join(", "),
              style: TextStyle(color: values.isEmpty ? Colors.grey : null),
            ),
          ),
        ],
      ),
    );
  }
}
