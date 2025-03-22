import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BookRate extends StatelessWidget {
  const BookRate({
    super.key,
    required this.textStyle,
    required this.iconSize,
  });

  final TextStyle? textStyle;
  final double? iconSize;
  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.start, children: [
      Icon(
        FontAwesomeIcons.solidStar,
        color: Theme.of(context).colorScheme.primary,
        size: iconSize,
      ),
      const SizedBox(width: 4),
      Text(
        '4.8',
        style: textStyle,
      ),
      const Spacer(),
      Text(
        '(24589)',
        style: textStyle,
      ),
    ]);
  }
}
