import 'package:chat_app/components/discussion_list.dart';
import 'package:chat_app/components/discussion_loader.dart';
import 'package:chat_app/models/latest_message.dart';
import 'package:chat_app/providers/discussion_search.dart';
import 'package:chat_app/screens/archived_screen.dart';
import 'package:chat_app/screens/settings_screen.dart';
import 'package:chat_app/services/api_service.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DiscussionScreen extends StatefulWidget {
  const DiscussionScreen({super.key});

  @override
  State<DiscussionScreen> createState() => _DiscussionScreenState();
}

class _DiscussionScreenState extends State<DiscussionScreen> {
  List<LatestMessageModel> _discussionList = [];
  bool _isLoading = false;
  final List<Map<String, dynamic>> _menuItems = [
    {
      'label': 'Réglages',
      'value': 'settings',
      'screen': const SettingsScreen()
    },
    {'label': 'Archivés', 'value': 'archived', 'screen': const ArchivedScreen()}
  ];

  Future<void> fetchLatestMessages() async {
    setState(() {
      _isLoading = true;
    });
    try {
      final response = await ApiService.getLatestMessages();
      setState(() {
        _discussionList = response;
      });
    } catch (error) {
      if (kDebugMode) {
        print('Error $error\n');
      }
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    fetchLatestMessages();
  }

  Map<String, dynamic> findMenuItemByValue(String value) {
    try {
      return _menuItems.where((element) => element['value'] == value).first;
    } catch (error) {
      throw StateError('Value $value not found in menuItems');
    }
  }

  void _switchScreen(String? value) {
    final Widget screen = findMenuItemByValue(value!)['screen'];
    Navigator.push(context, MaterialPageRoute(builder: (context) => screen));
  }

  @override
  Widget build(BuildContext context) {
    const title = 'Discussions';
    final titleStyle =
        Theme.of(context).textTheme.headlineLarge!.copyWith(fontSize: 28.0);
    final dropdownItems = _menuItems
        .map((menuItem) => DropdownMenuItem<String>(
              value: menuItem['value'],
              child: Text(menuItem['label']),
            ))
        .toList();

    return Scaffold(
      body: ChangeNotifierProvider(
          create: (context) => DiscussionSearchProvider(),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 20.0, vertical: 34.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(title, style: titleStyle),
                        const Spacer(),
                        SizedBox(
                            width: 0,
                            child: IconButton(
                                alignment: Alignment.centerRight,
                                iconSize: 28,
                                onPressed: () {},
                                icon: const Icon(Icons.add))),
                        DropdownButton(
                            underline: Container(
                              height: 0,
                              width: 0,
                              color: Colors.transparent,
                            ),
                            iconSize: 28,
                            icon: const Icon(Icons.menu),
                            items: dropdownItems,
                            onChanged: _switchScreen),
                      ],
                    ),
                    const SizedBox(height: 13),
                    _SearchField(),
                  ],
                ),
              ),
              _isLoading
                  ? const DiscussionLoader()
                  : Consumer<DiscussionSearchProvider>(
                      builder: (context, search, child) => DiscussionList(
                          discussionList: _discussionList,
                          searchTerm: search.value))
            ],
          )),
    );
  }
}

class _SearchField extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final discussionSearch = context.watch<DiscussionSearchProvider>();

    return TextField(
        controller: _controller,
        decoration: InputDecoration(
            hintText: 'Rechercher une discussion',
            hintStyle: Theme.of(context).textTheme.bodyMedium,
            border: Theme.of(context).inputDecorationTheme.border),
        onSubmitted: (value) => discussionSearch.value = value);
  }
}
