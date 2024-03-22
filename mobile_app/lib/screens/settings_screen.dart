import 'package:chat_app/config/constants.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  late bool _isDark;
  late String _locale;

  Map<String, String> getLocale(String value) =>
      Constants.locales.where((locale) => locale['lang'] == value).first;

  @override
  void initState() {
    super.initState();
    // recupérer les données
    _isDark = false;
    _locale = 'fr';
  }

  @override
  Widget build(BuildContext context) {
    final titleStyle =
        Theme.of(context).textTheme.headlineLarge!.copyWith(fontSize: 28.0);
    final labelStyle = Theme.of(context)
        .textTheme
        .headlineSmall!
        .copyWith(fontWeight: FontWeight.normal, fontSize: 20);
    final divider = Divider(
      color: Theme.of(context).colorScheme.tertiary,
      height: 2,
      thickness: 1,
    );
    final settingItems = [
      [
        Text(
          'Thème sombre',
          style: labelStyle,
        ),
        Switch(
          value: _isDark,
          onChanged: (value) => setState(() {
            _isDark = value;
          }),
        )
      ],
      [
        Text(
          'Langue',
          style: labelStyle,
        ),
        DropdownMenu(
            onSelected: (value) => setState(() {
                  _locale = value!;
                }),
            label: Text(getLocale(_locale)['label']!),
            dropdownMenuEntries: Constants.locales
                .map((locale) => DropdownMenuEntry(
                    value: locale['lang'], label: locale['label']!))
                .toList())
      ]
    ];

    return Scaffold(
        body: Column(
      children: [
        Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 34.0),
            child: Row(
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.arrow_back_ios)),
                Text(
                  'Réglages',
                  style: titleStyle,
                )
              ],
            )),
        Expanded(
            child: ListView.separated(
          padding: EdgeInsets.zero,
          itemCount: settingItems.length,
          separatorBuilder: (context, index) => divider,
          itemBuilder: (context, index) => Padding(
            padding:
                const EdgeInsets.only(right: 40, left: 40, top: 10, bottom: 10),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: settingItems[index]),
          ),
        ))
      ],
    ));
  }
}
