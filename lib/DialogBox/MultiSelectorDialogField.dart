import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_multi_selector/DialogBox/MultiSelectorDialog.dart';
import 'package:flutter_multi_selector/Utils/MultiSelectorItem.dart';

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
  final List<V> initialValue;

  /// Title widget for the dialog
  final Widget? title;

  /// Text for the field button
  final Text? buttonText;

  /// Icon for the field button
  final Icon? buttonIcon;

  /// Input decoration for the field
  final InputDecoration? decoration;

  // /// Box decoration for the field
  // final BoxDecoration? boxDecoration;

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

  // /// Whether to separate selected items in the dialog
  // final bool separateSelectedItems;

  // /// Duration for animations
  // final Duration animationDuration;

  /// Shape of the dialog
  final ShapeBorder? dialogShape;

  /// Shape of the field
  final ShapeBorder? fieldShape;

  /// Custom builder for the field button
  final Widget Function(BuildContext context)? buttonBuilder;

  // /// Custom builder for the dialog container
  // final Widget Function(BuildContext context, Widget child)? dialogBuilder;

  // /// Whether to show clear all button
  // final bool showClearAll;

  // /// Text for clear all button
  // final Text? clearAllText;

  // /// Icon for clear all button
  // final Icon? clearAllIcon;
  //
  // /// Callback when clear all is pressed
  // final VoidCallback? onClearAll;

  /// Whether to show select all button
  final bool showSelectAll;

  /// Text for select all button
  final String? selectAllText;

  /// Text for deselect all button
  final String? deselectAllText;

  // /// Icon for select all button
  // final Icon? selectAllIcon;

  // /// Callback when select all is pressed
  // final VoidCallback? onSelectAll;

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

  // /// Whether to show dividers between items
  // final bool showItemsDivider;

  // /// Color of the divider between items
  // final Color? dividerColor;

  // /// Border radius of the dialog
  // final BorderRadius? dialogBorderRadius;

  /// Elevation of the dialog
  final double dialogElevation;

  /// Padding for the dialog
  final EdgeInsets? dialogPadding;

  /// Callback when selection changes
  final ValueChanged<List<V>>? onSelectionChanged;

  /// Creates a [MultiSelectorDialogField]
  MultiSelectorDialogField({
    super.key,
    required this.items,
    required this.onConfirm,
    this.title,
    this.buttonText,
    this.buttonIcon,
    this.decoration,
    // this.boxDecoration,
    this.isDense = false,
    this.selectedColor,
    this.searchable = false,
    this.confirmText,
    this.cancelText,
    this.searchHint,
    this.colorBuilder,
    this.initialValue = const [],
    // this.separateSelectedItems = false,
    // this.animationDuration = const Duration(milliseconds: 200),
    this.dialogShape,
    this.fieldShape,
    this.buttonBuilder,
    // this.dialogBuilder,
    // this.showClearAll = false,
    // this.clearAllText,
    // this.clearAllIcon,
    // this.onClearAll,
    this.showSelectAll = false,
    this.selectAllText,
    this.deselectAllText,
    // this.selectAllIcon,
    // this.onSelectAll,
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
    // this.showItemsDivider = false,
    // this.dividerColor,
    // this.dialogBorderRadius,
    this.dialogElevation = 8.0,
    this.dialogPadding,
    this.onSelectionChanged,
    super.onSaved,
    super.validator,
    AutovalidateMode super.autovalidateMode = AutovalidateMode.disabled,
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
        // boxDecoration: boxDecoration,
        isDense: isDense,
        initialValue: initialValue,
        selectedColor: selectedColor,
        searchable: searchable,
        confirmText: confirmText,
        cancelText: cancelText,
        searchHint: searchHint,
        colorBuilder: colorBuilder,
        // separateSelectedItems: separateSelectedItems,
        // animationDuration: animationDuration,
        dialogShape: dialogShape,
        fieldShape: fieldShape,
        buttonBuilder: buttonBuilder,
        // dialogBuilder: dialogBuilder,
        // showClearAll: showClearAll,
        // clearAllText: clearAllText,
        // clearAllIcon: clearAllIcon,
        // onClearAll: onClearAll,
        showSelectAll: showSelectAll,
        selectAllText: selectAllText,
        deselectAllText: deselectAllText,
        // selectAllIcon: selectAllIcon,
        // onSelectAll: onSelectAll,
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
        // showItemsDivider: showItemsDivider,
        // dividerColor: dividerColor,
        // dialogBorderRadius: dialogBorderRadius,
        dialogElevation: dialogElevation,
        dialogPadding: dialogPadding,
        onSelectionChanged: onSelectionChanged,
      );
    },
  );
}

/// The private view class for [MultiSelectorDialogField]
class _MultiSelectorDialogFieldView<V> extends StatefulWidget {
  /// The form field state
  final FormFieldState<List<V>> state;

  /// List of items available for selection
  final List<MultiSelectorItem<V>> items;

  /// Callback when selection is confirmed
  final ValueChanged<List<V>> onConfirm;

  /// Initial selected values
  final List<V> initialValue;

  /// Title widget for the dialog
  final Widget? title;

  /// Text for the field button
  final Text? buttonText;

  /// Icon for the field button
  final Icon? buttonIcon;

  /// Input decoration for the field
  final InputDecoration? decoration;

  // /// Box decoration for the field
  // final BoxDecoration? boxDecoration;

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

  // /// Whether to separate selected items in the dialog
  // final bool separateSelectedItems;

  // /// Duration for animations
  // final Duration animationDuration;

  /// Shape of the dialog
  final ShapeBorder? dialogShape;

  /// Shape of the field
  final ShapeBorder? fieldShape;

  /// Custom builder for the field button
  final Widget Function(BuildContext context)? buttonBuilder;

