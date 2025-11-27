/// A model class used to represent a selectable item in the multi-selector.
///
/// Example usage:
/// ```dart
/// // Positional constructor (simpler)
/// MultiSelectorItem('value1', 'Label 1')
///
/// // Named constructor (more explicit)
/// MultiSelectorItem(value: 'value1', label: 'Label 1')
/// ```
class MultiSelectorItem<T> {
  final T value;
  final String label;
  bool selected;

  /// Creates a [MultiSelectorItem] with positional parameters.
  ///
  /// This is the simpler way to create items, matching the API of multi_select_flutter.
  MultiSelectorItem(
    this.value,
    this.label, {
    this.selected = false,
  });

  /// Creates a [MultiSelectorItem] with named parameters.
  ///
  /// This provides more clarity when creating items.
  MultiSelectorItem.named({
    required this.value,
    required this.label,
    this.selected = false,
  });

  /// Creates a copy of this item with the given fields replaced with new values.
  MultiSelectorItem<T> copyWith({
    T? value,
    String? label,
    bool? selected,
  }) {
    return MultiSelectorItem(
      value ?? this.value,
      label ?? this.label,
      selected: selected ?? this.selected,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MultiSelectorItem &&
          runtimeType == other.runtimeType &&
          value == other.value &&
          label == other.label;

  @override
  int get hashCode => value.hashCode ^ label.hashCode;

  @override
  String toString() => 'MultiSelectorItem(value: $value, label: $label, selected: $selected)';
}