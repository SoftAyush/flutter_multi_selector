import 'package:collection/collection.dart' show IterableExtension;
import 'package:flutter/material.dart';
import 'package:flutter_multi_selector/DialogBox/MultiSelectorDialog.dart';
import 'package:flutter_multi_selector/Utils/MultiSelectorItem.dart';

class MultiSelectorDialogField<V> extends FormField<List<V>> {
  final List<MultiSelectorItem<V>> items;
  final ValueChanged<List<V>> onConfirm;

  /// The list of selected values before interaction.
  final List<V> initialValue;

  final Widget? title;
  final Text? buttonText;
  final Icon? buttonIcon;
  final InputDecoration? decoration;
  final BoxDecoration? boxDecoration;
  final bool isDense;
  final Color? selectedColor;
  final bool searchable;
  final Text? confirmText;
  final Text? cancelText;
  final String? searchHint;
  final Color Function(V)? colorBuilder;
  final bool separateSelectedItems;
  final Duration animationDuration;
  final ShapeBorder? dialogShape;
  final ShapeBorder? fieldShape;
  final Widget Function(BuildContext context)? buttonBuilder;
  final Widget Function(BuildContext context, Widget child)? dialogBuilder;
  final bool showClearAll;
  final Text? clearAllText;
  final Icon? clearAllIcon;
  final VoidCallback? onClearAll;
  final bool showSelectAll;
  final String? selectAllText;
  final String? deselectAllText;
  final Icon? selectAllIcon;
  final VoidCallback? onSelectAll;
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
  final bool showItemsDivider;
  final Color? dividerColor;
  final BorderRadius? dialogBorderRadius;
  final double dialogElevation;
  final EdgeInsets? dialogPadding;
  final ValueChanged<List<V>>? onSelectionChanged;

  MultiSelectorDialogField({
    super.key,
    required this.items,
    required this.onConfirm,
    this.title,
    this.buttonText,
    this.buttonIcon,
    this.decoration,
    this.boxDecoration,
    this.isDense = false,
    this.selectedColor,
    this.searchable = false,
    this.confirmText,
    this.cancelText,
    this.searchHint,
    this.colorBuilder,
    this.initialValue = const [],
    this.separateSelectedItems = false,
    this.animationDuration = const Duration(milliseconds: 200),
    this.dialogShape,
    this.fieldShape,
    this.buttonBuilder,
    this.dialogBuilder,
    this.showClearAll = false,
    this.clearAllText,
    this.clearAllIcon,
    this.onClearAll,
    this.showSelectAll = false,
    this.selectAllText,
    this.deselectAllText,
    this.selectAllIcon,
    this.onSelectAll,
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
    this.showItemsDivider = false,
    this.dividerColor,
    this.dialogBorderRadius,
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
             boxDecoration: boxDecoration,
             isDense: isDense,
             initialValue: initialValue,
             selectedColor: selectedColor,
             searchable: searchable,
             confirmText: confirmText,
             cancelText: cancelText,
             searchHint: searchHint,
             colorBuilder: colorBuilder,
             separateSelectedItems: separateSelectedItems,
             animationDuration: animationDuration,
             dialogShape: dialogShape,
             fieldShape: fieldShape,
             buttonBuilder: buttonBuilder,
             dialogBuilder: dialogBuilder,
             showClearAll: showClearAll,
             clearAllText: clearAllText,
             clearAllIcon: clearAllIcon,
             onClearAll: onClearAll,
             showSelectAll: showSelectAll,
             selectAllText: selectAllText,
             deselectAllText: deselectAllText,
             selectAllIcon: selectAllIcon,
             onSelectAll: onSelectAll,
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
             showItemsDivider: showItemsDivider,
             dividerColor: dividerColor,
             dialogBorderRadius: dialogBorderRadius,
             dialogElevation: dialogElevation,
             dialogPadding: dialogPadding,
             onSelectionChanged: onSelectionChanged,
           );
         },
       );
}

class _MultiSelectorDialogFieldView<V> extends StatefulWidget {
  final FormFieldState<List<V>> state;
  final List<MultiSelectorItem<V>> items;
  final ValueChanged<List<V>> onConfirm;
  final List<V> initialValue;

  final Widget? title;
  final Text? buttonText;
  final Icon? buttonIcon;
  final InputDecoration? decoration;
  final BoxDecoration? boxDecoration;
  final bool isDense;
  final Color? selectedColor;
  final bool searchable;
  final Text? confirmText;
  final Text? cancelText;
  final String? searchHint;
  final Color Function(V)? colorBuilder;
  final bool separateSelectedItems;
  final Duration animationDuration;
  final ShapeBorder? dialogShape;
  final ShapeBorder? fieldShape;
  final Widget Function(BuildContext context)? buttonBuilder;
  final Widget Function(BuildContext context, Widget child)? dialogBuilder;
  final bool showClearAll;
  final Text? clearAllText;
  final Icon? clearAllIcon;
  final VoidCallback? onClearAll;
  final bool showSelectAll;
  final String? selectAllText;
  final String? deselectAllText;
  final Icon? selectAllIcon;
  final VoidCallback? onSelectAll;
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
  final bool showItemsDivider;
  final Color? dividerColor;
  final BorderRadius? dialogBorderRadius;
  final double dialogElevation;
  final EdgeInsets? dialogPadding;
  final ValueChanged<List<V>>? onSelectionChanged;

