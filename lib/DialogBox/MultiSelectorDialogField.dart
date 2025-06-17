import 'package:collection/collection.dart' show IterableExtension;
import 'package:flutter/material.dart';
import 'package:flutter_multi_selector/DialogBox/MultiSelectorDialog.dart';
import 'package:flutter_multi_selector/Utils/MultiSelectorListStyle.dart';
import 'package:flutter_multi_selector/Utils/MultiSelectorItem.dart';




/// A customizable InkWell widget that opens the MultiSelectDialog
// ignore: must_be_immutable
class MultiSelectorDialogField<V> extends FormField<List<V>> {
  /// An enum that determines which type of list to render.
  final MultiSelectorListStyle? listType;

  /// Style the Container that makes up the field.
  final BoxDecoration? decoration;

  /// Set text that is displayed on the button.
  final Text? buttonText;

  /// Specify the button icon.
  final Icon? buttonIcon;

  /// The text at the top of the dialog.
  final Widget? title;

  /// List of items to select from.
  final List<MultiSelectorItem<V>> items;

  /// Fires when the an item is selected / unselected.
  final void Function(List<V>)? onSelectionChanged;

  /// Overrides the default MultiSelectChipDisplay attached to this field.
  /// If you want to remove it, use MultiSelectChipDisplay.none().
  // final MultiSelectChipDisplay<V>? chipDisplay;

  /// The list of selected values before interaction.
  final List<V> initialValue;

  /// Fires when confirm is tapped.
  final void Function(List<V>) onConfirm;

  /// Toggles search functionality.
  final bool searchable;

  /// Text on the confirm button.
  final Text? confirmText;

  /// Text on the cancel button.
  final Text? cancelText;

  /// Set the color of the space outside the BottomSheet.
  final Color? barrierColor;

  /// Sets the color of the checkbox or chip when it's selected.
  final Color? selectedColor;

  /// Sets a fixed height on the dialog.
  final double? dialogHeight;

  /// Sets a fixed width on the dialog.
  final double? dialogWidth;

  /// Set the placeholder text of the search field.
  final String? searchHint;

  /// A function that sets the color of selected items based on their value.
  /// It will either set the chip color, or the checkbox color depending on the list type.
  final Color Function(V)? colorator;

  /// Set the background color of the dialog.
  final Color? backgroundColor;

  /// Color of the chip body or checkbox border while not selected.
  final Color? unselectedColor;

  /// Replaces the default search icon when searchable is true.
  final Icon? searchIcon;

  /// Replaces the default close search icon when searchable is true.
  final Icon? closeSearchIcon;

  /// Style the text on the chips or list tiles.
  final TextStyle? itemsTextStyle;

  /// Style the text on the selected chips or list tiles.
  final TextStyle? selectedItemsTextStyle;

  /// Style the text that is typed into the search field.
  final TextStyle? searchTextStyle;

  /// Style the search hint.
  final TextStyle? searchHintStyle;

  /// Moves the selected items to the top of the list.
  final bool separateSelectedItems;

  /// Set the color of the check in the checkbox
  final Color? checkColor;

  /// Whether the user can dismiss the widget by tapping outside
  final bool isDismissible;

  /// Animation duration for dialog transitions
  final Duration animationDuration;

  /// Border radius for the dialog
  final BorderRadius? dialogBorderRadius;

  /// Elevation for the dialog
  final double dialogElevation;

  /// Padding around the dialog content
  final EdgeInsets? dialogPadding;

  /// Whether to show a divider between items
  final bool showItemsDivider;

  /// Color of the divider between items
  final Color? dividerColor;

  /// Custom shape for the dialog
  final ShapeBorder? dialogShape;

  /// Custom shape for the field
  final ShapeBorder? fieldShape;

  /// Whether to show a clear all button
  final bool showClearAll;

  /// Text for the clear all button
  final Text? clearAllText;

  /// Icon for the clear all button
  final Icon? clearAllIcon;

  /// Callback when clear all is pressed
  final VoidCallback? onClearAll;

  /// Whether to show a select all button
  final bool showSelectAll;

