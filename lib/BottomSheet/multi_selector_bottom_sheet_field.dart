/// FormField implementation for the multi-selection bottom sheet.
library;

import 'package:flutter/foundation.dart';

import 'package:flutter/material.dart';
import 'package:flutter_multi_selector/BottomSheet/multi_selector_bottom_sheet.dart';
import 'package:flutter_multi_selector/Utils/multi_selector_item.dart';

/// A FormField that displays a multi-select bottom sheet for selecting multiple values.
///
/// The [MultiSelectorBottomSheetField] widget provides a field that when tapped
/// shows a bottom sheet with multiple items that can be selected. Selected items
/// are displayed as chips below the field.
///
/// ## Example
/// ```dart
/// MultiSelectorBottomSheetField<String>(
///   items: [
///     MultiSelectorItem("1", "Option 1"),
///     MultiSelectorItem("2", "Option 2"),
///   ],
///   onConfirm: (selected) => print(selected),
///   initialValue: ["1"],
///   searchable: true,
///   showSelectAll: true,
/// )
/// ```
class MultiSelectorBottomSheetField<V> extends FormField<List<V>> {
  /// List of items available for selection.
  final List<MultiSelectorItem<V>> items;

  /// Callback when selection is confirmed.
  final ValueChanged<List<V>> onConfirm;

  /// Title widget for the bottom sheet.
  final Widget? title;

  /// Text for the field button.
  final Text? buttonText;

  /// Icon for the field button.
  final Icon? buttonIcon;

  /// Input decoration for the field.
  final InputDecoration? decoration;

  /// Whether the field should be dense.
  final bool isDense;

  /// Color for selected items.
  final Color? selectedColor;

  /// Whether the bottom sheet should be searchable.
  final bool searchable;

  /// Text for the confirm button.
  final Text? confirmText;

  /// Text for the cancel button.
  final Text? cancelText;

  /// Hint text for the search field.
  final String? searchHint;

  /// Function to build custom color for each value.
  final Color Function(V)? colorBuilder;

  /// Whether to separate selected items in the bottom sheet.
  final bool separateSelectedItems;

  /// Shape of the field.
  final ShapeBorder? fieldShape;

  /// Custom builder for the field button.
  final Widget Function(BuildContext context)? buttonBuilder;

  /// Whether to show select all button.
  final bool showSelectAll;

  /// Text for select all button.
  final String? selectAllText;

  /// Text for clear all button.
  final String? clearAllText;

  /// Height fraction (0.0 to 1.0) for the bottom sheet.
  final double? heightFraction;

  /// Color of the bottom sheet barrier.
  final Color? barrierColor;

  /// Background color of the bottom sheet.
  final Color? backgroundColor;

  /// Color for unselected items.
  final Color? unselectedColor;

  /// Color of the checkmark.
  final Color? checkColor;

  /// Text style for items.
  final TextStyle? itemsTextStyle;

  /// Text style for selected items.
  final TextStyle? selectedItemsTextStyle;

  /// Text style for search text.
  final TextStyle? searchTextStyle;

  /// Text style for search hint.
  final TextStyle? searchHintStyle;

  /// Icon for search field.
  final Icon? searchIcon;

  /// Icon for closing search.
  final Icon? closeSearchIcon;

  /// Callback when selection changes.
  final ValueChanged<List<V>>? onSelectionChanged;

  /// Whether to use chips instead of checkboxes.
  final bool useChipsForSelection;

  /// Whether the user can dismiss the bottom sheet by tapping outside.
  final bool isDismissible;

  /// Whether the user can drag to dismiss the bottom sheet.
  final bool enableDrag;

  /// Whether to show drag handle.
  final bool showDragHandle;

