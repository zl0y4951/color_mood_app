import 'package:flutter/material.dart';

class BottomAppBarItem extends StatelessWidget {
  const BottomAppBarItem({
    super.key,
    this.callback,
    required this.icon,
    this.selected = false,
    required this.enabled,
    required this.disabledIconColor,
  });
  final VoidCallback? callback;
  final IconData icon;
  final bool selected, enabled;
  final Color disabledIconColor;

  @override
  Widget build(BuildContext context) {
    final bottomTheme = Theme.of(context).bottomNavigationBarTheme;
    return Expanded(
      child: IconButton(
          isSelected: selected,
          onPressed: enabled ? callback : null,
          selectedIcon: Icon(
            icon,
            size: bottomTheme.selectedIconTheme?.size,
            color: enabled ? bottomTheme.selectedItemColor : disabledIconColor,
          ),
          icon: Icon(
            icon,
            size: bottomTheme.unselectedIconTheme?.size,
            color:
                enabled ? bottomTheme.unselectedItemColor : disabledIconColor,
          )),
    );
  }
}