  /// Text for the select all button
  final Text? selectAllText;

  /// Icon for the select all button
  final Icon? selectAllIcon;

  /// Callback when select all is pressed
  final VoidCallback? onSelectAll;

  /// Custom builder for the field button
  final Widget Function(BuildContext context)? buttonBuilder;

  /// Custom builder for the dialog
  final Widget Function(BuildContext context, Widget child)? dialogBuilder;

  final AutovalidateMode autovalidateMode;
  final FormFieldValidator<List<V>>? validator;
  final FormFieldSetter<List<V>>? onSaved;
  final GlobalKey<FormFieldState>? key;
  FormFieldState<List<V>>? state;

  MultiSelectorDialogField({
    required this.items,
    required this.onConfirm,
    this.title,
    this.buttonText,
    this.buttonIcon,
    this.listType,
    this.decoration,
    this.onSelectionChanged,
    // this.chipDisplay,
    this.searchable = false,
    this.confirmText,
    this.cancelText,
    this.barrierColor,
    this.selectedColor,
    this.searchHint,
    this.dialogHeight,
    this.dialogWidth,
    this.colorator,
    this.backgroundColor,
    this.unselectedColor,
    this.searchIcon,
    this.closeSearchIcon,
    this.itemsTextStyle,
    this.searchTextStyle,
    this.searchHintStyle,
    this.selectedItemsTextStyle,
    this.separateSelectedItems = false,
    this.checkColor,
    this.isDismissible = true,
    this.onSaved,
    this.validator,
    this.initialValue = const [],
    this.autovalidateMode = AutovalidateMode.disabled,
    this.key,
    this.animationDuration = const Duration(milliseconds: 300),
    this.dialogBorderRadius,
    this.dialogElevation = 8.0,
    this.dialogPadding,
    this.showItemsDivider = false,
    this.dividerColor,
    this.dialogShape,
    this.fieldShape,
    this.showClearAll = false,
    this.clearAllText,
    this.clearAllIcon,
    this.onClearAll,
    this.showSelectAll = false,
    this.selectAllText,
    this.selectAllIcon,
    this.onSelectAll,
    this.buttonBuilder,
    this.dialogBuilder,
  }) : super(
      key: key,
      onSaved: onSaved,
      validator: validator,
      autovalidateMode: autovalidateMode,
      initialValue: initialValue,
      builder: (FormFieldState<List<V>> state) {
        _MultiSelectorDialogFieldView<V> field =
        _MultiSelectorDialogFieldView<V>(
          title: title,
          items: items,
          buttonText: buttonText,
          buttonIcon: buttonIcon,
          // chipDisplay: chipDisplay,
          decoration: decoration,
          listType: listType,
          onConfirm: onConfirm,
          onSelectionChanged: onSelectionChanged,
          initialValue: initialValue,
          searchable: searchable,
          confirmText: confirmText,
          cancelText: cancelText,
          barrierColor: barrierColor,
          selectedColor: selectedColor,
          searchHint: searchHint,
          dialogHeight: dialogHeight,
          dialogWidth: dialogWidth,
          colorator: colorator,
          backgroundColor: backgroundColor,
          unselectedColor: unselectedColor,
          searchIcon: searchIcon,
          closeSearchIcon: closeSearchIcon,
          itemsTextStyle: itemsTextStyle,
          searchTextStyle: searchTextStyle,
          searchHintStyle: searchHintStyle,
          selectedItemsTextStyle: selectedItemsTextStyle,
          separateSelectedItems: separateSelectedItems,
          checkColor: checkColor,
          isDismissible: isDismissible,
          animationDuration: animationDuration,
          dialogBorderRadius: dialogBorderRadius,
          dialogElevation: dialogElevation,
          dialogPadding: dialogPadding,
          showItemsDivider: showItemsDivider,
          dividerColor: dividerColor,
          dialogShape: dialogShape,
          fieldShape: fieldShape,
          showClearAll: showClearAll,
          clearAllText: clearAllText,
          clearAllIcon: clearAllIcon,
          onClearAll: onClearAll,
          showSelectAll: showSelectAll,
          selectAllText: selectAllText,
          selectAllIcon: selectAllIcon,
          onSelectAll: onSelectAll,
          buttonBuilder: buttonBuilder,
          dialogBuilder: dialogBuilder,
        );
        return _MultiSelectorDialogFieldView<V>._withState(field, state);
      });
}

