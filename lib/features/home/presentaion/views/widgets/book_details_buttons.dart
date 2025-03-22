import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';

class BottomButtons extends StatelessWidget {
  final BuildContext context;
  final String downloadLink;
  final String previewLink;

  const BottomButtons({required this.context, required this.downloadLink, required this.previewLink});



  @override
  Widget build(BuildContext context) {
    bool downloadAval = true;
    bool previewAval = true;
    if (downloadLink == '') {
      downloadAval = false;
    }
    if (previewLink == '') {
      previewAval = false;
    }
    return Row(
      children: [
        Expanded(
          child: TextButton(
            style: _buttonStyle(
              context,
              left: 16,
              color: Theme.of(context).colorScheme.primary,
            ),
            onPressed: () {
              launchUrlString(downloadLink);
            },
            child:  Text(
              downloadAval ? "Download" : "Download Not Available",
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ),
        Expanded(
          child: TextButton(
            style: _buttonStyle(
              context,
              right: 16,
              color: Theme.of(context).colorScheme.tertiary,
            ),
            onPressed: () {
              launchUrlString(previewLink);
            },
            child: Text(
              previewAval ? "Preview" : "Preview Not Available",
              style: TextStyle(color: Theme.of(context).colorScheme.primary),
            ),
          ),
        ),
      ],
    );
  }

  ButtonStyle _buttonStyle(BuildContext context,
      {double? left, double? right, required Color color}) {
    return TextButton.styleFrom(
      backgroundColor: color,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(left != null ? 16 : 0),
          bottomLeft: Radius.circular(left != null ? 16 : 0),
          topRight: Radius.circular(right != null ? 16 : 0),
          bottomRight: Radius.circular(right != null ? 16 : 0),
        ),
      ),
      minimumSize: const Size(0, 48),
    );
  }
}