import 'package:flutter/material.dart';
import 'package:yesnoapp/Config/helpers/get_yes_no_answer.dart';
import 'package:yesnoapp/domain/entities/message.dart';

class ChatProvider extends ChangeNotifier {
  final ScrollController chatScrollController = ScrollController();
  final GetYesNoAnswer getYesNoAnswer = GetYesNoAnswer();
  List<Message> messageList = [
    Message(text: 'Nuevo Mensaje!!', fromWho: FromWho.me),
    Message(text: 'Este es otro mensaje!!', fromWho: FromWho.me),
  ];

  Future<void> sendMessage(String text) async {
    if (text.isEmpty) return;
    final newMessage = Message(text: text, fromWho: FromWho.me);
    messageList.add(newMessage);

    if (text.endsWith('?')) {
      anotherReply();
    }

    notifyListeners();
    moveScrollToBottom();
  }

  Future<void> anotherReply() async {
    final anotherMessage = await getYesNoAnswer.getAnswer();
    messageList.add(anotherMessage);
    notifyListeners();
    moveScrollToBottom();
  }

  Future<void> moveScrollToBottom() async {
    await Future.delayed(const Duration(milliseconds: 100));
    chatScrollController.animateTo(
        chatScrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut);
  }
}
