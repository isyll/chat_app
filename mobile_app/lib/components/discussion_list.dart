import 'package:chat_app/components/discussion_item.dart';
import 'package:chat_app/models/latest_message.dart';
import 'package:flutter/material.dart';

class DiscussionList extends StatelessWidget {
  const DiscussionList(
      {super.key, required this.searchTerm, required this.discussionList});

  final List<LatestMessageModel> discussionList;

  final String searchTerm;

  @override
  Widget build(BuildContext context) {
    final divider = Divider(
      color: Theme.of(context).colorScheme.tertiary,
      height: 2,
      thickness: 1,
    );
    final items = LatestMessageModel.filter(searchTerm, discussionList)
        .map((m) => DiscussionItem(message: m))
        .toList();

    return Expanded(
        child: ListView.separated(
      padding: const EdgeInsets.all(0.0),
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      separatorBuilder: (context, index) => divider,
      itemBuilder: (context, index) => Padding(
        padding: EdgeInsets.only(
            top: index == 0 ? 0 : 14.0,
            bottom: index + 1 == items.length ? 32.0 : 14.0,
            left: 22.0,
            right: 22.0),
        child: items[index],
      ),
      itemCount: items.length,
    ));
  }
}
