import 'dart:convert';

import 'package:chat_app/components/discussion_item.dart';
import 'package:chat_app/models/latest_message.dart';
import 'package:chat_app/services/api.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class DiscussionList extends StatefulWidget {
  const DiscussionList({super.key, required this.searchTerm});

  final String searchTerm;

  @override
  State<DiscussionList> createState() => _DiscussionListState();
}

class _DiscussionListState extends State<DiscussionList> {
  List<LatestMessageModel> _discussionList = [];
  bool _isLoading = false;
  bool _error = false;

  String get searchTerm => widget.searchTerm;

  Future<void> _fetchLatestMessages() async {
    setState(() {
      _isLoading = true;
      _error = false;
    });
    try {
      final response = await ApiService.getLatestMessages();
      if (response.statusCode == 200) {
        setState(() {
          final data = jsonDecode(response.body) as List<LatestMessageModel>;
          _discussionList = data;
        });
      } else {
        throw Exception('http code ${response.statusCode}');
      }
    } catch (error) {
      _error = true;
      if (kDebugMode) {
        print('Error $error\n');
      }
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  List<Widget> getDiscussionItems() =>
      _discussionList.map((item) => DiscussionItem(message: item)).toList();

  @override
  void initState() {
    super.initState();
    _fetchLatestMessages();
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const Expanded(
          child: Center(
        child: Text('Liste des messages...'),
      ));
    }

    final divider = Divider(
      color: Theme.of(context).colorScheme.tertiary,
      height: 2,
      thickness: 1,
    );
    final items = getDiscussionItems();

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