  // /// Custom builder for the dialog container
  // final Widget Function(BuildContext context, Widget child)? dialogBuilder;

  // /// Whether to show clear all button
  // final bool showClearAll;
  //
  // /// Text for clear all button
  // final Text? clearAllText;
  //
  // /// Icon for clear all button
  // final Icon? clearAllIcon;
  //
  // /// Callback when clear all is pressed
  // final VoidCallback? onClearAll;

  /// Whether to show select all button
  final bool showSelectAll;

  /// Text for select all button
  final String? selectAllText;

  /// Text for deselect all button
  final String? deselectAllText;

  // /// Icon for select all button
  // final Icon? selectAllIcon;
  //
  // /// Callback when select all is pressed
  // final VoidCallback? onSelectAll;

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

  // /// Whether to show dividers between items
  // final bool showItemsDivider;
  //
  // /// Color of the divider between items
  // final Color? dividerColor;
  //
  // /// Border radius of the dialog
  // final BorderRadius? dialogBorderRadius;

  /// Elevation of the dialog
  final double dialogElevation;

  /// Padding for the dialog
  final EdgeInsets? dialogPadding;

  /// Callback when selection changes
  final ValueChanged<List<V>>? onSelectionChanged;

  /// Creates a [_MultiSelectorDialogFieldView]
  const _MultiSelectorDialogFieldView({
    required this.state,
    required this.items,
    required this.onConfirm,
    this.initialValue = const [],
    this.title,
    this.buttonText,
    this.buttonIcon,
    this.decoration,
    // this.boxDecoration,
    this.isDense = false,
    this.selectedColor,
    this.searchable = false,
    this.confirmText,
    this.cancelText,
    this.searchHint,
    this.colorBuilder,
    // this.separateSelectedItems = false,
    // this.animationDuration = const Duration(milliseconds: 200),
    this.dialogShape,
    this.fieldShape,
    this.buttonBuilder,
    // this.dialogBuilder,
    // this.showClearAll = false,
    // this.clearAllText,
    // this.clearAllIcon,
    // this.onClearAll,
    this.showSelectAll = false,
    this.selectAllText,
    this.deselectAllText,
    // this.selectAllIcon,
    // this.onSelectAll,
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
    // this.showItemsDivider = false,
    // this.dividerColor,
    // this.dialogBorderRadius,
    this.dialogElevation = 8.0,
    this.dialogPadding,
    this.onSelectionChanged,
  });

  @override
  _MultiSelectorDialogFieldViewState<V> createState() =>
      _MultiSelectorDialogFieldViewState<V>();
}

/// The state class for [_MultiSelectorDialogFieldView]
class _MultiSelectorDialogFieldViewState<V>
    extends State<_MultiSelectorDialogFieldView<V>> {
  /// Currently selected items
  late List<V> _selectedItems;

  @override
  void initState() {
    super.initState();
    _selectedItems = List<V>.from(
      widget.initialValue.isNotEmpty
          ? widget.initialValue
          : widget.state.value ?? [],
    );
    // Schedule value update after first frame to avoid build-time mutation
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        widget.state.didChange(_selectedItems);
      }
    });
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

  /// Updates the current selection
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

  /// Builds the chips that show selected items
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

  // /// Updates the current selection
  // void _updateSelection(List<V> newSelection) {
  //   setState(() => _selectedItems = newSelection);
  //   widget.state.didChange(_selectedItems);
  //   widget.onConfirm(_selectedItems);
  //   widget.onSelectionChanged?.call(_selectedItems);
  // }

  /// Builds the field button
  Widget _buildFieldButton(BuildContext context) {
    final theme = Theme.of(context);
    final hasError = widget.state.hasError;
    final isDense = widget.isDense;

    if (widget.buttonBuilder != null) {
      return widget.buttonBuilder!(context);
    }

    if (widget.decoration != null) {
      return GestureDetector(
        onTap: () => _showDialog(context),
        child: InputDecorator(
          decoration: widget.decoration!.copyWith(
            errorText: hasError ? widget.state.errorText : null,
            errorStyle: hasError ? widget.decoration?.errorStyle : null,
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
          isEmpty: _selectedItems.isEmpty,
          child: InkWell(
            onTap: () => _showDialog(context),
            child: Text(
              widget.buttonText?.data ?? 'Select',
              style: widget.decoration?.hintStyle ?? theme.textTheme.bodyMedium,
            ),
          ),
        ),
      );
    }

    final borderColor =
    hasError
        ? theme.colorScheme.error
        : _selectedItems.isNotEmpty
        ? widget.selectedColor ?? theme.primaryColor
        : theme.dividerColor;

    final borderWidth =
    hasError
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
        onTap: () => _showDialog(context),
        child: Container(
          padding:
          isDense
              ? const EdgeInsets.symmetric(horizontal: 12, vertical: 8)
              : const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              widget.buttonText ??
                  Text(
                    'Select',
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: hasError ? theme.colorScheme.error : null,
                    ),
                  ),
              widget.buttonIcon ??
                  Icon(
                    Icons.arrow_drop_down,
                    color:
                    hasError
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

  /// Shows the selection dialog
  Future<void> _showDialog(BuildContext ctx) async {
    await showDialog(
      barrierColor: widget.barrierColor ?? Colors.black54,
      context: context,
      builder: (ctx) {
        final dialog = MultiSelectorDialog<V>(
            items: widget.items,
            initialValue: _selectedItems,
            title: widget.title ?? Text(
              "Select an Item",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Theme
                    .of(context)
                    .colorScheme
                    .primary,
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
          onConfirm: (selected) {
            _selectedItems = selected;
            widget.state.didChange(_selectedItems);
            widget.onConfirm(_selectedItems);
          },
        );

        return dialog;
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
