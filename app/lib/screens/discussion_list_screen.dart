import 'package:chat_app/components/discussion_list.dart';
import 'package:chat_app/providers/discussion_search.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DiscussionListScreen extends StatelessWidget {
  const DiscussionListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const title = 'Discussions';

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 34.0),
          child: _SearchProvider(
              child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(title, style: Theme.of(context).textTheme.headlineLarge),
                  IconButton(onPressed: () {}, icon: const Icon(Icons.add))
                ],
              ),
              _SearchField(),
              //   Consumer<DiscussionSearch>(builder: (context, search, child) {
              //     return DiscussionList(searchTerm: search.value);
              //   })
            ],
          ))),
    );
  }
}

class _SearchField extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final discussionSearch = context.watch<DiscussionSearch>();

    return TextField(
        controller: _controller,
        decoration: InputDecoration(
            hintText: 'Rechercher une discussion',
            hintStyle: Theme.of(context).textTheme.bodyMedium,
            border: Theme.of(context).inputDecorationTheme.border),
        onSubmitted: (value) {
          _controller.clear();
          discussionSearch.value = value;
        });
  }
}

class _SearchProvider extends StatelessWidget {
  const _SearchProvider({required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
      create: (context) => DiscussionSearch(), child: child);
}
