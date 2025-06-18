import 'package:flutter/material.dart';
import 'package:flutter_multi_selector/Utils/MultiSelectorActions.dart';
import 'package:flutter_multi_selector/Utils/MultiSelectorItem.dart';

class MultiSelectorDialog<T> extends StatefulWidget {
  final List<MultiSelectorItem<T>> items;
  final List<T> initialValue;
  final Widget? title;
  final void Function(List<T>)? onConfirm;
  final bool searchable;
  final Text? confirmText;
  final Text? cancelText;
  final Color? selectedColor;
  final double? height;
  final double? width;
  final String? searchHint;
  final Color? Function(T)? colorator;
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
  final double? elevation;
  final ShapeBorder? shape;
  final EdgeInsets? contentPadding;
  final bool showSelectAll;
  final Widget? selectAllText;
  final Widget? deselectAllText;
  final bool useChipsForSelection;
  final double? dialogWidth;
  final double? dialogHeight;

  const MultiSelectorDialog({
    super.key,
    required this.items,
    required this.initialValue,
    this.title,
    this.onConfirm,
    this.searchable = false,
    this.confirmText,
    this.cancelText,
    this.selectedColor,
    this.height,
    this.width,
    this.searchHint,
    this.colorator,
    this.backgroundColor,
    this.unselectedColor,
    this.searchIcon,
    this.closeSearchIcon,
    this.itemsTextStyle,
    this.selectedItemsTextStyle,
    this.searchTextStyle,
    this.searchHintStyle,
    this.separateSelectedItems = false,
    this.checkColor,
    this.elevation,
    this.shape,
    this.contentPadding,
    this.showSelectAll = false,
    this.selectAllText,
    this.deselectAllText,
    this.useChipsForSelection = false,
    this.dialogWidth,
    this.dialogHeight,
  });

  @override
  State<MultiSelectorDialog<T>> createState() => _MultiSelectorDialogState<T>();
}

