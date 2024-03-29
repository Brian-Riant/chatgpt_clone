import 'package:chatgpt_clone/constants/constants.dart';
import 'package:chatgpt_clone/services/assets_manager.dart';
import 'package:chatgpt_clone/widgets/text_widget.dart';
import 'package:flutter/material.dart';

class ChatWidget extends StatelessWidget {
  const ChatWidget({super.key, required this.msg, required this.chatIndex, required bool shouldAnimate});

  // import the dummy json messages by innitializing the constants
  final String msg;
  final int chatIndex;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Material(
          color:
              //use if the chatindex ==0 then scaffoldbackground ==cardcolor.
              chatIndex == 0 ? scaffoldBackgroundColor : cardColor,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              //add a crossalignment at the start
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  chatIndex == 0
                      ? Assetmanager.userImage
                      : Assetmanager.botImage,
                  //exeption error solved by adding the two parameters height and width
                  height: 30,
                  width: 30,
                ),
                //add some spacing
                const SizedBox(
                  width: 8,
                ),
                // use of the text widget made earier
                Expanded(
                  child: TextWidget(label: msg),
                ),
                chatIndex == 0 ? const SizedBox.shrink()
                :const Row(mainAxisAlignment: MainAxisAlignment.end,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.thumb_up_alt_outlined,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Icon(
                            Icons.thumb_down_alt_outlined,
                            color: Colors.white,
                          )
                        ],
                      ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