// ignore: must_be_immutable
class _MultiSelectorDialogFieldView<V> extends StatefulWidget {
  final MultiSelectorListStyle? listType;
  final BoxDecoration? decoration;
  final Text? buttonText;
  final Icon? buttonIcon;
  final Widget? title;
  final List<MultiSelectorItem<V>> items;
  final void Function(List<V>)? onSelectionChanged;
  // final MultiSelectChipDisplay<V>? chipDisplay;
  final List<V> initialValue;
  final void Function(List<V>)? onConfirm;
  final bool? searchable;
  final Text? confirmText;
  final Text? cancelText;
  final Color? barrierColor;
  final Color? selectedColor;
  final double? dialogHeight;
  final double? dialogWidth;
  final String? searchHint;
  final Color Function(V)? colorator;
  final Color? backgroundColor;
  final Color? unselectedColor;
  final Icon? searchIcon;
  final Icon? closeSearchIcon;
  final TextStyle? itemsTextStyle;
  final TextStyle? selectedItemsTextStyle;
  final TextStyle? searchTextStyle;
  final TextStyle? searchHintStyle;
  final bool separateSelectedItems;
  final Color? checkColor;
  final bool isDismissible;
  final Duration animationDuration;
  final BorderRadius? dialogBorderRadius;
  final double dialogElevation;
  final EdgeInsets? dialogPadding;
  final bool showItemsDivider;
  final Color? dividerColor;
  final ShapeBorder? dialogShape;
  final ShapeBorder? fieldShape;
  final bool showClearAll;
  final Text? clearAllText;
  final Icon? clearAllIcon;
  final VoidCallback? onClearAll;
  final bool showSelectAll;
  final Text? selectAllText;
  final Icon? selectAllIcon;
  final VoidCallback? onSelectAll;
  final Widget Function(BuildContext context)? buttonBuilder;
  final Widget Function(BuildContext context, Widget child)? dialogBuilder;
  FormFieldState<List<V>>? state;

  _MultiSelectorDialogFieldView({
    required this.items,
    this.title,
    this.buttonText,
    this.buttonIcon,
    this.listType,
    this.decoration,
    this.onSelectionChanged,
    this.onConfirm,
    // this.chipDisplay,
    this.initialValue = const [],
    this.searchable,
    this.confirmText,
    this.cancelText,
    this.barrierColor,
    this.selectedColor,
    this.searchHint,
    this.dialogHeight,
    this.dialogWidth,
    this.colorator,
    this.backgroundColor,
    this.unselectedColor,
    this.searchIcon,
    this.closeSearchIcon,
    this.itemsTextStyle,
    this.searchTextStyle,
    this.searchHintStyle,
    this.selectedItemsTextStyle,
    this.separateSelectedItems = false,
    this.checkColor,
    required this.isDismissible,
    this.animationDuration = const Duration(milliseconds: 300),
    this.dialogBorderRadius,
    this.dialogElevation = 8.0,
    this.dialogPadding,
    this.showItemsDivider = false,
    this.dividerColor,
    this.dialogShape,
    this.fieldShape,
    this.showClearAll = false,
    this.clearAllText,
    this.clearAllIcon,
    this.onClearAll,
    this.showSelectAll = false,
    this.selectAllText,
    this.selectAllIcon,
    this.onSelectAll,
    this.buttonBuilder,
    this.dialogBuilder,
  });

