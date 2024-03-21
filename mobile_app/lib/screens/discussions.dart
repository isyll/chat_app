import 'package:chat_app/components/discussion_list.dart';
import 'package:chat_app/providers/discussion_search.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DiscussionScreen extends StatelessWidget {
  const DiscussionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const title = 'Discussions';

    return Scaffold(
      body: ChangeNotifierProvider(
          create: (context) => DiscussionSearch(),
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
              Consumer<DiscussionSearch>(
                  builder: (context, search, child) =>
                      DiscussionList(searchTerm: search.value))
            ],
          )),
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
        onSubmitted: (value) => discussionSearch.value = value);
  }
}
