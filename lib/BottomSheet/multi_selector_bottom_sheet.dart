import 'package:flutter/material.dart';
import 'package:flutter_multi_selector/Controllers/multi_selector_controller.dart';
import 'package:flutter_multi_selector/Utils/multi_selector_item.dart';

/// A customizable bottom sheet widget for selecting multiple items.
///
/// Provides the same functionality as [MultiSelectorDialog] but presented
/// as a modal bottom sheet with Material 3 styling, including a drag handle
/// and rounded top corners.
///
/// ## Basic Usage
/// ```dart
/// MultiSelectorBottomSheet<String>(
///   items: [MultiSelectorItem("1", "Option 1")],
///   initialValue: ["1"],
///   onConfirm: (values) => print(values),
/// )
/// ```
class MultiSelectorBottomSheet<T> extends StatefulWidget {
  /// The list of items available for selection.
  final List<MultiSelectorItem<T>> items;

  /// The initially selected values (must match values in [items]).
  final List<T> initialValue;

  /// Optional title widget displayed at the top of the sheet.
  final Widget? title;

  /// Callback invoked when selection is confirmed.
  final void Function(List<T>)? onConfirm;

  /// Whether to enable search functionality (defaults to false).
  final bool searchable;

  /// Custom text for the confirm button. Defaults to "DONE".
  final Text? confirmText;

  /// Custom text for the cancel button. Defaults to "CANCEL".
  final Text? cancelText;

  /// The color used for selected items (defaults to theme primary color).
  final Color? selectedColor;

  /// Hint text displayed in the search field.
  final String? searchHint;

  /// Optional builder for custom per-item colors.
  final Color? Function(T)? colorBuilder;

  /// Background color of the bottom sheet.
  final Color? backgroundColor;

  /// Color for unselected items.
  final Color? unselectedColor;

  /// Custom icon for the search button.
  final Icon? searchIcon;

  /// Custom icon for closing search.
  final Icon? closeSearchIcon;

  /// Text style for unselected items.
  final TextStyle? itemsTextStyle;

  /// Text style for selected items.
  final TextStyle? selectedItemsTextStyle;

  /// Text style for search input text.
  final TextStyle? searchTextStyle;

  /// Text style for search hint text.
  final TextStyle? searchHintStyle;

  /// Whether to group selected items separately (defaults to false).
  final bool separateSelectedItems;

  /// Color of the checkbox checkmark.
  final Color? checkColor;

  /// Whether to show Select All / Clear All button (defaults to false).
  final bool showSelectAll;

  /// Text for the Select All button. Defaults to "Select All".
  final String? selectAllText;

  /// Text for the Clear All button. Defaults to "Clear All".
  final String? clearAllText;

  /// Whether to use chips instead of checkboxes (defaults to false).
  final bool useChipsForSelection;

  /// Height of the bottom sheet as a fraction of screen height (0.0 to 1.0).
  /// Defaults to 0.6 (60%).
  final double? heightFraction;

  /// Whether to show the drag handle at the top. Defaults to true.
  final bool showDragHandle;

  /// Creates a multi-selection bottom sheet.
  const MultiSelectorBottomSheet({
    super.key,
    required this.items,
    required this.initialValue,
    this.title,
    this.onConfirm,
    this.searchable = false,
    this.confirmText,
    this.cancelText,
    this.selectedColor,
    this.searchHint,
    this.colorBuilder,
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
    this.showSelectAll = false,
    this.selectAllText,
    this.clearAllText,
    this.useChipsForSelection = false,
    this.heightFraction,
    this.showDragHandle = true,
  });

  @override
  State<MultiSelectorBottomSheet<T>> createState() =>
      _MultiSelectorBottomSheetState<T>();
}