class _MultiSelectorDialogState<T> extends State<MultiSelectorDialog<T>> with MultiSelectorActions<T> {
  late List<T> _selectedValues;
  bool _showSearch = false;
  late List<MultiSelectorItem<T>> _items;
  final TextEditingController _searchController = TextEditingController();
  final FocusNode _searchFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _selectedValues = List<T>.from(widget.initialValue);
    _items = List<MultiSelectorItem<T>>.from(widget.items);
    _initializeItems();
  }

  void _initializeItems() {
    for (final item in _items) {
      item.selected = _selectedValues.contains(item.value);
    }

    if (widget.separateSelectedItems) {
      _items = separateSelected(_items);
    }
  }

  @override
  void dispose() {
    _searchController.dispose();
    _searchFocusNode.dispose();
    super.dispose();
  }

  Widget _buildListItem(MultiSelectorItem<T> item) {
    final theme = Theme.of(context);
    final isSelected = item.selected;
    final itemColor = widget.colorator?.call(item.value) ?? widget.selectedColor ?? theme.primaryColor;

    return InkWell(
      onTap: () => _handleItemSelection(item, !isSelected),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 1.0),
        child: Row(
          children: [
            Checkbox(
              value: isSelected,
              checkColor: widget.checkColor ?? theme.colorScheme.onPrimary,
              fillColor: WidgetStateProperty.resolveWith<Color>((states) {
                if (states.contains(WidgetState.selected)) {
                  return itemColor;
                }
                return widget.unselectedColor ?? theme.unselectedWidgetColor;
              }),
              onChanged: (checked) => _handleItemSelection(item, checked!),
            ),
            const SizedBox(width: 4),
            Expanded(
              child: Text(
                item.label,
                style: isSelected
                    ? widget.selectedItemsTextStyle?.copyWith(color: itemColor) ??
                    theme.textTheme.bodyMedium?.copyWith(
                      color: itemColor,
                      fontWeight: FontWeight.bold,
                    )
                    : widget.itemsTextStyle ?? theme.textTheme.bodyMedium,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildChipItem(MultiSelectorItem<T> item) {
    final isSelected = item.selected;
    final color = widget.colorator?.call(item.value) ?? widget.selectedColor;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 4.0),
      child: ChoiceChip(
        selected: isSelected,
        label: Text(
          item.label,
          style: isSelected
              ? widget.selectedItemsTextStyle?.copyWith(color: color ?? Theme.of(context).primaryColor) ??
              TextStyle(
                color: color ?? Theme.of(context).primaryColor,
                fontWeight: FontWeight.bold,
              )
              : widget.itemsTextStyle,
        ),
        selectedColor: color?.withAlpha(51),
        backgroundColor: widget.unselectedColor ?? Colors.grey.shade200,
        onSelected: (checked) => _handleItemSelection(item, checked),
      ),
    );
  }

  void _handleItemSelection(MultiSelectorItem<T> item, bool checked) {
    setState(() {
      item.selected = checked;
      _selectedValues = onItemCheckedChange(_selectedValues, item.value, checked);

      if (widget.separateSelectedItems) {
        _items = separateSelected(_items);
      }
    });
  }

  Widget _buildSearchField() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 2.0),
      child: TextField(
        controller: _searchController,
        focusNode: _searchFocusNode,
        autofocus: true,
        style: widget.searchTextStyle ?? const TextStyle(fontSize: 16, color: Colors.black87),
        decoration: InputDecoration(
          hintText: widget.searchHint ?? "Search...",
          hintStyle: widget.searchHintStyle ?? const TextStyle(color: Colors.grey, fontSize: 16),
          prefixIcon: widget.searchIcon ?? const Icon(Icons.search, color: Colors.grey),
          contentPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: Colors.grey.shade400),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: Colors.grey.shade400),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(
              color: Theme.of(context).primaryColor,
              width: 2,
            ),
          ),
        ),
        onChanged: _updateSearchQuery,
      ),
    );
  }

  void _updateSearchQuery(String query) {
    setState(() {
      _items = updateSearchQuery(query, widget.items);
      if (widget.separateSelectedItems) {
        _items = separateSelected(_items);
      }
    });
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 2.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (widget.title != null)
                  Flexible(
                    child: DefaultTextStyle(
                        style: Theme.of(context).textTheme.titleLarge ??
                            const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                        child: widget.title!,
                    ),
                  ),
                if (widget.searchable)
                  IconButton(
                    icon: _showSearch
                        ? widget.closeSearchIcon ?? const Icon(Icons.close)
                        : widget.searchIcon ?? const Icon(Icons.search),
                    onPressed: () {
                      setState(() {
                        _showSearch = !_showSearch;
                        if (!_showSearch) {
                          _searchController.clear();
                          _updateSearchQuery('');
                        } else {
                          WidgetsBinding.instance.addPostFrameCallback((_) {
                            _searchFocusNode.requestFocus();
                          });
                        }
                      });
                    },
                  ),
              ],
            ),
          ),
          if (_showSearch) _buildSearchField(),
        ],
      ),
    );
  }

  Widget _buildSelectAllButton() {
    if (!widget.showSelectAll) return const SizedBox();

    final allSelected = _items.every((item) => item.selected);
    final buttonText = allSelected
        ? widget.deselectAllText ?? "Deselect All"
        : widget.selectAllText ?? "Select All";

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 3.0),
      child: OutlinedButton(
        onPressed: () {
          setState(() {
            if (allSelected) {
              for (var item in _items) {
                item.selected = false;
              }
              _selectedValues.clear();
            } else {
              for (var item in _items) {
                item.selected = true;
              }
              _selectedValues = _items.map((item) => item.value).toList();
            }

            if (widget.separateSelectedItems) {
              _items = separateSelected(_items);
            }
          });
        },
        style: OutlinedButton.styleFrom(
          backgroundColor: allSelected
              ? Theme.of(context).colorScheme.primary.withAlpha(13)
              : null,
          side: BorderSide(
            color: Theme.of(context).colorScheme.primary,
            width: 1.0,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          minimumSize: const Size(double.infinity, 48),
        ),
        child: Text(
          buttonText.toString(),
          style: TextStyle(
            color: allSelected
                ? Theme.of(context).colorScheme.primary
                : Theme.of(context).colorScheme.onSurface,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }

  Widget _buildListContent() {
    if (_items.isEmpty) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            "No items found",
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Colors.grey),
          ),
        ),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      itemCount: _items.length,
      itemBuilder: (context, index) => _buildListItem(_items[index]),
    );
  }

  Widget _buildChipContent() {
    if (_items.isEmpty) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            "No items found",
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Colors.grey),
          ),
        ),
      );
    }

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Wrap(
        spacing: 8.0,
        runSpacing: 8.0,
        children: _items.map(_buildChipItem).toList(),
      ),
    );
  }

  Widget _buildActionButtons() {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextButton(
            onPressed: () => onCancelTap(context, widget.initialValue),
            style: TextButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            ),
            child: DefaultTextStyle(
              style: theme.textTheme.bodyLarge?.copyWith(
                color: theme.colorScheme.onSurface.withOpacity(0.7),
              ) ??
                  TextStyle(color: theme.colorScheme.onSurface.withOpacity(0.7)),
              child: widget.cancelText ?? const Text("CANCEL"),
            ),
          ),
          const SizedBox(width: 8),
          ElevatedButton(
            onPressed: () => onConfirmTap(context, _selectedValues, widget.onConfirm),
            style: ElevatedButton.styleFrom(
              backgroundColor: widget.selectedColor ?? theme.colorScheme.primary,
              foregroundColor: theme.colorScheme.onPrimary,
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            ),
            child: DefaultTextStyle(
              style: theme.textTheme.bodyLarge?.copyWith(
                color: theme.colorScheme.onPrimary,
                fontWeight: FontWeight.w600,
              ) ??
                  TextStyle(
                    color: theme.colorScheme.onPrimary,
                    fontWeight: FontWeight.w600,
                  ),
              child: widget.confirmText ?? const Text("CONFIRM"),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isChipStyle = widget.useChipsForSelection || widget.shape != null;

    return Dialog(
      elevation: widget.elevation ?? 8.0,
      shape: widget.shape ??
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
      backgroundColor: widget.backgroundColor ?? theme.dialogTheme.backgroundColor ?? theme.colorScheme.surface,
      insetPadding: const EdgeInsets.symmetric(horizontal: 0.0, vertical: 0.0),
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: widget.dialogWidth ?? MediaQuery.of(context).size.width * 0.90,
          maxHeight: widget.dialogHeight ?? MediaQuery.of(context).size.height * 0.90,
          minWidth: 300.0,
        ),
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildHeader(),
            if (widget.showSelectAll) _buildSelectAllButton(),
            Expanded(
              child: isChipStyle ? _buildChipContent() : _buildListContent(),
            ),
            // Divider(height: 1, color: theme.dividerColor),
            _buildActionButtons(),
          ],
        ),
      ),
    );
  }
}