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

