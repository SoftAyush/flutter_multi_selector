import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_multi_selector/Controllers/multi_selector_controller.dart';
import 'package:flutter_multi_selector/Utils/multi_selector_item.dart';

void main() {
  group('MultiSelectorController', () {
    late List<MultiSelectorItem<String>> items;

    setUp(() {
      items = [
        MultiSelectorItem('1', 'Apple'),
        MultiSelectorItem('2', 'Banana'),
        MultiSelectorItem('3', 'Cherry'),
      ];
    });

    test('initialization sets selected values correctly', () {
      final controller = MultiSelectorController(
        items: items,
        initialSelectedValues: ['1', '3'],
      );

      expect(controller.selectedValues, containsAll(['1', '3']));
      expect(controller.items.firstWhere((i) => i.value == '1').selected, isTrue);
      expect(controller.items.firstWhere((i) => i.value == '2').selected, isFalse);
    });

    test('toggleSelection updates state', () {
      final controller = MultiSelectorController(
        items: items,
        initialSelectedValues: [],
      );

      controller.toggleSelection('1');
      expect(controller.selectedValues, contains('1'));
      expect(controller.items.firstWhere((i) => i.value == '1').selected, isTrue);

      controller.toggleSelection('1');
      expect(controller.selectedValues, isNot(contains('1')));
      expect(controller.items.firstWhere((i) => i.value == '1').selected, isFalse);
    });

    test('selectAll selects all items', () {
      final controller = MultiSelectorController(
        items: items,
        initialSelectedValues: [],
      );

      controller.selectAll();
      expect(controller.selectedValues.length, 3);
      expect(controller.isAllSelected, isTrue);
    });

    test('deselectAll deselects all items', () {
      final controller = MultiSelectorController(
        items: items,
        initialSelectedValues: ['1', '2', '3'],
      );

      controller.deselectAll();
      expect(controller.selectedValues, isEmpty);
      expect(controller.isAllSelected, isFalse);
    });

    test('search filters items', () {
      final controller = MultiSelectorController(
        items: items,
        initialSelectedValues: [],
      );

      controller.updateSearchQuery('ap');
      expect(controller.items.length, 1);
      expect(controller.items.first.label, 'Apple');

      controller.updateSearchQuery('z');
      expect(controller.items, isEmpty);
    });

    test('separateSelectedItems groups selected items first', () {
      final controller = MultiSelectorController(
        items: items,
        initialSelectedValues: ['2'], // Banana
        separateSelectedItems: true,
      );

      // Expected order: Selected (Banana) then Unselected (Apple, Cherry)
      // Note: The controller sorts alphabetically within groups.
      // Selected: Banana
      // Unselected: Apple, Cherry
      
      expect(controller.items[0].label, 'Banana');
      expect(controller.items[1].label, 'Apple');
      expect(controller.items[2].label, 'Cherry');
    });
  });
}
