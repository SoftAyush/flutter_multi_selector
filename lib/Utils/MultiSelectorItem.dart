class MultiSelectorItem<T> {
  final T value;
  final String label;
  bool selected;

  MultiSelectorItem({
    required this.value,
    required this.label,
    this.selected = false,
  });
}