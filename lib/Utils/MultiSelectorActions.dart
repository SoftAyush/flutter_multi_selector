import 'package:flutter/material.dart';
import 'package:flutter_multi_selector/Utils/MultiSelectorItem.dart';

mixin MultiSelectorActions<T> {

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

  void onCancelTap(BuildContext context, List<T> initialValue) {
    Navigator.of(context).pop(initialValue);
  }

  void onConfirmTap(BuildContext context, List<T> selectedValues, void Function(List<T>)? onConfirm) {
    Navigator.of(context).pop(selectedValues);
    onConfirm?.call(selectedValues);
  }

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

  bool onSearchTap(bool showSearch) {
    return !showSearch;
  }

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
