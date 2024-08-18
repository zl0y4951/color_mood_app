import 'package:color_mood_app/src/core/widgets/bottom_app_bar_item.dart';
import 'package:flutter/material.dart';

class CustomBottomAppBar extends StatelessWidget {
  const CustomBottomAppBar({
    super.key,
    this.disabledIconColor = Colors.white24,
    this.onChanged,
    required this.items,
    this.currentIndex = 0,
  });
  final Color disabledIconColor;
  final ValueChanged<int>? onChanged;
  final List<BottomItem> items;
  final int currentIndex;

  Widget _itemToWidget((int index, BottomItem item) record) {
    return BottomAppBarItem(
      icon: record.$2.icon,
      enabled: record.$2.enabled,
      disabledIconColor: disabledIconColor,
      selected: record.$1 == currentIndex,
      callback: () => onChanged?.call(record.$1),
    );
  }

  @override
  Widget build(BuildContext context) {
    final bottomTheme = Theme.of(context).bottomNavigationBarTheme;
    return BottomAppBar(
      color: bottomTheme.backgroundColor,
      padding: EdgeInsets.all(8),
      child: Row(
        children: items.indexed.map(_itemToWidget).toList(growable: false),
      ),
    );
  }
}

class BottomItem {
  final IconData icon;
  final bool enabled;

  const BottomItem({required this.icon, this.enabled = true});
}
