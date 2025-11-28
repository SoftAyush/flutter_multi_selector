import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_multi_selector/DialogBox/multi_selector_dialog.dart';
import 'package:flutter_multi_selector/Utils/multi_selector_item.dart';

/// A FormField that displays a multi-select dialog for selecting multiple values.
///
/// The [MultiSelectorDialogField] widget provides a field that when tapped shows
/// a dialog with multiple items that can be selected. Selected items are displayed
/// as chips below the field.
///
/// Example:
/// ```dart
/// MultiSelectorDialogField<String>(
///   items: [
///     MultiSelectorItem("1", "Option 1"),
///     MultiSelectorItem("2", "Option 2"),
///   ],
///   onConfirm: (selected) => print(selected),
///   initialValue: ["1"],
/// )
/// ```
class MultiSelectorDialogField<V> extends FormField<List<V>> {
  /// List of items available for selection
  final List<MultiSelectorItem<V>> items;

  /// Callback when selection is confirmed
  final ValueChanged<List<V>> onConfirm;

  /// The list of selected values before interaction

  /// Title widget for the dialog
  final Widget? title;

  /// Text for the field button
  final Text? buttonText;

  /// Icon for the field button
  final Icon? buttonIcon;

  /// Input decoration for the field
  final InputDecoration? decoration;

  /// Whether the field should be dense
  final bool isDense;

  /// Color for selected items
  final Color? selectedColor;

  /// Whether the dialog should be searchable
  final bool searchable;

  /// Text for the confirm button
  final Text? confirmText;

  /// Text for the cancel button
  final Text? cancelText;

  /// Hint text for the search field
  final String? searchHint;

  /// Function to build custom color for each value
  final Color Function(V)? colorBuilder;

  /// Whether to separate selected items in the dialog
  final bool separateSelectedItems;

  /// Shape of the dialog
  final ShapeBorder? dialogShape;

  /// Shape of the field
  final ShapeBorder? fieldShape;

  /// Custom builder for the field button
  final Widget Function(BuildContext context)? buttonBuilder;

  /// Whether to show select all button
  final bool showSelectAll;

  /// Text for select all button
  final String? selectAllText;

  /// Text for deselect all button
  final String? deselectAllText;

  /// Height of the dialog
  final double? dialogHeight;

  /// Width of the dialog
  final double? dialogWidth;

  /// Color of the dialog barrier
  final Color? barrierColor;

  /// Background color of the dialog
  final Color? backgroundColor;

  /// Color for unselected items
  final Color? unselectedColor;

  /// Color of the checkmark
  final Color? checkColor;

  /// Text style for items
  final TextStyle? itemsTextStyle;

  /// Text style for selected items
  final TextStyle? selectedItemsTextStyle;

  /// Text style for search text
  final TextStyle? searchTextStyle;

  /// Text style for search hint
  final TextStyle? searchHintStyle;

  /// Icon for search field
  final Icon? searchIcon;

  /// Icon for closing search
  final Icon? closeSearchIcon;

  /// Elevation of the dialog
  final double dialogElevation;

  /// Padding for the dialog
  final EdgeInsets? dialogPadding;

  /// Callback when selection changes
  final ValueChanged<List<V>>? onSelectionChanged;

  /// Whether to use chips instead of checkboxes
  final bool useChipsForSelection;

  /// Whether the user can dismiss the dialog by tapping outside
  final bool isDismissible;

  /// Creates a [MultiSelectorDialogField]
  MultiSelectorDialogField({
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
    this.dialogShape,
    this.fieldShape,
    this.buttonBuilder,
    this.showSelectAll = false,
    this.selectAllText,
    this.deselectAllText,
    this.dialogHeight,
    this.dialogWidth,
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
    this.dialogElevation = 8.0,
    this.dialogPadding,
    this.onSelectionChanged,
    this.useChipsForSelection = false,
    this.isDismissible = true,
    super.onSaved,
    super.validator,
    super.autovalidateMode = AutovalidateMode.disabled,
  }) : super(
    initialValue: initialValue,
    builder: (FormFieldState<List<V>> state) {
      return _MultiSelectorDialogFieldView<V>(
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
        dialogShape: dialogShape,
        fieldShape: fieldShape,
        buttonBuilder: buttonBuilder,
        showSelectAll: showSelectAll,
        selectAllText: selectAllText,
        deselectAllText: deselectAllText,
        dialogHeight: dialogHeight,
        dialogWidth: dialogWidth,
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
        dialogElevation: dialogElevation,
        dialogPadding: dialogPadding,
        onSelectionChanged: onSelectionChanged,
        useChipsForSelection: useChipsForSelection,
        isDismissible: isDismissible,
      );
    },
  );
}

/// The private view class for [MultiSelectorDialogField]
class _MultiSelectorDialogFieldView<V> extends StatefulWidget {
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
  final ShapeBorder? dialogShape;
  final ShapeBorder? fieldShape;
  final Widget Function(BuildContext context)? buttonBuilder;
  final bool showSelectAll;
  final String? selectAllText;
  final String? deselectAllText;
  final double? dialogHeight;
  final double? dialogWidth;
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
  final double dialogElevation;
  final EdgeInsets? dialogPadding;
  final ValueChanged<List<V>>? onSelectionChanged;
  final bool useChipsForSelection;
  final bool isDismissible;