  /// This constructor allows a FormFieldState to be passed in. Called by MultiSelectDialogField.
  _MultiSelectorDialogFieldView._withState(
      _MultiSelectorDialogFieldView<V> field, FormFieldState<List<V>> state)
      : items = field.items,
        title = field.title,
        buttonText = field.buttonText,
        buttonIcon = field.buttonIcon,
        listType = field.listType,
        decoration = field.decoration,
        onSelectionChanged = field.onSelectionChanged,
        onConfirm = field.onConfirm,
        // chipDisplay = field.chipDisplay,
        initialValue = field.initialValue,
        searchable = field.searchable,
        confirmText = field.confirmText,
        cancelText = field.cancelText,
        barrierColor = field.barrierColor,
        selectedColor = field.selectedColor,
        dialogHeight = field.dialogHeight,
        dialogWidth = field.dialogWidth,
        searchHint = field.searchHint,
        colorator = field.colorator,
        backgroundColor = field.backgroundColor,
        unselectedColor = field.unselectedColor,
        searchIcon = field.searchIcon,
        closeSearchIcon = field.closeSearchIcon,
        itemsTextStyle = field.itemsTextStyle,
        searchHintStyle = field.searchHintStyle,
        searchTextStyle = field.searchTextStyle,
        selectedItemsTextStyle = field.selectedItemsTextStyle,
        separateSelectedItems = field.separateSelectedItems,
        checkColor = field.checkColor,
        isDismissible = field.isDismissible,
        animationDuration = field.animationDuration,
        dialogBorderRadius = field.dialogBorderRadius,
        dialogElevation = field.dialogElevation,
        dialogPadding = field.dialogPadding,
        showItemsDivider = field.showItemsDivider,
        dividerColor = field.dividerColor,
        dialogShape = field.dialogShape,
        fieldShape = field.fieldShape,
        showClearAll = field.showClearAll,
        clearAllText = field.clearAllText,
        clearAllIcon = field.clearAllIcon,
        onClearAll = field.onClearAll,
        showSelectAll = field.showSelectAll,
        selectAllText = field.selectAllText,
        selectAllIcon = field.selectAllIcon,
        onSelectAll = field.onSelectAll,
        buttonBuilder = field.buttonBuilder,
        dialogBuilder = field.dialogBuilder,
        state = state;

  @override
  __MultiSelectDialogFieldViewState createState() =>
      __MultiSelectDialogFieldViewState<V>();
}

