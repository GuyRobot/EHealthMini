import 'dart:convert';

import 'package:chat/api/ChatbotsApi.dart';
import 'package:chat/api/ChatbotsApiClient.dart';
import 'package:chat/api/ServersApi.dart';
import 'package:chat/api/ServersApiClient.dart';
import 'package:chat/constants.dart';
import 'package:chat/models/ConversationInfo.dart';
import 'package:chat/models/User.dart';
import 'package:flutter/material.dart';

import 'components/body.dart';

class ChatsScreen extends StatefulWidget {
  final String token;
  final User user;

  const ChatsScreen({Key? key, required this.token, required this.user})
      : super(key: key);

  @override
  _ChatsScreenState createState() => _ChatsScreenState();
}

class _ChatsScreenState extends State<ChatsScreen> {
  int _selectedIndex = 1;
  late ServersApiClient _serversApiClient;
  late ChatbotsApiClient _chatbotsApiClient;
  Future<List<ConversationInfo>>? conversationInfos;

  @override
  void initState() {
    super.initState();
    _serversApiClient = ServersApiClient(
      ServersApi.buildAuthDio(widget.token, base: ServersApi.BASE_URL),
      baseUrl: ServersApi.BASE_URL,
    );

    _chatbotsApiClient = ChatbotsApiClient(
      ServersApi.buildDio(),
      baseUrl: ChatbotsApi.BASE_URL,
    );

    conversationInfos = init();
  }

  Future<List<ConversationInfo>> init() async {
    final conversations =
        await _serversApiClient.getConversations(widget.user.id);

    List<ConversationInfo> infos = [];
    for (var element in conversations) {
      final events =
          await _chatbotsApiClient.getConversation(element.conversationId);
      infos.add(
        ConversationInfo(
          element.conversationId,
          events: jsonDecode(events)["events"],
        ),
      );
    }

    print("Conversations: " + conversations.toString());
    print("Conversations Info: " +
        infos.map((e) => e.lastMessage()).toString().toString());

    return infos;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: FutureBuilder<List<ConversationInfo>>(
        future: conversationInfos,
        builder: (context, snapshot) {
          final data = snapshot.data;
          if (snapshot.hasData && data != null) {
            return Body(infos: data,);
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }
          return CircularProgressIndicator();
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: kPrimaryColor,
        child: const Icon(
          Icons.person_add_alt_1,
          color: Colors.white,
        ),
      ),
    );
  }

  BottomNavigationBar buildBottomNavigationBar() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: _selectedIndex,
      onTap: (value) {
        setState(() {
          _selectedIndex = value;
        });
      },
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.messenger), label: "Chats"),
        BottomNavigationBarItem(icon: Icon(Icons.people), label: "People"),
        BottomNavigationBarItem(icon: Icon(Icons.call), label: "Calls"),
        BottomNavigationBarItem(
          icon: CircleAvatar(
            radius: 14,
            backgroundImage: AssetImage("assets/images/user_2.png"),
          ),
          label: "Profile",
        ),
      ],
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: kPrimaryColor,
      automaticallyImplyLeading: false,
      title: const Text("Chats"),
      actions: [
        IconButton(
          icon: const Icon(Icons.search),
          onPressed: () {},
        ),
      ],
    );
  }
}
