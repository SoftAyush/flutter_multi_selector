import 'package:flutter/material.dart';
import 'package:flutter_multi_selector/Utils/multi_selector_item.dart';

/// Controller to manage the state of [MultiSelectorDialog].
class MultiSelectorController<T> extends ChangeNotifier {
  final List<MultiSelectorItem<T>> _allItems;
  final Set<T> _selectedValues;
  String _searchQuery = '';
  bool _isSearching = false;
  List<MultiSelectorItem<T>> _filteredItems = [];
  final bool _separateSelectedItems;

  MultiSelectorController({
    required List<MultiSelectorItem<T>> items,
    required List<T> initialSelectedValues,
    bool separateSelectedItems = false,
  })  : _allItems = items,
        _selectedValues = Set<T>.from(initialSelectedValues),
        _separateSelectedItems = separateSelectedItems {
    _updateFilteredItems();
  }

  /// Returns the list of items to display (filtered and sorted).
  List<MultiSelectorItem<T>> get items => _filteredItems;

  /// Returns the current list of selected values.
  List<T> get selectedValues => _selectedValues.toList();

  /// Returns true if search mode is active.
  bool get isSearching => _isSearching;

  /// Returns true if all items are currently selected.
  bool get isAllSelected {
    final itemsToCheck = _isSearching ? _filteredItems : _allItems;
    if (itemsToCheck.isEmpty) return false;
    return itemsToCheck.every((item) => _selectedValues.contains(item.value));
  }

  /// Toggles the selection state of an item.
  void toggleSelection(T value) {
    if (_selectedValues.contains(value)) {
      _selectedValues.remove(value);
    } else {
      _selectedValues.add(value);
    }
    _updateFilteredItems();
    notifyListeners();
  }

  /// Selects all items.
  void selectAll() {
    final itemsToSelect = _isSearching ? _filteredItems : _allItems;
    for (var item in itemsToSelect) {
      _selectedValues.add(item.value);
    }
    _updateFilteredItems();
    notifyListeners();
  }

  /// Deselects all items.
  void deselectAll() {
    if (_isSearching) {
      for (var item in _filteredItems) {
        _selectedValues.remove(item.value);
      }
    } else {
      _selectedValues.clear();
    }
    _updateFilteredItems();
    notifyListeners();
  }

  /// Toggles search mode.
  void toggleSearch() {
    _isSearching = !_isSearching;
    if (!_isSearching) {
      _searchQuery = '';
      _updateFilteredItems();
    }
    notifyListeners();
  }

  /// Updates the search query.
  void updateSearchQuery(String query) {
    _searchQuery = query;
    _updateFilteredItems();
    notifyListeners();
  }

  /// Updates the internal list of filtered items based on search and separation logic.
  void _updateFilteredItems() {
    // 1. Filter by search query
    List<MultiSelectorItem<T>> tempItems;
    if (_searchQuery.isEmpty) {
      tempItems = List.from(_allItems);
    } else {
      final query = _searchQuery.toLowerCase();
      tempItems = _allItems.where((item) {
        return item.label.toLowerCase().contains(query);
      }).toList();
    }

    // 2. Update 'selected' property on items for UI binding
    // Note: This mutates the items. Ideally items should be immutable, but for now we follow existing pattern
    // or we create new instances. Creating new instances is safer but might be more expensive.
    // Given the existing code mutated items, we will sync the 'selected' property.
    for (var item in tempItems) {
      item.selected = _selectedValues.contains(item.value);
    }

    // 3. Separate selected items if enabled
    if (_separateSelectedItems) {
      final selected = <MultiSelectorItem<T>>[];
      final unselected = <MultiSelectorItem<T>>[];

      for (var item in tempItems) {
        if (_selectedValues.contains(item.value)) {
          selected.add(item);
        } else {
          unselected.add(item);
        }
      }
      
      // Sort alphabetically (as per original logic)
      selected.sort((a, b) => a.label.compareTo(b.label));
      unselected.sort((a, b) => a.label.compareTo(b.label));

      _filteredItems = [...selected, ...unselected];
    } else {
      _filteredItems = tempItems;
    }
  }
}
