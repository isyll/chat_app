import 'package:chat_app/screens/archived_screen.dart';
import 'package:chat_app/screens/settings_screen.dart';

const List<Map<String, dynamic>> menuItems =
[
    {
        'label': 'Réglages',
        'value': 'settings',
        'screen': SettingsScreen()
    },
    {
        'label': 'Archivés',
        'value': 'archived',
        'screen': ArchivedScreen()

    }
];
