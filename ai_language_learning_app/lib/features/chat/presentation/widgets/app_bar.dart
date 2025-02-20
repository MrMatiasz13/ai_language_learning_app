import 'package:flutter/material.dart';

class Aplicationbar extends StatelessWidget implements PreferredSizeWidget {
  final Text title;
  final void Function()? leadingVoid;
  final void Function()? actionsVoid;

  const Aplicationbar({
    super.key,
    required this.title,
    this.leadingVoid,
    this.actionsVoid,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: title,
      centerTitle: true,
      backgroundColor: Theme.of(context).colorScheme.surface,
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(1),
        child: Container(
          color: Theme.of(context).colorScheme.primary,
          height: 1,
        ),
      ),
      leading: IconButton(
        onPressed: leadingVoid,
        icon: Icon(Icons.menu_rounded),
      ),
      actions: [
        IconButton(
          onPressed: actionsVoid,
          icon: Icon(Icons.add_box_outlined),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
