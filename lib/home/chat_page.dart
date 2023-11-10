import 'package:flutter/material.dart';
import '../core/data.dart';
import 'make_request.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../core/loader.dart';
//import 'package:cloud_firestore/cloud_firestore.dart';

class ChatPage extends StatefulWidget {
  final String response;

  const ChatPage({Key? key, required this.response}) : super(key: key);

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  List<Messages> messages = Data.messages_data;
  final ScrollController _scrollController = ScrollController();
  TextEditingController textEditingController = TextEditingController();
  final Loader _loader = Loader();
  String serverurl = '';
  bool loading = false;
  void _sendMessage(String message) async {
    setState(() {
      loading = true;
      messages.add(Messages(
        role: 'user',
        content: message,
      ));
    });
    DataProcessor sender = DataProcessor(context);
    final List<Map<String, String>> messagesData = messages
        .map((message) => {
              'role': message.role,
              'content': message.content,
            })
        .toList();
    http.Response response =
        await sender.meet_with_server(messagesData.toString());
    if (response.statusCode == 200) {
      final completion = jsonDecode(response.body)['response'].toString();

      setState(() {
        loading = false;
        messages.add(Messages(
          role: 'assistant',
          content: completion,
        ));
      });
    } else {
      // Handle error case
      print('Error: ${response.statusCode}');
      setState(() {
        loading = false;
      });
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('An error occurred try again later'),
            content: Text(response.statusCode.toString()),
            actions: <Widget>[
              TextButton(
                child: const Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }

    // Clear the text input field
    textEditingController.clear();
  }

  @override
  void initState() {
    super.initState();
    _loader.loadMessages().then((message) {
      setState(() {
        Data.messages_data = message;
        messages = message;
      });
    });
    // Scroll to the last message when the page is loaded
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text(
        'Mentor/Chat',
      )),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              controller: _scrollController,
              itemCount: messages.length,
              itemBuilder: (context, index) {
                final message = messages[index];

                return Container(
                    alignment: message.role == 'user'
                        ? Alignment.centerRight
                        : Alignment.centerLeft,
                    child: Container(
                      margin: const EdgeInsets.all(15.0),
                      padding: const EdgeInsets.all(15.0),
                      child: Text(
                        message.content,
                      ),
                      decoration: BoxDecoration(
                        color: message.role == 'user'
                            ? Theme.of(context).secondaryHeaderColor
                            : Theme.of(context).secondaryHeaderColor,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ));
              },
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: textEditingController,
                    style: const TextStyle(
                      fontSize: 16.0,
                    ),
                    decoration: const InputDecoration(
                      filled: true,
                      hintStyle: TextStyle(),
                      hintText: 'Type a message...',
                    ),
                  ),
                ),
                if (loading == true)
                  Container(
                    width: 12.0,
                    height: 12.0,
                    child: CircularProgressIndicator(),
                  )
                else
                  IconButton(
                    icon: const Icon(
                      Icons.send,
                    ),
                    onPressed: () {
                      final message = textEditingController.text.trim();
                      if (message.isNotEmpty) {
                        _sendMessage(message);
                      }
                    },
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
