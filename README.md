# flutter_multi_selector


## Features

- Custom multi-select dialog field widget
- Supports form validation with error messages
- Searchable list of selectable items
- Select All / Deselect All functionality
- Initial value support for pre-selected items
- Customizable button text and field styling

## Usage

### MultiSelectorDialogField

This widget shows a button that opens a multi-select dialog. It integrates with Flutter forms and allows selecting multiple items with optional search and select-all.

```dart
MultiSelectorDialogField(
  items: animals.map((animal) => MultiSelectorItem(value: animal, label: animal)).toList(),
  initialValue: _selectedAnimals,
  validator: (values) {
    if (values == null || values.isEmpty) {
      return "Please select at least one item";
    }
    return null;
  },
  autovalidateMode: AutovalidateMode.onUserInteraction,
  buttonText: const Text("Select Animals"),
  onConfirm: (values) {
    setState(() {
      _selectedAnimals = values;
    });
  },
  searchable: true,
  showSelectAll: true,
  fieldShape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(8),
    side: const BorderSide(color: Colors.grey),
  ),
),
```
### Validation and Submission

You can use a `GlobalKey<FormState>` to validate selections and trigger actions on submit:

```dart
final _formKey = GlobalKey<FormState>();

ElevatedButton(
  onPressed: () {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Selected Animals: $_selectedAnimals")),
      );
    }
  },
  child: const Text("Submit Form"),
),

```

## Contributing

Contributions and bug reports are welcome! Please open an issue or submit a pull request on the GitHub repository.


## References
I referred to the `multi_select_flutter` package for ideas and improved the implementation to better suit my needs.