import 'package:chat_app/components/discussion_list.dart';
import 'package:chat_app/components/discussion_loader.dart';
import 'package:chat_app/models/latest_message.dart';
import 'package:chat_app/providers/discussion_search.dart';
import 'package:chat_app/services/api.dart';
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

  Future<void> _fetchLatestMessages() async {
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
    _fetchLatestMessages();
  }

  @override
  Widget build(BuildContext context) {
    const title = 'Discussions';

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
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(title,
                            style: Theme.of(context)
                                .textTheme
                                .headlineLarge!
                                .copyWith(fontSize: 28.0)),
                        IconButton(
                            onPressed: () {}, icon: const Icon(Icons.add))
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
