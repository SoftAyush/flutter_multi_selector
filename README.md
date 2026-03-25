<div align="center">
  <img src="https://raw.githubusercontent.com/SoftAyush/flutter_multi_selector/master/docs/img/dialog_list.jpeg" width="160" />
  <h1>Flutter Multi Selector</h1>
  <p>A powerful, flexible, and premium multi-selection package for Flutter.</p>

[![Pub Version](https://img.shields.io/pub/v/flutter_multi_selector.svg)](https://pub.dev/packages/flutter_multi_selector)
[![GitHub issues](https://img.shields.io/github/issues/SoftAyush/flutter_multi_selector.svg)](https://github.com/SoftAyush/flutter_multi_selector/issues)
[![GitHub stars](https://img.shields.io/github/stars/SoftAyush/flutter_multi_selector.svg?style=social)](https://github.com/SoftAyush/flutter_multi_selector/stargazers)
[![GitHub license](https://img.shields.io/github/license/SoftAyush/flutter_multi_selector.svg)](https://github.com/SoftAyush/flutter_multi_selector/blob/master/LICENSE)

</div>

---

`flutter_multi_selector` makes multi-item selection in Flutter intuitive and beautiful. Whether you need a simple list in a dialog or a modern, searchable bottom sheet, this package provides everything you need with a premium feel and developer-friendly API.

## 🌟 Beginner's Guide: Your First Widget

New to Flutter? No problem! Follow these 3 simple steps to add multi-selection to your app.

### 1. Installation
Add the package to your `pubspec.yaml` file:

```yaml
dependencies:
  flutter_multi_selector: ^1.2.0+1
```
Then run `flutter pub get` in your terminal.

### 2. Prepare Your Data
The package uses `MultiSelectorItem` to represent each option. It needs a **Value** (what your code uses) and a **Label** (what the user sees).

```dart
// A simple list of fruits
final fruits = ["Apple", "Banana", "Cherry", "Date"];

// Convert them to MultiSelectorItems
final items = fruits.map((fruit) => MultiSelectorItem(fruit, fruit)).toList();
```

### 3. Add the Widget
Place the `MultiSelectorDialogField` in your widget tree:

```dart
List<String> _selectedFruits = [];

MultiSelectorDialogField<String>(
  items: items,
  title: const Text("Select Your Favorites"),
  onConfirm: (values) {
    setState(() {
      _selectedFruits = values;
    });
  },
)
```

---

## 🏗️ Core Concepts

### 📊 Understanding MultiSelectorItem<T>
The generic type `<T>` allows you to use any data type as the value (Strings, Integers, or even custom Objects).

```dart
// Using Integers as values
MultiSelectorItem<int>(1, "Option One")

// Using custom Objects as values
MultiSelectorItem<User>(userObj, userObj.name)
```

### 🏠 Presentation Styles
Choose the style that fits your app's UX:
- **`MultiSelectorDialogField`**: A focused centered dialog. Best for larger screens or complex selections.
- **`MultiSelectorBottomSheetField`**: A modern slide-up panel. Best for mobile-first apps and quick interactions.

---

## ✨ Key Features

*   🎨 **Fully Customizable**: Control colors, typography, shapes, and animations.
*   🔍 **Smart Search bar**: Filter through large lists instantly as you type.
*   ✅ **Bulk Selection**: Native support for "Select All" and "Clear All".
*   🗂️ **Selected Branding**: Optionally group selected items at the top.
*   📝 **Form Integration**: Built-in validation works perfectly with Flutter `Form` widgets.

---

## 🎨 Advanced Usage & Recipes

### Form Validation
Make sure the user selects at least one item before submitting:

```dart
MultiSelectorDialogField<String>(
  items: items,
  validator: (values) {
    if (values == null || values.isEmpty) return "Please select at least one item";
    return null;
  },
  autovalidateMode: AutovalidateMode.onUserInteraction,
  onConfirm: (values) => print("Confirmed: $values"),
)
```

### Custom Styling
Match your app's theme perfectly:

```dart
MultiSelectorDialogField<String>(
  items: items,
  selectedColor: Colors.deepPurple,
  checkColor: Colors.white,
  fieldShape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(15),
    side: const BorderSide(color: Colors.deepPurple, width: 2),
  ),
)
```

---

## 📱 Showcase Gallery

| Dialog Style | Bottom Sheet Style |
| :---: | :---: |
| ![Dialog List](https://raw.githubusercontent.com/SoftAyush/flutter_multi_selector/master/docs/img/dialog_list.jpeg) | ![BottomSheet List](https://raw.githubusercontent.com/SoftAyush/flutter_multi_selector/master/docs/img/bottomsheet_list.jpeg) |
| ![Dialog Chip](https://raw.githubusercontent.com/SoftAyush/flutter_multi_selector/master/docs/img/dialog_chip.jpeg) | ![BottomSheet Chip](https://raw.githubusercontent.com/SoftAyush/flutter_multi_selector/master/docs/img/bottomsheet_chip.jpeg) |

---

## 🛠 Supported Platforms

| Android | iOS | Web | Windows | macOS | Linux |
| :---: | :---: | :---: | :---: | :---: | :---: |
| ✅ | ✅ | ✅ | ✅ | ✅ | ✅ |

---

## 🤝 Contributing & Feedback

We love contributions! If you have a feature request or found a bug, please let us know:
- **Issues**: [GitHub Issues](https://github.com/SoftAyush/flutter_multi_selector/issues)
- **PRs**: [GitHub Pull Requests](https://github.com/SoftAyush/flutter_multi_selector/pulls)

Made with ❤️ for the Flutter community.