class __MultiSelectDialogFieldViewState<V>
    extends State<_MultiSelectorDialogFieldView<V>> {
  List<V> _selectedItems = [];

  @override
  void initState() {
    super.initState();
    _selectedItems.addAll(widget.initialValue);
  }

  @override
  void didUpdateWidget(_MultiSelectorDialogFieldView<V> oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.initialValue != widget.initialValue) {
      _selectedItems = [];
      _selectedItems.addAll(widget.initialValue);

      WidgetsBinding.instance.addPostFrameCallback((_) {
        widget.state!.didChange(_selectedItems);
      });
    }
  }

  // Widget _buildInheritedChipDisplay() {
  //   List<MultiSelectorItem<V>?> chipDisplayItems = _selectedItems
  //       .map((e) =>
  //       widget.items.firstWhereOrNull((element) => e == element.value))
  //       .where((element) => element != null)
  //       .toList();
  //
  //   // if (widget.chipDisplay != null) {
  //   //   // if user has specified a chipDisplay, use its params
  //   //   if (widget.chipDisplay!.disabled!) {
  //   //     return Container();
  //   //   } else {
  //   //     return MultiSelectChipDisplay<V>(
  //   //       items: chipDisplayItems,
  //   //       colorator: widget.chipDisplay!.colorator ?? widget.colorator,
  //   //       onTap: (item) {
  //   //         List<V>? newValues;
  //   //         if (widget.chipDisplay!.onTap != null) {
  //   //           dynamic result = widget.chipDisplay!.onTap!(item);
  //   //           if (result is List<V>) newValues = result;
  //   //         }
  //   //         if (newValues != null) {
  //   //           _selectedItems = newValues;
  //   //           if (widget.state != null) {
  //   //             widget.state!.didChange(_selectedItems);
  //   //           }
  //   //         }
  //   //       },
  //   //       decoration: widget.chipDisplay!.decoration,
  //   //       chipColor: widget.chipDisplay!.chipColor ??
  //   //           ((widget.selectedColor != null &&
  //   //               widget.selectedColor != Colors.transparent)
  //   //               ? widget.selectedColor!.withOpacity(0.35)
  //   //               : null),
  //   //       alignment: widget.chipDisplay!.alignment,
  //   //       textStyle: widget.chipDisplay!.textStyle,
  //   //       icon: widget.chipDisplay!.icon,
  //   //       shape: widget.chipDisplay!.shape,
  //   //       scroll: widget.chipDisplay!.scroll,
  //   //       scrollBar: widget.chipDisplay!.scrollBar,
  //   //       height: widget.chipDisplay!.height,
  //   //       chipWidth: widget.chipDisplay!.chipWidth,
  //   //     );
  //   //   }
  //   // } else {
  //   //   // user didn't specify a chipDisplay, build the default
  //   //   return MultiSelectChipDisplay<V>(
  //   //     items: chipDisplayItems,
  //   //     colorator: widget.colorator,
  //   //     chipColor: (widget.selectedColor != null &&
  //   //         widget.selectedColor != Colors.transparent)
  //   //         ? widget.selectedColor!.withOpacity(0.35)
  //   //         : null,
  //   //   );
  //   // }
  // }


  Widget _buildInheritedChipDisplay() {
    // Get the valid selected items by matching with available options
    List<MultiSelectorItem<V>> chipDisplayItems = _selectedItems
        .map((e) => widget.items.firstWhereOrNull((element) => e == element.value))
        .whereType<MultiSelectorItem<V>>()
        .toList();

    // If no selected items, return empty container
    if (chipDisplayItems.isEmpty) {
      return Container();
    }

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Wrap(
        spacing: 8.0, // Horizontal space between chips
        runSpacing: 4.0, // Vertical space between chip rows
        children: chipDisplayItems.map((item) {
          final Color? chipColor = widget.colorator != null
              ? widget.colorator!(item.value)
              : widget.selectedColor ?? Theme.of(context).primaryColor;

          return Chip(
            label: Text(
              item.label,
              style: widget.selectedItemsTextStyle ??
                  TextStyle(
                    color: chipColor?.withAlpha(255) ?? Colors.black,
                  ),
            ),
            backgroundColor: chipColor?.withAlpha(51),
            side: BorderSide(
              color: chipColor ?? Colors.grey,
              width: 1.0,
            ),
            deleteIcon: Icon(
              Icons.close,
              size: 18,
              color: chipColor?.withAlpha(204),
            ),
            onDeleted: () {
              setState(() {
                _selectedItems.remove(item.value);
              });
              if (widget.state != null) {
                widget.state!.didChange(_selectedItems);
              }
              if (widget.onConfirm != null) {
                widget.onConfirm!(_selectedItems);
              }
              if (widget.onSelectionChanged != null) {
                widget.onSelectionChanged!(_selectedItems);
              }
            },
            shape: widget.fieldShape as OutlinedBorder? ??
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
            visualDensity: VisualDensity.compact,
          );
        }).toList(),
      ),
    );
  }

  Widget _buildDefaultButton(BuildContext context) {
    return Material(
      shape: widget.fieldShape ??
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
            side: BorderSide(
              color: widget.state != null && widget.state!.hasError
                  ? Theme.of(context).colorScheme.error
                  : _selectedItems.isNotEmpty
                  ? (widget.selectedColor != null &&
                  widget.selectedColor != Colors.transparent)
                  ? widget.selectedColor!
                  : Theme.of(context).primaryColor
                  : Theme.of(context).dividerColor,
              width: _selectedItems.isNotEmpty
                  ? (widget.state != null && widget.state!.hasError)
                  ? 1.4
                  : 1.8
                  : 1.2,
            ),
          ),
      color: Theme.of(context).cardColor,
      elevation: 1,
      child: InkWell(
        borderRadius: widget.fieldShape == null
            ? BorderRadius.circular(8)
            : null,
        onTap: () => _showDialog(context),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              widget.buttonText ??
                  Text(
                    'Select Number',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
              widget.buttonIcon ??
                  Icon(
                    Icons.arrow_drop_down,
                    color: Theme.of(context).iconTheme.color,
                  ),
            ],
          ),
        ),
      ),
    );
  }

  /// Calls showDialog() and renders a MultiSelectDialog.
  Future<void> _showDialog(BuildContext ctx) async {
    await showDialog(
      barrierColor: widget.barrierColor ?? Colors.black54,
      barrierDismissible: widget.isDismissible,
      context: context,
      builder: (ctx) {
        final dialog = MultiSelectorDialog<V>(
          checkColor: widget.checkColor,
          selectedItemsTextStyle: widget.selectedItemsTextStyle,
          searchHintStyle: widget.searchHintStyle,
          searchTextStyle: widget.searchTextStyle,
          itemsTextStyle: widget.itemsTextStyle,
          searchIcon: widget.searchIcon,
          closeSearchIcon: widget.closeSearchIcon,
          unselectedColor: widget.unselectedColor,
          backgroundColor: widget.backgroundColor,
          colorator: widget.colorator,
          searchHint: widget.searchHint,
          selectedColor: widget.selectedColor,
          // onSelectionChanged: widget.onSelectionChanged,
          height: widget.dialogHeight,
          width: widget.dialogWidth,
          // listType: widget.listType,
          items: widget.items,
          title: widget.title ?? const Text("Select"),
          initialValue: _selectedItems,
          searchable: widget.searchable ?? false,
          confirmText: widget.confirmText,
          cancelText: widget.cancelText,
          separateSelectedItems: widget.separateSelectedItems,
          // animationDuration: widget.animationDuration,
          // borderRadius: widget.dialogBorderRadius,
          elevation: widget.dialogElevation,
          // padding: widget.dialogPadding,
          // showItemsDivider: widget.showItemsDivider,
          // dividerColor: widget.dividerColor,
          shape: widget.dialogShape,
          // showClearAll: widget.showClearAll,
          // clearAllText: widget.clearAllText,
          // clearAllIcon: widget.clearAllIcon,
          // onClearAll: () {
          //   setState(() {
          //     _selectedItems.clear();
          //     if (widget.state != null) {
          //       widget.state!.didChange(_selectedItems);
          //     }
          //     if (widget.onClearAll != null) widget.onClearAll!();
          //   });
          // },
          showSelectAll: widget.showSelectAll,
          selectAllText: widget.selectAllText,
          // selectAllIcon: widget.selectAllIcon,
          // onSelectAll: () {
          //   setState(() {
          //     _selectedItems = widget.items.map((e) => e.value).toList();
          //     if (widget.state != null) {
          //       widget.state!.didChange(_selectedItems);
          //     }
          //     if (widget.onSelectAll != null) widget.onSelectAll!();
          //   });
          // },
          onConfirm: (selected) {
            _selectedItems = selected;
            if (widget.state != null) {
              widget.state!.didChange(_selectedItems);
            }
            if (widget.onConfirm != null) widget.onConfirm!(_selectedItems);
          },
        );

        return widget.dialogBuilder != null
            ? widget.dialogBuilder!(context, dialog)
            : Dialog(
          shape: widget.dialogShape ??
              RoundedRectangleBorder(
                borderRadius: widget.dialogBorderRadius ??
                    BorderRadius.circular(12),
              ),
          elevation: widget.dialogElevation,
          backgroundColor: widget.backgroundColor,
          child: dialog,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        widget.buttonBuilder != null
            ? widget.buttonBuilder!(context)
            : _buildDefaultButton(context),
        if (_selectedItems.isNotEmpty) ...[
          const SizedBox(height: 8),
          _buildInheritedChipDisplay(),
        ],
        if (widget.state != null && widget.state!.hasError) ...[
          const SizedBox(height: 4),
          Padding(
            padding: const EdgeInsets.only(left: 12),
            child: Text(
              widget.state!.errorText!,
              style: Theme.of(context).textTheme.labelSmall?.copyWith(
                color: Theme.of(context).colorScheme.error,
              ),
            ),
          ),
        ],
      ],
    );
  }
}