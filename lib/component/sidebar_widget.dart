import 'package:flutter/material.dart';
import 'package:flutter_lecture/models/section.dart';

typedef SidebarItemSelectionCallback = void Function(int pageIndex);

class SidebarWidget extends StatelessWidget {
  final int selectedPageIndex;
  final SidebarItemSelectionCallback onItemSelected;
  final List<Section> _sections;

  const SidebarWidget({
    super.key,
    required this.selectedPageIndex,
    required this.onItemSelected,
    required List<Section> sections,
  }) : _sections = sections;

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
                '플러터 입문 강의',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _sections.length,
                itemBuilder: (context, index) {
                  final curSection = _sections[index];
                  final isSelected = selectedPageIndex == index;

                  return _buildListItem(
                    context: context,
                    section: curSection,
                    isSelected: isSelected,
                    onTap: () => onItemSelected(index),
                  );
                },
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[Text('✨ powered by Flutter')],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildListItem({
    required BuildContext context,
    required Section section,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    final theme = Theme.of(context);
    final Color itemColor = isSelected
        ? theme.colorScheme.primary
        : theme.colorScheme.onSurfaceVariant;
    final IconData currentIcon =
        isSelected ? section.selectedIcon : section.icon;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
      child: ListTile(
        leading: Icon(currentIcon, color: itemColor),
        title: Text(
          section.title,
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
      ),
    );
  }
}
