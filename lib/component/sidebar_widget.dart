import 'package:flutter/material.dart';
import 'package:flutter_lecture/component/sidebar_item.dart';

typedef SidebarItemSelectionCallback = void Function(int pageIndex);

class SidebarWidget extends StatelessWidget {
  final int selectedPageIndex;
  final SidebarItemSelectionCallback onItemSelected;

  final List<SidebarItem> _sidebarItems = const [
    SidebarItem(
        icon: Icons.home_outlined,
        selectedIcon: Icons.home,
        label: '홈',
        pageIndex: 0),
    SidebarItem(
        icon: Icons.school_outlined,
        selectedIcon: Icons.school,
        label: '플러터 소개',
        pageIndex: 1),
    SidebarItem(
        icon: Icons.language,
        selectedIcon: Icons.category,
        label: 'Dart 기초',
        pageIndex: 2),
    SidebarItem(
        icon: Icons.flutter_dash_rounded,
        selectedIcon: Icons.flutter_dash_rounded,
        label: 'Flutter 기초',
        pageIndex: 3),
  ];

  const SidebarWidget({
    super.key,
    required this.selectedPageIndex,
    required this.onItemSelected,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      width: 260,
      color: theme.colorScheme.surfaceContainerLowest,
      child: Material(
        elevation: 2.0,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.fromLTRB(20.0, 24.0, 20.0, 12.0),
              child: Text(
                '강의 메뉴',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _sidebarItems.length,
                itemBuilder: (context, index) {
                  final curItem = _sidebarItems[index];
                  final isSelected = selectedPageIndex == curItem.pageIndex;

                  return _buildListItem(
                    context: context,
                    item: curItem,
                    isSelected: isSelected,
                    onTap: () => onItemSelected(curItem.pageIndex),
                  );
                },
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[Text('powered by Flutter')],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildListItem({
    required BuildContext context,
    required SidebarItem item,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    final theme = Theme.of(context);
    final Color itemColor = isSelected
        ? theme.colorScheme.primary
        : theme.colorScheme.onSurfaceVariant;
    final IconData currentIcon = (isSelected && item.selectedIcon != null)
        ? item.selectedIcon!
        : item.icon;

    return ListTile(
      leading: Icon(currentIcon, color: itemColor),
      title: Text(
        item.label,
        style: TextStyle(
          color: itemColor,
          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
        ),
      ),
      selected: isSelected,
      onTap: onTap,
      selectedTileColor: theme.colorScheme.primaryContainer.withOpacity(0.3),
      hoverColor: theme.colorScheme.onSurface.withOpacity(0.04),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      contentPadding: const EdgeInsets.symmetric(horizontal: 24.0),
      // dense: true,
    );
  }
}