  const _MultiSelectorDialogFieldView({
    required this.state,
    required this.items,
    required this.onConfirm,
    this.initialValue = const [],
    this.title,
    this.buttonText,
    this.buttonIcon,
    this.decoration,
    this.boxDecoration,
    this.isDense = false,
    this.selectedColor,
    this.searchable = false,
    this.confirmText,
    this.cancelText,
    this.searchHint,
    this.colorBuilder,
    this.separateSelectedItems = false,
    this.animationDuration = const Duration(milliseconds: 200),
    this.dialogShape,
    this.fieldShape,
    this.buttonBuilder,
    this.dialogBuilder,
    this.showClearAll = false,
    this.clearAllText,
    this.clearAllIcon,
    this.onClearAll,
    this.showSelectAll = false,
    this.selectAllText,
    this.deselectAllText,
    this.selectAllIcon,
    this.onSelectAll,
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
    this.showItemsDivider = false,
    this.dividerColor,
    this.dialogBorderRadius,
    this.dialogElevation = 8.0,
    this.dialogPadding,
    this.onSelectionChanged,
  });

  @override
  _MultiSelectorDialogFieldViewState<V> createState() => _MultiSelectorDialogFieldViewState<V>();
}

class _MultiSelectorDialogFieldViewState<V> extends State<_MultiSelectorDialogFieldView<V>> {
  List<V> _selectedItems = [];

  @override
  void initState() {
    super.initState();
    _selectedItems.addAll(widget.initialValue);

    _selectedItems.addAll(widget.state.value ?? []);
  }


  @override
  void didUpdateWidget(_MultiSelectorDialogFieldView<V> oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.initialValue != widget.initialValue) {
      _selectedItems = [];
      _selectedItems.addAll(widget.initialValue);

      WidgetsBinding.instance.addPostFrameCallback((_) {
        widget.state.didChange(_selectedItems);
      });
    }
  }

  Widget _buildChips() {
    final validItems =
        _selectedItems
            .map((e) => widget.items.firstWhereOrNull((item) => item.value == e))
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
                onDeleted: () => _updateSelection(_selectedItems..remove(item.value)),
                shape:
                    widget.fieldShape as OutlinedBorder? ??
                    RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
                visualDensity: VisualDensity.compact,
              );
            }).toList(),
      ),
    );
  }

  void _updateSelection(List<V> newSelection) {
    setState(() => _selectedItems = newSelection);
    widget.state.didChange(_selectedItems);
    widget.onConfirm(_selectedItems);
    widget.onSelectionChanged?.call(_selectedItems);
  }

  Widget _buildFieldButton(BuildContext context) {
    final theme = Theme.of(context);
    final hasError = widget.state.hasError;
    final isDense = widget.isDense;

    if (widget.buttonBuilder != null) {
      return widget.buttonBuilder!(context);
    }

    if (widget.decoration != null) {
      return InputDecorator(
        decoration: widget.decoration!.copyWith(
          errorText: hasError ? widget.state.errorText : null,
          errorStyle:
              hasError ? theme.textTheme.bodySmall?.copyWith(color: theme.colorScheme.error) : null,
          contentPadding:
              isDense ? const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0) : null,
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
        borderRadius: widget.fieldShape == null ? BorderRadius.circular(8) : null,
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
                    color: hasError ? theme.colorScheme.error : theme.iconTheme.color,
                    size: isDense ? 20 : 24,
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
      // barrierDismissible: widget.isDismissible,
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
          colorBuilder: widget.colorBuilder,
          searchHint: widget.searchHint,
          selectedColor: widget.selectedColor,
          // onSelectionChanged: widget.onSelectionChanged,
          height: widget.dialogHeight,
          width: widget.dialogWidth,
          // listType: widget.listType,
          items: widget.items,
          title: widget.title ??  Text(
            "Select an Item",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Theme.of(context).colorScheme.primary,
            ),
          )
          ,
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
           deselectAllText: widget.selectAllText,

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
            widget.state.didChange(_selectedItems);
            widget.onConfirm(_selectedItems);
          },
        );

        return widget.dialogBuilder != null
            ? widget.dialogBuilder!(context, dialog)
            : Dialog(
              shape:
                  widget.dialogShape ??
                  RoundedRectangleBorder(
                    borderRadius: widget.dialogBorderRadius ?? BorderRadius.circular(12),
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
      mainAxisSize: MainAxisSize.min,
      children: [_buildFieldButton(context), _buildChips()],
    );
  }
}
