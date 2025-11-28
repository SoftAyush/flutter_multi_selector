import 'package:flutter/material.dart';
import 'package:flutter_multi_selector/Utils/multi_selector_item.dart';

/// A mixin that provides core functionality for multi-selection dialogs.
///
/// Contains methods for:
/// - Managing item selection state
/// - Handling dialog confirmation/cancellation
/// - Filtering items via search
/// - Organizing selected/unslected items
///
/// Used by [MultiSelectorDialog] to handle business logic.
/// {@category Utilities}
mixin MultiSelectorActions<T> {
  /// Handles changes to an item's selection state.
  ///
  /// Parameters:
  /// - [selectedValues]: Current list of selected values
  /// - [value]: The value being toggled
  /// - [checked]: New selection state (true = selected, false = unselected)
  ///
  /// Returns:
  /// A new list with updated selection state
  ///
  /// Example:
  /// ```dart
  /// final newValues = onItemCheckedChange([1,2], 3, true);
  /// // Returns [1, 2, 3]
  /// ```
  List<T> onItemCheckedChange(List<T> selectedValues, T value, bool checked) {
    final newValues = List<T>.from(selectedValues);
    if (checked) {
      if (!newValues.contains(value)) {
        newValues.add(value);
      }
    } else {
      newValues.remove(value);
    }
    return newValues;
  }

  /// Handles dialog cancellation, reverting to initial values.
  ///
  /// Parameters:
  /// - [context]: BuildContext for navigation
  /// - [initialValue]: Original values before any changes
  ///
  /// Pops the dialog and returns [initialValue]
  void onCancelTap(BuildContext context, List<T> initialValue) {
    Navigator.of(context).pop(initialValue);
  }

  /// Handles dialog confirmation, returning selected values.
  ///
  /// Parameters:
  /// - [context]: BuildContext for navigation
  /// - [selectedValues]: Currently selected values
  /// - [onConfirm]: Optional callback with selected values
  ///
  /// Pops the dialog and:
  /// 1. Returns [selectedValues] via Navigator
  /// 2. Invokes [onConfirm] callback if provided
  void onConfirmTap(BuildContext context, List<T> selectedValues, void Function(List<T>)? onConfirm) {
    Navigator.of(context).pop(selectedValues);
    onConfirm?.call(selectedValues);
  }

  /// Filters items based on search query.
  ///
  /// Parameters:
  /// - [val]: Search query string (null or empty returns all items)
  /// - [allItems]: Complete list of items to filter
  ///
  /// Returns:
  /// List of items where label contains query (case-insensitive)
  List<MultiSelectorItem<T>> updateSearchQuery(
      String? val, List<MultiSelectorItem<T>> allItems) {
    if (val != null && val.trim().isNotEmpty) {
      List<MultiSelectorItem<T>> filteredItems = [];
      for (var item in allItems) {
        if (item.label.toLowerCase().contains(val.toLowerCase())) {
          filteredItems.add(item);
        }
      }
      return filteredItems;
    } else {
      return allItems;
    }
  }

  /// Toggles search visibility state.
  ///
  /// Parameters:
  /// - [showSearch]: Current search visibility state
  ///
  /// Returns:
  /// The inverted state (!showSearch)
  bool onSearchTap(bool showSearch) {
    return !showSearch;
  }

  /// Organizes items into selected/unselected groups.
  ///
  /// Parameters:
  /// - [list]: Original mixed list of items
  ///
  /// Returns:
  /// New list with:
  /// 1. Selected items (sorted alphabetically)
  /// 2. Unselected items (sorted alphabetically)
  ///
  /// {@template separator}
  /// Note: Maintains separate lists but combines them in final output
  /// {@endtemplate}
  List<MultiSelectorItem<T>> separateSelected(List<MultiSelectorItem<T>> list) {
    List<MultiSelectorItem<T>> selectedItems = [];
    List<MultiSelectorItem<T>> nonSelectedItems = [];

    nonSelectedItems.addAll(list.where((element) => !element.selected));
    nonSelectedItems.sort((a, b) => a.label.compareTo(b.label));
    selectedItems.addAll(list.where((element) => element.selected));
    selectedItems.sort((a, b) => a.label.compareTo(b.label));

    return [...selectedItems, ...nonSelectedItems];
  }
}