class _MultiSelectorBottomSheetState<T>
    extends State<MultiSelectorBottomSheet<T>> {
  late MultiSelectorController<T> _controller;
  final TextEditingController _searchController = TextEditingController();
  final FocusNode _searchFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _controller = MultiSelectorController<T>(
      items: widget.items,
      initialSelectedValues: widget.initialValue,
      separateSelectedItems: widget.separateSelectedItems,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    _searchController.dispose();
    _searchFocusNode.dispose();
    super.dispose();
  }

  /// Builds a list item with checkbox selection.
  Widget _buildListItem(MultiSelectorItem<T> item) {
    final theme = Theme.of(context);
    final isSelected = item.selected;
    final itemColor =
        widget.colorBuilder?.call(item.value) ??
        widget.selectedColor ??
        theme.colorScheme.primary;

    return InkWell(
      onTap: () => _controller.toggleSelection(item.value),
      borderRadius: BorderRadius.circular(8),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0),
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
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4),
              ),
              onChanged: (checked) => _controller.toggleSelection(item.value),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                item.label,
                style:
                    isSelected
                        ? widget.selectedItemsTextStyle?.copyWith(
                              color: itemColor,
                            ) ??
                            theme.textTheme.bodyLarge?.copyWith(
                              color: itemColor,
                              fontWeight: FontWeight.w600,
                            )
                        : widget.itemsTextStyle ?? theme.textTheme.bodyLarge,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Builds a chip-style selectable item.
  Widget _buildChipItem(MultiSelectorItem<T> item, ThemeData theme) {
    final isSelected = item.selected;
    final color =
        widget.colorBuilder?.call(item.value) ??
        widget.selectedColor ??
        theme.colorScheme.primary;

    return FilterChip(
      selected: isSelected,
      label: Text(
        item.label,
        style:
            isSelected
                ? widget.selectedItemsTextStyle?.copyWith(color: color) ??
                    TextStyle(color: color, fontWeight: FontWeight.w600)
                : widget.itemsTextStyle ??
                    TextStyle(color: theme.colorScheme.onSurface),
      ),
      selectedColor: color.withAlpha(31),
      backgroundColor:
          widget.unselectedColor ??
          theme.colorScheme.surfaceContainerHighest,
      checkmarkColor: color,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
        side: BorderSide(
          color: isSelected ? color : theme.dividerColor,
        ),
      ),
      onSelected: (checked) => _controller.toggleSelection(item.value),
    );
  }

  /// Builds the drag handle.
  Widget _buildDragHandle(ThemeData theme) {
    if (!widget.showDragHandle) return const SizedBox.shrink();

    return Center(
      child: Container(
        margin: const EdgeInsets.only(top: 12, bottom: 4),
        width: 36,
        height: 4,
        decoration: BoxDecoration(
          color: theme.colorScheme.onSurfaceVariant.withAlpha(102),
          borderRadius: BorderRadius.circular(2),
        ),
      ),
    );
  }

  /// Builds the search input field.
  Widget _buildSearchField(ThemeData theme) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: TextField(
        controller: _searchController,
        focusNode: _searchFocusNode,
        autofocus: true,
        style:
            widget.searchTextStyle ??
            TextStyle(fontSize: 16, color: theme.colorScheme.onSurface),
        decoration: InputDecoration(
          hintText: widget.searchHint ?? "Search...",
          hintStyle:
              widget.searchHintStyle ??
              TextStyle(color: theme.hintColor, fontSize: 16),
          prefixIcon:
              widget.searchIcon ?? Icon(Icons.search, color: theme.hintColor),
          suffixIcon: IconButton(
            icon: const Icon(Icons.clear, size: 20),
            onPressed: () {
              _searchController.clear();
              _controller.updateSearchQuery('');
            },
          ),
          contentPadding: const EdgeInsets.symmetric(
            vertical: 12,
            horizontal: 16,
          ),
          filled: true,
          fillColor: theme.colorScheme.surfaceContainerHighest.withAlpha(128),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(
              color: theme.colorScheme.primary,
              width: 2,
            ),
          ),
        ),
        onChanged: _controller.updateSearchQuery,
      ),
    );
  }

  /// Builds the header (title + search toggle).
  Widget _buildHeader(ThemeData theme) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          if (widget.title != null)
            Flexible(
              child: DefaultTextStyle(
                style:
                    theme.textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.w600,
                    ) ??
                    const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                child: widget.title!,
              ),
            ),
          if (widget.searchable)
            IconButton(
              icon:
                  _controller.isSearching
                      ? widget.closeSearchIcon ?? const Icon(Icons.close)
                      : widget.searchIcon ?? const Icon(Icons.search),
              onPressed: () {
                _controller.toggleSearch();
                if (_controller.isSearching) {
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    _searchFocusNode.requestFocus();
                  });
                } else {
                  _searchController.clear();
                }
              },
            ),
        ],
      ),
    );
  }

  /// Builds the Select All / Clear All button.
  Widget _buildSelectAllButton(ThemeData theme) {
    if (!widget.showSelectAll) return const SizedBox.shrink();

    final allSelected = _controller.isAllSelected;
    final String buttonText =
        allSelected
            ? widget.clearAllText ?? "Clear All"
            : widget.selectAllText ?? "Select All";

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
      child: SizedBox(
        width: double.infinity,
        child: OutlinedButton.icon(
          onPressed: () {
            if (allSelected) {
              _controller.deselectAll();
            } else {
              _controller.selectAll();
            }
          },
          icon: Icon(
            allSelected ? Icons.deselect : Icons.select_all,
            size: 18,
          ),
          label: Text(buttonText),
          style: OutlinedButton.styleFrom(
            foregroundColor:
                allSelected
                    ? theme.colorScheme.error
                    : theme.colorScheme.primary,
            side: BorderSide(
              color:
                  allSelected
                      ? theme.colorScheme.error.withAlpha(128)
                      : theme.colorScheme.primary.withAlpha(128),
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            padding: const EdgeInsets.symmetric(vertical: 10),
          ),
        ),
      ),
    );
  }

  /// Builds the scrollable list content (checkbox mode).
  Widget _buildListContent(ThemeData theme) {
    if (_controller.items.isEmpty) {
      return _buildEmptyState(theme);
    }

    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      itemCount: _controller.items.length,
      itemBuilder: (context, index) =>
          _buildListItem(_controller.items[index]),
    );
  }

  /// Builds the scrollable chip content (chip mode).
  Widget _buildChipContent(ThemeData theme) {
    if (_controller.items.isEmpty) {
      return _buildEmptyState(theme);
    }

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Wrap(
        spacing: 8.0,
        runSpacing: 8.0,
        children:
            _controller.items
                .map((item) => _buildChipItem(item, theme))
                .toList(),
      ),
    );
  }

  /// Builds the empty state widget.
  Widget _buildEmptyState(ThemeData theme) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.search_off_rounded,
              size: 48,
              color: theme.hintColor,
            ),
            const SizedBox(height: 12),
            Text(
              "No items found",
              style: theme.textTheme.bodyLarge?.copyWith(
                color: theme.hintColor,
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Builds the action buttons (cancel/done).
  Widget _buildActionButtons(ThemeData theme) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
      child: Row(
        children: [
          Expanded(
            child: OutlinedButton(
              onPressed: () =>
                  Navigator.of(context).pop(widget.initialValue),
              style: OutlinedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 14),
                side: BorderSide(color: theme.dividerColor),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: DefaultTextStyle(
                style:
                    theme.textTheme.bodyLarge?.copyWith(
                      color: theme.colorScheme.onSurface.withAlpha(179),
                      fontWeight: FontWeight.w500,
                    ) ??
                    TextStyle(
                      color: theme.colorScheme.onSurface.withAlpha(179),
                    ),
                child: widget.cancelText ?? const Text("CANCEL"),
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            flex: 2,
            child: FilledButton(
              onPressed: () {
                Navigator.of(context).pop(_controller.selectedValues);
                widget.onConfirm?.call(_controller.selectedValues);
              },
              style: FilledButton.styleFrom(
                backgroundColor:
                    widget.selectedColor ?? theme.colorScheme.primary,
                foregroundColor: theme.colorScheme.onPrimary,
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: DefaultTextStyle(
                style:
                    theme.textTheme.bodyLarge?.copyWith(
                      color: theme.colorScheme.onPrimary,
                      fontWeight: FontWeight.w600,
                    ) ??
                    TextStyle(
                      color: theme.colorScheme.onPrimary,
                      fontWeight: FontWeight.w600,
                    ),
                child: widget.confirmText ?? const Text("DONE"),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isChipStyle = widget.useChipsForSelection;
    final fraction = widget.heightFraction ?? 0.6;

    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Container(
          height: MediaQuery.of(context).size.height * fraction,
          decoration: BoxDecoration(
            color:
                widget.backgroundColor ??
                theme.bottomSheetTheme.backgroundColor ??
                theme.colorScheme.surface,
            borderRadius: const BorderRadius.vertical(
              top: Radius.circular(20),
            ),
          ),
          child: Column(
            children: [
              _buildDragHandle(theme),
              _buildHeader(theme),
              if (_controller.isSearching) _buildSearchField(theme),
              _buildSelectAllButton(theme),
              const Divider(height: 1),
              Expanded(
                child:
                    isChipStyle
                        ? _buildChipContent(theme)
                        : _buildListContent(theme),
              ),
              _buildActionButtons(theme),
            ],
          ),
        );
      },
    );
  }
}
