# flutter_multi_selector

[![Pub Version](https://img.shields.io/pub/v/flutter_multi_selector.svg)](https://pub.dev/packages/flutter_multi_selector)  [![GitHub issues](https://img.shields.io/github/issues/SoftAyush/flutter_multi_selector.svg)](https://github.com/SoftAyush/flutter_multi_selector/issues)  [![GitHub stars](https://img.shields.io/github/stars/SoftAyush/flutter_multi_selector.svg?style=social)](https://github.com/SoftAyush/flutter_multi_selector/stargazers)  [![GitHub license](https://img.shields.io/github/license/SoftAyush/flutter_multi_selector.svg)](https://github.com/SoftAyush/flutter_multi_selector/blob/master/LICENSE)

It is a powerful Flutter package that provides an intuitive multi-selection
dialog with advanced customization options. Beyond standard features like search, select-all, and
checkbox/chip selection styles, it offers dynamic item separation—automatically grouping selected
items at the top for better visibility—and per-item theming, allowing different colors and styles
for each option. The widget supports responsive sizing, ensuring optimal display on any device, and
includes built-in accessibility for screen readers. With flexible callbacks and seamless state
management, it integrates effortlessly into any app, making it perfect for complex filtering,
preference selection, or multi-choice forms while maintaining a polished, user-friendly interface.

## Disclaimer

The `flutter_multi_selector` package only supports:
Dart SDK: `^3.7.0` (minimum required)
Flutter SDK: `>=3.27.0` (stable channel recommended)
This ensures compatibility with the latest Flutter features, performance improvements, and null
safety.
⚠ Older versions of Flutter/Dart are not supported.
📌 Upgrade your environment if needed to avoid conflicts.
For Flutter versions below 3.27.0, consider checking for legacy alternatives or updating your
project.

( Note: Package maintained for modern Flutter ecosystems only.)

## Features

- Custom multi-select dialog field widget
- Supports form validation with error messages
- Searchable list of selectable items
- Select All / Deselect All functionality
- Initial value support for pre-selected items
- Customizable button text and field styling

### MultiSelectorDialogField

This widget shows a button that opens a multi-select dialog. It integrates with Flutter forms and
allows selecting multiple items with optional search and select-all.

```dart
MultiSelectorDialogField(
  // Use the new simplified constructor
  items: animals
      .map((animal) => MultiSelectorItem(animal, animal))
      .toList(),
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
  // New in v1.1.0: Control dialog dismissal
  isDismissible: true,
  fieldShape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(8),
    side: const BorderSide(color: Colors.grey),
  ),
)
```

### New in v1.1.0

- **Simplified API**: `MultiSelectorItem` now supports positional arguments: `MultiSelectorItem(value, label)`.
- **Dialog Control**: Added `isDismissible` parameter to `MultiSelectorDialogField` to control whether the dialog can be dismissed by tapping outside.
- **Enhanced Item Handling**: `MultiSelectorItem` now includes `copyWith`, equality operators, and better `toString` support.

### Validation and Submission

You can use a `GlobalKey<FormState>` to validate selections and trigger actions on submit:

```
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
)

```

## 📚 Use Cases

flutter_multi_selector is ideal for:
Multi-choice filtering (e.g., categories, tags, preferences)
Collecting multiple inputs in forms
Feature toggles and app settings
Surveys or polls with many options
It supports chip or checkbox layouts, item theming, and dynamic reordering (selected items shown at
the top).

## 🤝 Contributing

Contributions are welcome!
Please submit issues or PRs on the GitHub repository.

## 📖 Inspiration

This package was inspired by `multi_select_flutter` and was enhanced to offer greater flexibility,
cleaner UI, and better developer ergonomics.