  /// Creates a [MultiSelectorBottomSheetField].
  MultiSelectorBottomSheetField({
    super.key,
    required this.items,
    required this.onConfirm,
    this.title,
    this.buttonText,
    this.buttonIcon,
    this.decoration,
    this.isDense = false,
    this.selectedColor,
    this.searchable = false,
    this.confirmText,
    this.cancelText,
    this.searchHint,
    this.colorBuilder,
    List<V> initialValue = const [],
    this.separateSelectedItems = false,
    this.fieldShape,
    this.buttonBuilder,
    this.showSelectAll = false,
    this.selectAllText,
    this.clearAllText,
    this.heightFraction,
    this.barrierColor,
    this.backgroundColor,
    this.unselectedColor,
    this.checkColor,
    this.itemsTextStyle,
    this.selectedItemsTextStyle,
    this.searchTextStyle,
    this.searchHintStyle,
    this.searchIcon,
    this.closeSearchIcon,
    this.onSelectionChanged,
    this.useChipsForSelection = false,
    this.isDismissible = true,
    this.enableDrag = true,
    this.showDragHandle = true,
    super.onSaved,
    super.validator,
    super.autovalidateMode = AutovalidateMode.disabled,
  }) : super(
         initialValue: initialValue,
         builder: (FormFieldState<List<V>> state) {
           return _MultiSelectorBottomSheetFieldView<V>(
             state: state,
             items: items,
             onConfirm: onConfirm,
             title: title,
             buttonText: buttonText,
             buttonIcon: buttonIcon,
             decoration: decoration,
             isDense: isDense,
             initialValue: initialValue,
             selectedColor: selectedColor,
             searchable: searchable,
             confirmText: confirmText,
             cancelText: cancelText,
             searchHint: searchHint,
             colorBuilder: colorBuilder,
             separateSelectedItems: separateSelectedItems,
             fieldShape: fieldShape,
             buttonBuilder: buttonBuilder,
             showSelectAll: showSelectAll,
             selectAllText: selectAllText,
             clearAllText: clearAllText,
             heightFraction: heightFraction,
             barrierColor: barrierColor,
             backgroundColor: backgroundColor,
             unselectedColor: unselectedColor,
             checkColor: checkColor,
             itemsTextStyle: itemsTextStyle,
             selectedItemsTextStyle: selectedItemsTextStyle,
             searchTextStyle: searchTextStyle,
             searchHintStyle: searchHintStyle,
             searchIcon: searchIcon,
             closeSearchIcon: closeSearchIcon,
             onSelectionChanged: onSelectionChanged,
             useChipsForSelection: useChipsForSelection,
             isDismissible: isDismissible,
             enableDrag: enableDrag,
             showDragHandle: showDragHandle,
           );
         },
       );
}

/// The private view class for [MultiSelectorBottomSheetField].
class _MultiSelectorBottomSheetFieldView<V> extends StatefulWidget {
  final FormFieldState<List<V>> state;
  final List<MultiSelectorItem<V>> items;
  final ValueChanged<List<V>> onConfirm;
  final List<V> initialValue;
  final Widget? title;
  final Text? buttonText;
  final Icon? buttonIcon;
  final InputDecoration? decoration;
  final bool isDense;
  final Color? selectedColor;
  final bool searchable;
  final Text? confirmText;
  final Text? cancelText;
  final String? searchHint;
  final Color Function(V)? colorBuilder;
  final bool separateSelectedItems;
  final ShapeBorder? fieldShape;
  final Widget Function(BuildContext context)? buttonBuilder;
  final bool showSelectAll;
  final String? selectAllText;
  final String? clearAllText;
  final double? heightFraction;
  final Color? barrierColor;
  final Color? backgroundColor;
  final Color? unselectedColor;
  final Color? checkColor;
  final TextStyle? itemsTextStyle;
  final TextStyle? selectedItemsTextStyle;
  final TextStyle? searchTextStyle;
  final TextStyle? searchHintStyle;
  final Icon? searchIcon;
  final Icon? closeSearchIcon;
  final ValueChanged<List<V>>? onSelectionChanged;
  final bool useChipsForSelection;
  final bool isDismissible;
  final bool enableDrag;
  final bool showDragHandle;

