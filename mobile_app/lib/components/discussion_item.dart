import 'package:chat_app/models/latest_message.dart';
import 'package:chat_app/utils/string.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DiscussionItem extends StatelessWidget {
  const DiscussionItem({super.key, required this.message});

  final LatestMessageModel message;

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).colorScheme.primary;
    final headlineSmall = Theme.of(context).textTheme.headlineSmall;

    return Row(
      children: [
        CircleAvatar(
          backgroundColor: Colors.white,
          child: Image.asset('assets/icons8-avatar-96.png'),
        ),
        const SizedBox(width: 10.0),
        Column(
            mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (message.unread != 0)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    message.user.name,
                    style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                        color: primaryColor, fontWeight: FontWeight.normal),
                  ),
                  Container(
                    width: 24,
                    height: 24,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: primaryColor),
                    child: Center(
                      child: Text(
                        message.unread.toString(),
                        style: headlineSmall,
                      ),
                    ),
                  )
                ],
              ),
            if (message.unread == 0)
              Text(
                message.user.name,
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            Flexible(child: Text(truncateString(message.content, 65)))
          ],
        )
      ],
    );
  }
}