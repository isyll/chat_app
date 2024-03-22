import 'package:chat_app/screens/archived.dart';
import 'package:chat_app/screens/settings.dart';

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
