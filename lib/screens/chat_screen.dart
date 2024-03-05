import 'package:chatgpt_clone/constants/constants.dart';
import 'package:chatgpt_clone/services/api_services.dart';
import 'package:chatgpt_clone/services/assets_manager.dart';
import 'package:chatgpt_clone/services/services.dart';
import 'package:chatgpt_clone/widgets/chat_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final bool _isTyping = true;

  //NOTE after initializing textEditingController you need to hot restart the applicton.

  late TextEditingController textEditingController;

  @override
  void initState() {
    textEditingController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(Assetmanager.openaiLogo),
        ),
        title: const Text(
          "chatGPT",
          style: TextStyle(color: Colors.white),
        ),
        //adding the more info icon button.
        actions: [
          IconButton(
            onPressed: () async {
              //this i how you call an async class previously defined.
              //then Hot retart the app
             await Services.showModelSheet(context: context);
            },
            icon: const Icon(
              Icons.more_vert_rounded,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            //flexibble fixes overflow error
            Flexible(
              child: ListView.builder(
                  itemCount: 6,
                  itemBuilder: (context, index) {
                    return ChatWidget(
                      msg: chatMessages[index]["msg"].toString(),
                      chatIndex: int.parse(
                        chatMessages[index]["chatIndex"].toString(),
                      ),
                    );
                  }),
            ),
            //if staement for the loding aninmations
            if (_isTyping) ...[
              const SpinKitThreeBounce(
                color: Colors.white,
                size: 18,
              ),
              // add some spacing between the widgets
              const SizedBox(
                height: 15,
              ),
              Material(
                color: cardColor,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          //color of the writen text
                          style: const TextStyle(color: Colors.white),
                          controller: textEditingController,
                          onSubmitted: (value) {
                            //TODO Send message
                          },
                          //decorations
                          decoration: const InputDecoration.collapsed(
                            hintText: "How can I help you?",
                            hintStyle: TextStyle(color: Colors.grey),
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: () async {
                          {
                            try {
                              await ApiServices.getModels();
                            } catch (error) {
                              print("error $error");
                            }
                          }
                        },
                        icon: const Icon(
                          Icons.send,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
//30:00
