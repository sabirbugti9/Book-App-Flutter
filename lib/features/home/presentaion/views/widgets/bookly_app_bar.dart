import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BooklyAppBar extends StatelessWidget {
  const BooklyAppBar({
    super.key,
    this.title = 'Keep exploring',
    this.icon = FontAwesomeIcons.circleUser,
    this.onPressed,
    this.showBackArrow = false,
  });

  final String title;
  final IconData icon;
  final Function()? onPressed;
  final bool showBackArrow;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
        child: Row(
          children: [
            if (showBackArrow)
              IconButton(
                icon: Icon(
                  FontAwesomeIcons.chevronLeft,
                  color: Theme.of(context).colorScheme.onSecondary,
                ),
                onPressed: () => Navigator.pop(context),
                iconSize: 32,
              ),
            if (showBackArrow) const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Hi Sabir Bugti!",
                    style: Theme.of(context).textTheme.headlineLarge,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    title,
                    style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                          fontSize: 14,
                        ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            IconButton(
              icon: Icon(
                icon,
                color: Theme.of(context).colorScheme.onSecondary,
              ),
              color: Theme.of(context).colorScheme.onSecondary,
              onPressed: onPressed,
              iconSize: 32,
            ),
          ],
        ),
      ),
    );
  }
}
