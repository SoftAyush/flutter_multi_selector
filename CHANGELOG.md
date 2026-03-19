## [1.2.0] - 2026-03-19

### ✨ Features
- **MultiSelectorBottomSheet**: New bottom sheet selection dialog with Material 3 styling
  - Drag handle at the top for intuitive interaction
  - Rounded top corners (20px radius)
  - Built-in search with filled text field and clear button
  - Select All / Clear All toggle with contextual icons
  - Checkbox and chip selection modes (`useChipsForSelection`)
  - Empty state with icon + text
  - Configurable height via `heightFraction` (defaults to 60%)
  - Done (FilledButton) and Cancel (OutlinedButton) action buttons
- **MultiSelectorBottomSheetField**: FormField wrapper for the bottom sheet
  - Full form validation support (`validator`, `autovalidateMode`)
  - Deletable chip display below the field
  - `isDismissible` and `enableDrag` parameters
  - Custom `buttonBuilder` support
  - All styling parameters from `MultiSelectorDialogField`

### 🐛 Fixes
- **Chip rebuild bug**: Fixed missing `setState` in `MultiSelectorDialogField` — chips now properly rebuild after dialog closes
- **Memory allocation**: Fixed `ListEquality()` being allocated on every list comparison call; now uses `listEquals` from `foundation.dart`

### 🔧 Improvements
- **Removed `collection` dependency**: Replaced `firstWhereOrNull` with a manual null-safe lookup, reducing package footprint
- **Removed dead code**: Deleted unused `MultiSelectorActions` mixin (126 lines)
- **Dark mode support**: Replaced hardcoded colors (`Colors.black87`, `Colors.grey`, etc.) with theme-aware alternatives (`theme.hintColor`, `theme.dividerColor`, `theme.colorScheme.onSurface`)
- **Performance**: Avoided unnecessary `List.from()` copy in controller when search is empty
- **Performance**: Resolved `Theme.of(context)` once per build instead of per list item
- **Controller cleanup**: Added proper `dispose()` override to `MultiSelectorController`
- **Example app**: Added two new BottomSheet examples (searchable list + chip mode with colors)

### ⚠️ Breaking Changes
- Removed `MultiSelectorActions` mixin from public API (was never used internally)
- Removed `collection` dependency — consumers relying on it transitively should add it directly

### Migration from 1.1.x
- If you imported `MultiSelectorActions`, remove the import (the mixin was unused)
- If you depended on `collection` transitively, add it to your own `pubspec.yaml`
- All other APIs remain backward compatible

---

## [1.1.0] - 2025-11-28

### Added
- **isDismissible parameter**: Control whether dialog can be dismissed by tapping outside (defaults to `true`)
- **Positional constructor for MultiSelectorItem**: Simpler API - `MultiSelectorItem(value, label)`
- **Named constructor for MultiSelectorItem**: Alternative syntax - `MultiSelectorItem.named(value: ..., label: ...)`
- **copyWith method for MultiSelectorItem**: Create modified copies of items
- **Equality operators for MultiSelectorItem**: Proper `==` and `hashCode` implementation
- **toString method for MultiSelectorItem**: Better debugging experience

### Fixed
- **Select All with Search**: Fixed issue where "Select All" would select hidden items when searching. Now it only selects the visible (filtered) items.
- **Validation Timing**: Fixed validation triggering immediately on build. Now it respects `AutovalidateMode` correctly (e.g., `onUserInteraction`).
- **Error Styling**: Fixed issue where the field text color didn't change to the error color when validation failed.
- **Form validation display**: Errors now show when form is submitted without user interaction
- **AutovalidateMode support**: All modes work correctly (disabled, always, onUserInteraction, onUnfocus)
- **Import Errors**: Fixed `Target of URI doesn't exist` errors by correcting import paths to match snake_case filenames.

### Changed
- **MultiSelectorItem API**: Supports both positional and named constructors
- **Example app**: Updated to use simpler positional constructor syntax

### Migration from 1.0.x
Fully backward compatible. Optionally simplify code:
```dart
// Before: MultiSelectorItem(value: 'a', label: 'A')
// After:  MultiSelectorItem('a', 'A')
```

## [1.0.5] - 2025-11-24

### Optimized
- **State Management**: Refactored internal logic to use `MultiSelectorController` for better performance and separation of concerns.
- **Performance**: Improved rendering efficiency by replacing `setState` with `AnimatedBuilder` in `MultiSelectorDialog`.
- **Code Quality**: Reduced boilerplate and improved readability.

### Fixed
- **MultiSelectorDialogField**: Added missing parameters `useChipsForSelection` and `separateSelectedItems` to the field widget.
- **UI Overlap**: Fixed issue where "Select" text overlapped with label when selection was empty.
- **Error Styling**: "Select" text now turns red when validation fails.

## [1.0.4] - 2025-01-24

### Fixes
- **Auto validateMode behavior**: Fixed `AutovalidateMode.onUserInteraction` to properly respect user interaction state
  - Error borders now only appear after user has interacted with the field, not immediately on app startup
  - Follows Flutter's standard FormField validation behavior
  - Resolves issue where validation errors were shown prematurely
- **User interaction tracking**: Implemented proper interaction state management for validation timing

## [1.0.3] - 2025-08-01

### Fixes
- Fixed auto-back bug when item selected
- Enhanced and optimized code

## [1.0.2] - 2025-08-01

### Fixes
- Fixed dialog constraints: Resolved BoxConstraints normalization error by ensuring minWidth ≤ maxWidth
- Dialog dimensions: Corrected dialogHeight and dialogWidth parameter handling
- Padding: Fixed dialogPadding not being properly applied to dialog content
- Elevation: Ensured dialogElevation is correctly passed to the Dialog widget
- State management: Improved handling of initialValue updates

## [1.0.1] - 2025-06-19

### Fixed
- Duplicate values in MultiSelect: Resolved an issue where selected items appeared multiple times
- Spacing issue: Fixed unwanted additional spacing below the MultiSelect widget
- State initialization: Improved handling of `initialValue` and `state.value` to prevent conflicts

### Notes
- Backward compatible with v1.0.0
- No migration steps required

## [1.0.0] - 2025-06-18

### ⚠️ Breaking Changes
- Flutter SDK requirement updated to `>=3.27.0` (requires Dart `^3.7.0`)
- `InputDecoration` support added
- "Deselect All" text customization introduced

### Fixes & Improvements
- Select All / Deselect All text now accepts only `String` for better consistency
- Codebase optimized with minor refinements and cleanup

## [0.0.3] - 2025-06-17
- Added MIT License

## [0.0.2] - 2025-06-17
- Updated changelog

## [0.0.1] - 2025-06-17
- Initial release of flutter_multi_selector package
