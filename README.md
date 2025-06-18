# flutter_multi_selector

It is a powerful Flutter package that provides an intuitive multi-selection
dialog with advanced customization options. Beyond standard features like search, select-all, and
checkbox/chip selection styles, it offers dynamic item separation—automatically grouping selected
items at the top for better visibility—and per-item theming, allowing different colors and styles
for each option. The widget supports responsive sizing, ensuring optimal display on any device, and
includes built-in accessibility for screen readers. With flexible callbacks and seamless state
management, it integrates effortlessly into any app, making it perfect for complex filtering,
preference selection, or multi-choice forms while maintaining a polished, user-friendly interface.

### Disclaimer

The `flutter_multi_selector` package only supports:

Dart SDK: `^3.7.0` (minimum required)

Flutter SDK: `>=3.27.0` (stable channel recommended)

This ensures compatibility with the latest Flutter features, performance improvements, and null safety.

⚠ Older versions of Flutter/Dart are not supported.
📌 Upgrade your environment if needed to avoid conflicts.

For Flutter versions below 3.27.0, consider checking for legacy alternatives or updating your project.

(Package maintained for modern Flutter ecosystems only.)

## Features

- Custom multi-select dialog field widget
- Supports form validation with error messages
- Searchable list of selectable items
- Select All / Deselect All functionality
- Initial value support for pre-selected items
- Customizable button text and field styling

## Usage

### MultiSelectorDialogField

This widget shows a button that opens a multi-select dialog. It integrates with Flutter forms and
allows selecting multiple items with optional search and select-all.

```dart
MultiSelectorDialogField
(
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
side: const BorderSide(color: Colors.
grey
)
,
)
,
)
,
```

### Validation and Submission

You can use a `GlobalKey<FormState>` to validate selections and trigger actions on submit:

```dart

final _formKey = GlobalKey<FormState>();

ElevatedButton
(
onPressed: () {
if (_formKey.currentState!.validate()) {
ScaffoldMessenger.of(context).showSnackBar(
SnackBar(content: Text("Selected Animals: $_selectedAnimals")),
);
}
},
child: const Text("Submit Form"),
)
,

```

## Contributing

Contributions and bug reports are welcome! Please open an issue or submit a pull request on the
GitHub repository.

## References

I referred to the `multi_select_flutter` package for ideas and improved the implementation to better
suit my needs.