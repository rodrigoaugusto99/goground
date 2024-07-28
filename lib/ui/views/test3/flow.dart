import 'package:flutter/material.dart';

class FlowMenu extends StatefulWidget {
  const FlowMenu({super.key});

  @override
  State<FlowMenu> createState() => _FlowMenuState();
}

class _FlowMenuState extends State<FlowMenu>
    with SingleTickerProviderStateMixin {
  late AnimationController menuAnimation;
  IconData lastTapped = Icons.notifications;
  final List<IconData> menuItems = <IconData>[
    Icons.home,
    Icons.new_releases,
    Icons.notifications,
    Icons.menu,
  ];

  void _updateMenu(IconData icon) {
    if (icon != Icons.menu) {
      setState(() => lastTapped = icon);
    }
  }

  @override
  void initState() {
    super.initState();
    menuAnimation = AnimationController(
      duration: const Duration(milliseconds: 250),
      vsync: this,
    );
  }

  Widget flowMenuItem(IconData icon) {
    final double buttonDiameter = MediaQuery.of(context).size.width / 7;
    return FloatingActionButton(
      backgroundColor: lastTapped == icon ? Colors.amber[700] : Colors.blue,
      shape: const CircleBorder(),
      onPressed: () {
        _updateMenu(icon);
        menuAnimation.status == AnimationStatus.completed
            ? menuAnimation.reverse()
            : menuAnimation.forward();
      },
      child: Icon(
        icon,
        color: Colors.white,
        size: 45.0,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Flow(
        delegate: FlowMenuDelegate(menuAnimation: menuAnimation),
        children: menuItems
            .map<Widget>((IconData icon) => flowMenuItem(icon))
            .toList(),
      ),
    );
  }
}

class FlowMenuDelegate extends FlowDelegate {
  FlowMenuDelegate({required this.menuAnimation})
      : super(repaint: menuAnimation);

  final Animation<double> menuAnimation;

  @override
  bool shouldRepaint(FlowMenuDelegate oldDelegate) {
    return menuAnimation != oldDelegate.menuAnimation;
  }

  @override
  void paintChildren(FlowPaintingContext context) {
    for (int i = 0; i < context.childCount; ++i) {
      double dx = 0.0;
      double dy = 0.0;

      switch (i) {
        case 0:
          dx = context.getChildSize(i)!.width * menuAnimation.value * 1.2;
          dy = 0;
          break;
        case 1:
          dx = context.getChildSize(i)!.width * menuAnimation.value * 1.2;
          dy = context.getChildSize(i)!.height * menuAnimation.value * 1;
          break;
        case 2:
          dx = 0.0;
          dy = context.getChildSize(i)!.height * menuAnimation.value;
          break;
        default:
          dx = 1;
          dy = 1;
          break;
      }
      context.paintChild(
        i,
        transform: Matrix4.translationValues(dx, dy, 0),
      );
    }
  }
}
