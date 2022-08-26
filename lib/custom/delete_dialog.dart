import 'package:flutter/material.dart';
import 'package:music_player_project/custom/generic_dialog.dart';

Future<bool> showDeleteDialog(BuildContext context) {
  return showGenericDialog<bool>(
    context: context,
    title: 'Delete this playlist?',
    content: 'Please confirm that you want to remove this playlist.',
    optionsBuilder: () => {
      'No': false,
      'Delete': true,
    },
  ).then(
    (value) => value ?? false,
  );
}
