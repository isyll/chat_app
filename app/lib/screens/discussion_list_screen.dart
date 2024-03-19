import 'package:flutter/material.dart';

class DiscussionListScreen extends StatelessWidget {
  const DiscussionListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const title = 'Discussions';

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 34.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(title, style: Theme.of(context).textTheme.headlineLarge),
                  IconButton(onPressed: () {}, icon: const Icon(Icons.add))
                ],
              )
            ],
          )),
    );
  }
}

class _FindDiscussion extends StatelessWidget {
  const _FindDiscussion({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
