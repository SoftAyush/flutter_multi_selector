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
      title: 'Enhanced MultiSelect Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
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
    "Dog",
    "Cat",
    "Elephant",
    "Tiger",
    "Lion",
    "Cow",
    "Horse",
    "Monkey",
    "Deer",
    "Rabbit",
  ];

  List<String> _selectedNumbers = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Enhanced MultiSelect Demo'), centerTitle: true),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'MultiSelector Example:',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              MultiSelectorDialogField<String>(
                items: animals
                    .map((animal) => MultiSelectorItem(value: animal, label: animal))
                    .toList(),
                initialValue: _selectedNumbers,
                validator: (values) {
                  if (values == null || values.isEmpty) {
                    return "Please select at least one item";
                  }
                  return null;
                },
                autovalidateMode: AutovalidateMode.onUserInteraction,
                buttonText: const Text("Select Numbers"),
                onConfirm: (values) {
                  setState(() {
                    _selectedNumbers = values;
                  });
                },
                searchable: true,
                showSelectAll: true,
                unselectedColor: Colors.white,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(color: Colors.grey),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(color: Colors.grey),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(color: Theme.of(context).primaryColor),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(color: Theme.of(context).colorScheme.error),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(color: Theme.of(context).colorScheme.error),
                  ),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
                  isDense: true,
                  errorStyle: TextStyle(fontSize: 0)
                ),
                // Remove fieldShape since we're using InputDecoration
                // fieldShape: RoundedRectangleBorder(
                //   borderRadius: BorderRadius.circular(8),
                //   side: const BorderSide(color: Colors.grey),
                // ),
              ),
              Divider(),
              const SizedBox(height: 30),

              Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      ScaffoldMessenger.of(
                        context,
                      ).showSnackBar(SnackBar(content: Text("Selected Animal: $_selectedNumbers")));
                    }
                  },
                  child: const Text("Submit Form"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
