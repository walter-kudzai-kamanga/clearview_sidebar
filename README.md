# clearview_sidebar

A customizable sidebar widget for Flutter apps providing easy navigation and persistent drawers.

[![pub package](https://img.shields.io/pub/v/clearview_sidebar.svg)](https://pub.dev/packages/clearview_sidebar)
[![license](https://img.shields.io/badge/license-MIT-blue.svg)](LICENSE)

## Getting started

Add this package to your `pubspec.yaml`:

```yaml
dependencies:
  clearview_sidebar: ^0.0.1
```

Import the package:

```dart
import 'package:clearview_sidebar/clearview_sidebar.dart';
```

## Quick example

Here's a minimal example — adjust to your package API if names differ:

```dart
import 'package:flutter/material.dart';
import 'package:clearview_sidebar/clearview_sidebar.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Row(
          children: [
            ClearviewSidebar(
              width: 260,
              items: [
                SidebarItem(icon: Icons.home, label: 'Home', onTap: () {}),
                SidebarItem(icon: Icons.settings, label: 'Settings', onTap: () {}),
              ],
            ),
            Expanded(child: Center(child: Text('Main content goes here'))),
          ],
        ),
      ),
    );
  }
}
```

## Features

- Lightweight, customizable sidebar widget
- Icons, labels, headers, and nested items
- Theming friendly (colors, sizes, animations)
- Responsive behavior for mobile & desktop

## Public API (summary)

- `ClearviewSidebar` — main widget to add a sidebar
- `SidebarItem` — represents an entry (icon, label, callback)
- Common props: `width`, `backgroundColor`, `items`, `selectedIndex`, `onItemSelected`

Adapt these names to match the actual exported API in your package.

## Example app

Provide a working demo in the `example/` folder and link to it from here.

## Contributing

- Fork the repo and open a branch for your change.
- Add tests where relevant and ensure `flutter test` passes.
- Follow semantic versioning for public API changes.

## Changelog

## License

This project is licensed under the MIT License — see the LICENSE file for details.

```bash
flutter pub publish --dry-run
```

Then publish:

```bash
flutter pub publish
```
