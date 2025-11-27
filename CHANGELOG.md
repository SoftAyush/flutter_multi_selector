## [1.1.0] - 2025-11-27

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

### Technical Details
- Added `_hasInteracted` boolean to track user interaction state
- Updated error display logic to consider both validation state and interaction history
- Modified border colors, text colors, and icon colors to respect interaction-based validation
- Enhanced validation trigger logic for better user experience

## [1.0.3] -  2025-08-1

### Fixes
- when selected then auto back bug fix
- Enhance and optimized the code

## [1.0.2] -  2025-08-1

### Fixes
- Fixed dialog constraints: Resolved BoxConstraints normalization error by ensuring minWidth ≤ maxWidth
- Dialog dimensions: Corrected dialogHeight and dialogWidth parameter handling
- Padding: Fixed dialogPadding not being properly applied to dialog content
- Elevation: Ensured dialogElevation is correctly passed to the Dialog widget
- State management: Improved handling of initialValue updates


## [1.0.1] -  2025-06-19

### Fixed
- Duplicate values in MultiSelect: Resolved an issue where selected items appeared multiple times
- Spacing issue: Fixed unwanted additional spacing below the MultiSelect widget
- State initialization: Improved handling of `initialValue` and `state.value` to prevent conflicts

### Changed
- Optimized internal item selection logic to prevent duplicates
- Adjusted widget padding and layout constraints

### Notes
- Backward compatible with v1.0.0
- No migration steps required

## [1.0.0] - 2025-06-18

### ⚠️ Breaking Changes
- ⬆️ Flutter SDK requirement updated to `>=3.27.0` (requires Dart `^3.7.0`).
- ✨ `InputDecoration` support added — existing implementations may need to update.
- ✨ "Deselect All" text customization introduced — may require updates in existing usage.

### 🛠️ Fixes & Improvements
- ✅ Select All / Deselect All text now accepts only `String` for better consistency.
- 🧹 Codebase optimized with minor refinements and cleanup.


## [0.0.3] - 2025-06-17
### Changed
- add MIT License

## [0.0.2] - 2025-06-17
## Changed
- update changelog

## [0.0.1] - 2025-06-17
## Added
- Creation of flutter_Multi_Selector package.

