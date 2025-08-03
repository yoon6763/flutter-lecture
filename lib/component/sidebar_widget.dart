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
      width: 320,
      color: theme.colorScheme.surfaceContainerLowest,
      child: Material(
        color: Colors.transparent,
        elevation: 2.0,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.fromLTRB(20.0, 24.0, 20.0, 12.0),
              child: Row(
                children: [
                  Icon(Icons.flutter_dash_rounded),
                  SizedBox(width: 10),
                  Text(
                    "Flutter D' Class",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 13.0),
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xFF6C63FF).withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: const Color(0xFF6C63FF).withOpacity(0.3),
                  ),
                ),
                child: Row(
                  children: [
                    const Icon(
                      Icons.schedule,
                      color: Color(0xFF6C63FF),
                      size: 20,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      '총 ${_sections.length}개 강의',
                      style: const TextStyle(
                        color: Colors.white70,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
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
    var borderRadius = BorderRadius.circular(12.0);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: borderRadius,
          onTap: onTap,
          hoverColor: theme.colorScheme.onSurface.withOpacity(0.04),
          child: Container(
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: isSelected
                  ? section.color.withOpacity(0.1)
                  : Colors.transparent,
              borderRadius: borderRadius,
              border: Border.all(
                color: isSelected ? section.color : Colors.transparent,
                width: 1,
              ),
            ),
            child: Row(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: isSelected
                        ? section.color
                        : Colors.white.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Icon(
                    isSelected ? section.selectedIcon : section.icon,
                    color: Colors.white,
                    size: 24,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        section.title,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight:
                              isSelected ? FontWeight.bold : FontWeight.normal,
                          color: isSelected ? Colors.white : Colors.white70,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      if (section.subtitle.isNotEmpty)
                        Padding(
                          padding: const EdgeInsets.only(top: 2.0),
                          child: Text(
                            section.subtitle,
                            style: TextStyle(
                              fontSize: 11.5,
                              color: isSelected
                                  ? Colors.white.withOpacity(0.7)
                                  : Colors.white54,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