  const _MultiSelectorDialogFieldView({
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
    this.dialogShape,
    this.fieldShape,
    this.buttonBuilder,
    this.showSelectAll = false,
    this.selectAllText,
    this.deselectAllText,
    this.dialogHeight,
    this.dialogWidth,
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
    this.dialogElevation = 8.0,
    this.dialogPadding,
    this.onSelectionChanged,
    this.useChipsForSelection = false,
    this.isDismissible = true,
  });

  @override
  _MultiSelectorDialogFieldViewState<V> createState() =>
      _MultiSelectorDialogFieldViewState<V>();
}

class _MultiSelectorDialogFieldViewState<V>
    extends State<_MultiSelectorDialogFieldView<V>> {
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
  void didUpdateWidget(_MultiSelectorDialogFieldView<V> oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (!_listEquals(oldWidget.initialValue, widget.initialValue)) {
      _updateSelectedItems(List<V>.from(widget.initialValue));
    }
  }

  bool _listEquals(List<V>? a, List<V>? b) {
    final listEquals = ListEquality().equals;
    return listEquals(a, b);
  }

  void _updateSelectedItems(List<V> newItems) {
    if (_listEquals(_selectedItems, newItems)) return;
    setState(() => _selectedItems = List<V>.from(newItems));
    widget.state.didChange(_selectedItems);
    widget.onSelectionChanged?.call(_selectedItems);
  }

  void _handleItemSelection(MultiSelectorItem<V> item, bool checked) {
    final updated = List<V>.from(_selectedItems);
    checked ? updated.add(item.value) : updated.remove(item.value);
    _updateSelectedItems(updated);
    widget.onConfirm(updated);
  }

  Widget _buildChips() {
    final validItems =
    _selectedItems
        .map(
          (e) => widget.items.firstWhereOrNull((item) => item.value == e),
    )
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
                  Theme
                      .of(context)
                      .primaryColor;

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
            onDeleted: () => _handleItemSelection(item, false),
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
    
    // Check if validation was triggered (form.validate() was called)
    // This happens when hasError is true but we haven't validated yet
    // Determine if error should be shown based on AutovalidateMode
    final shouldShowError = widget.state.hasError;
    final isDense = widget.isDense;

    if (widget.buttonBuilder != null) {
      return widget.buttonBuilder!(context);
    }

    if (widget.decoration != null) {
      return GestureDetector(
        onTap: () => _showDialog(context),
        child: InputDecorator(
          decoration: widget.decoration!.copyWith(
            errorText: shouldShowError ? widget.state.errorText : null,
            errorStyle: shouldShowError ? widget.decoration?.errorStyle : null,
            contentPadding: isDense
                ? const EdgeInsets.symmetric(
                    vertical: 8.0,
                    horizontal: 12.0,
                  )
                : null,
            isDense: isDense,
            suffixIcon: widget.buttonIcon ?? const Icon(Icons.arrow_drop_down),
          ),
          isEmpty: widget.buttonText?.data == null ||
              widget.buttonText!.data!.isEmpty,
          child: InkWell(
            onTap: () => _showDialog(context),
            child: shouldShowError && widget.buttonText != null
                ? DefaultTextStyle(
                    style: (widget.decoration?.hintStyle ??
                            theme.textTheme.bodyMedium)!
                        .copyWith(
                      color: theme.colorScheme.error,
                    ),
                    child: widget.buttonText!,
                  )
                : widget.buttonText ??
                    Text(
                      '',
                      style: (widget.decoration?.hintStyle ??
                              theme.textTheme.bodyMedium)
                          ?.copyWith(
                        color: shouldShowError ? theme.colorScheme.error : null,
                      ),
                    ),
          ),
        ),
      );
    }

    final borderColor = shouldShowError
        ? theme.colorScheme.error
        : _selectedItems.isNotEmpty
            ? widget.selectedColor ?? theme.primaryColor
            : theme.dividerColor;

    final borderWidth = shouldShowError
        ? 1.5
        : _selectedItems.isNotEmpty
            ? 1.25
            : 1.0;

    return Material(
      shape: widget.fieldShape ??
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
            side: BorderSide(color: borderColor, width: borderWidth),
          ),
      color: theme.cardColor,
      child: InkWell(
        borderRadius:
            widget.fieldShape == null ? BorderRadius.circular(8) : null,
        onTap: () => _showDialog(context),
        child: Container(
          padding: isDense
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
                    color: shouldShowError
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

  Future<void> _showDialog(BuildContext ctx) async {
    if (!_hasInteracted) {
      setState(() {
        _hasInteracted = true;
      });
    }
    await showDialog(
      barrierColor: widget.barrierColor ?? Colors.black54,
      barrierDismissible: widget.isDismissible,
      context: context,
      builder: (ctx) {
        return MultiSelectorDialog<V>(
          items: widget.items,
          initialValue: _selectedItems,
          title: widget.title ?? Text(
            "Select an Item",
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
          dialogHeight: widget.dialogHeight,
          dialogWidth: widget.dialogWidth,
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
          elevation: widget.dialogElevation,
          shape: widget.dialogShape,
          contentPadding: widget.dialogPadding,
          showSelectAll: widget.showSelectAll,
          selectAllText: widget.selectAllText,
          deselectAllText: widget.deselectAllText,
          separateSelectedItems: widget.separateSelectedItems,
          useChipsForSelection: widget.useChipsForSelection,
          onConfirm: (selected) {
            _selectedItems = selected;
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