  const _MultiSelectorBottomSheetFieldView({
    required this.state,
    required this.items,
    required this.onConfirm,
    this.initialValue = const [],
    this.title,
    this.buttonText,
    this.buttonIcon,
    this.decoration,
    this.isDense = false,
    this.selectedColor,
    this.searchable = false,
    this.confirmText,
    this.cancelText,
    this.searchHint,
    this.colorBuilder,
    this.separateSelectedItems = false,
    this.fieldShape,
    this.buttonBuilder,
    this.showSelectAll = false,
    this.selectAllText,
    this.clearAllText,
    this.heightFraction,
    this.barrierColor,
    this.backgroundColor,
    this.unselectedColor,
    this.checkColor,
    this.itemsTextStyle,
    this.selectedItemsTextStyle,
    this.searchTextStyle,
    this.searchHintStyle,
    this.searchIcon,
    this.closeSearchIcon,
    this.onSelectionChanged,
    this.useChipsForSelection = false,
    this.isDismissible = true,
    this.enableDrag = true,
    this.showDragHandle = true,
  });

  @override
  _MultiSelectorBottomSheetFieldViewState<V> createState() =>
      _MultiSelectorBottomSheetFieldViewState<V>();
}

class _MultiSelectorBottomSheetFieldViewState<V>
    extends State<_MultiSelectorBottomSheetFieldView<V>> {
  late List<V> _selectedItems;
  bool _hasInteracted = false;

  @override
  void initState() {
    super.initState();
    _selectedItems = List<V>.from(
      widget.initialValue.isNotEmpty
          ? widget.initialValue
          : widget.state.value ?? [],
    );
  }

  @override
  void didUpdateWidget(_MultiSelectorBottomSheetFieldView<V> oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (!listEquals(oldWidget.initialValue, widget.initialValue)) {
      _updateSelectedItems(List<V>.from(widget.initialValue));
    }
  }

  void _updateSelectedItems(List<V> newItems) {
    if (listEquals(_selectedItems, newItems)) return;
    setState(() => _selectedItems = List<V>.from(newItems));
    widget.state.didChange(_selectedItems);
    widget.onSelectionChanged?.call(_selectedItems);
  }

  void _handleItemRemoval(MultiSelectorItem<V> item) {
    final updated = List<V>.from(_selectedItems)..remove(item.value);
    _updateSelectedItems(updated);
    widget.onConfirm(updated);
  }

  MultiSelectorItem<V>? _findItem(V value) {
    for (final item in widget.items) {
      if (item.value == value) return item;
    }
    return null;
  }

  Widget _buildChips() {
    final validItems =
        _selectedItems
            .map(_findItem)
            .whereType<MultiSelectorItem<V>>()
            .toList();

    if (validItems.isEmpty) return const SizedBox.shrink();

    return Padding(
      padding: const EdgeInsets.only(top: 4.0),
      child: Wrap(
        spacing: 4.0,
        runSpacing: 4.0,
        children:
            validItems.map((item) {
              final color =
                  widget.colorBuilder?.call(item.value) ??
                  widget.selectedColor ??
                  Theme.of(context).primaryColor;

              return Chip(
                label: Text(
                  item.label,
                  style:
                      widget.selectedItemsTextStyle?.copyWith(color: color) ??
                      TextStyle(color: color),
                ),
                backgroundColor: color.withAlpha(13),
                side: BorderSide(color: color),
                deleteIcon: Icon(Icons.close, size: 16, color: color),
                onDeleted: () => _handleItemRemoval(item),
                shape:
                    widget.fieldShape as OutlinedBorder? ??
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6),
                    ),
                visualDensity: VisualDensity.compact,
              );
            }).toList(),
      ),
    );
  }

  Widget _buildFieldButton(BuildContext context) {
    final theme = Theme.of(context);
    final shouldShowError = widget.state.hasError;
    final isDense = widget.isDense;

    if (widget.buttonBuilder != null) {
      return widget.buttonBuilder!(context);
    }

    if (widget.decoration != null) {
      return GestureDetector(
        onTap: () => _showBottomSheet(context),
        child: InputDecorator(
          decoration: widget.decoration!.copyWith(
            errorText: shouldShowError ? widget.state.errorText : null,
            errorStyle: shouldShowError ? widget.decoration?.errorStyle : null,
            contentPadding:
                isDense
                    ? const EdgeInsets.symmetric(
                      vertical: 8.0,
                      horizontal: 12.0,
                    )
                    : null,
            isDense: isDense,
            suffixIcon: widget.buttonIcon ?? const Icon(Icons.arrow_drop_down),
          ),
          isEmpty:
              widget.buttonText?.data == null ||
              widget.buttonText!.data!.isEmpty,
          child: InkWell(
            onTap: () => _showBottomSheet(context),
            child:
                shouldShowError && widget.buttonText != null
                    ? DefaultTextStyle(
                      style: (widget.decoration?.hintStyle ??
                              theme.textTheme.bodyMedium)!
                          .copyWith(color: theme.colorScheme.error),
                      child: widget.buttonText!,
                    )
                    : widget.buttonText ??
                        Text(
                          '',
                          style: (widget.decoration?.hintStyle ??
                                  theme.textTheme.bodyMedium)
                              ?.copyWith(
                                color:
                                    shouldShowError
                                        ? theme.colorScheme.error
                                        : null,
                              ),
                        ),
          ),
        ),
      );
    }

    final borderColor =
        shouldShowError
            ? theme.colorScheme.error
            : _selectedItems.isNotEmpty
            ? widget.selectedColor ?? theme.primaryColor
            : theme.dividerColor;

    final borderWidth =
        shouldShowError
            ? 1.5
            : _selectedItems.isNotEmpty
            ? 1.25
            : 1.0;

    return Material(
      shape:
          widget.fieldShape ??
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
            side: BorderSide(color: borderColor, width: borderWidth),
          ),
      color: theme.cardColor,
      child: InkWell(
        borderRadius:
            widget.fieldShape == null ? BorderRadius.circular(8) : null,
        onTap: () => _showBottomSheet(context),
        child: Container(
          padding:
              isDense
                  ? const EdgeInsets.symmetric(horizontal: 12, vertical: 8)
                  : const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              shouldShowError && widget.buttonText != null
                  ? DefaultTextStyle(
                    style: (theme.textTheme.bodyMedium)!.copyWith(
                      color: theme.colorScheme.error,
                    ),
                    child: widget.buttonText!,
                  )
                  : widget.buttonText ??
                      Text(
                        'Select',
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color:
                              shouldShowError ? theme.colorScheme.error : null,
                        ),
                      ),
              widget.buttonIcon ??
                  Icon(
                    Icons.arrow_drop_down,
                    color:
                        shouldShowError
                            ? theme.colorScheme.error
                            : theme.iconTheme.color,
                    size: isDense ? 20 : 24,
                  ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _showBottomSheet(BuildContext ctx) async {
    if (!_hasInteracted) {
      setState(() {
        _hasInteracted = true;
      });
    }

    await showModalBottomSheet<List<V>>(
      context: context,
      isScrollControlled: true,
      isDismissible: widget.isDismissible,
      enableDrag: widget.enableDrag,
      barrierColor: widget.barrierColor ?? Colors.black54,
      backgroundColor: Colors.transparent,
      builder: (ctx) {
        return MultiSelectorBottomSheet<V>(
          items: widget.items,
          initialValue: _selectedItems,
          title:
              widget.title ??
              Text(
                "Select Items",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
          searchable: widget.searchable,
          confirmText: widget.confirmText,
          cancelText: widget.cancelText,
          selectedColor: widget.selectedColor,
          heightFraction: widget.heightFraction,
          searchHint: widget.searchHint,
          colorBuilder: widget.colorBuilder,
          backgroundColor: widget.backgroundColor,
          unselectedColor: widget.unselectedColor,
          searchIcon: widget.searchIcon,
          closeSearchIcon: widget.closeSearchIcon,
          itemsTextStyle: widget.itemsTextStyle,
          selectedItemsTextStyle: widget.selectedItemsTextStyle,
          searchTextStyle: widget.searchTextStyle,
          searchHintStyle: widget.searchHintStyle,
          checkColor: widget.checkColor,
          showSelectAll: widget.showSelectAll,
          selectAllText: widget.selectAllText,
          clearAllText: widget.clearAllText,
          separateSelectedItems: widget.separateSelectedItems,
          useChipsForSelection: widget.useChipsForSelection,
          showDragHandle: widget.showDragHandle,
          onConfirm: (selected) {
            setState(() {
              _selectedItems = selected;
            });
            widget.state.didChange(_selectedItems);
            widget.onConfirm(_selectedItems);
            if (_hasInteracted) {
              widget.state.validate();
            }
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [_buildFieldButton(context), _buildChips()],
    );
  }
}
