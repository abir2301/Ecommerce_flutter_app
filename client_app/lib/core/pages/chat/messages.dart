import 'package:chat_bubbles/bubbles/bubble_special_three.dart';
import 'package:e_commerce_example_flutter/core/constants/theme/colors.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../../constant/color_constant.dart';
import '../../constant/image_constant.dart';
import '../../constant/math_utils.dart';
import '../home/model/chat_message.dart';

class Messages extends StatefulWidget {
  const Messages({super.key});

  @override
  State<Messages> createState() => _MessagesState();
}

class _MessagesState extends State<Messages> {
  List<Message> messages = [
    Message(
        Text: "Hello !!!",
        date: DateTime.now().subtract(Duration(minutes: 1)),
        isSentByMe: false),
    Message(
        Text: "how can i help you ",
        date: DateTime.now().subtract(Duration(minutes: 1)),
        isSentByMe: false),
  ].reversed.toList();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.pink,
          title: Text(
            'chat',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
        ),
        body: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            Expanded(
                child: GroupedListView<Message, DateTime>(
              reverse: true,
              useStickyGroupSeparators: true,
              floatingHeader: true,
              order: GroupedListOrder.DESC,
              padding: const EdgeInsets.all(8),
              elements: messages,
              groupBy: (message) => DateTime(
                  message.date.year, message.date.month, message.date.day),
              groupHeaderBuilder: (Message message) => SizedBox(
                height: 40,
                child: Card(
                  color: Color(0xFF1B97F3),
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Text(DateFormat.yMMMd().format(message.date)),
                  ),
                ),
              ),
              itemBuilder: (context, Message message) => BubbleSpecialThree(
                  isSender: message.isSentByMe,
                  color: message.isSentByMe ? Color(0xFF1B97F3) : Colors.pink,
                  tail: false,
                  textStyle: TextStyle(color: Colors.white, fontSize: 16),
                  text: message.Text),
            )),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration: InputDecoration(
                  labelText: "write you message here ",
                  suffixIcon: Icon(Icons.send_and_archive_sharp) != null
                      ? Icon(Icons.send)
                      : null,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(0.0),
                  ),
                ),
                onSubmitted: (text) {
                  final message = Message(
                      Text: text, date: DateTime.now(), isSentByMe: true);
                  setState(() {
                    messages.add(message);
                  });
                },
              ),
            )
          ],
        ));
  }
}

class Message {
  late String Text;
  late DateTime date;
  late bool isSentByMe;
  Message({required this.Text, required this.date, required this.isSentByMe});
}
