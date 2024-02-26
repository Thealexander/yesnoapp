import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yesnoapp/domain/entities/message.dart';
import 'package:yesnoapp/presentation/providers/chat_provider.dart';
import 'package:yesnoapp/presentation/widgets/chat/another_messages_buble.dart';
import 'package:yesnoapp/presentation/widgets/chat/my_messages_buble.dart';
import 'package:yesnoapp/presentation/widgets/shared/message_field_box.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsets.all(4.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage(
                'https://media.diariouno.com.ar/p/8dc20c1c24785d022eb20fa69cb46bdd/adjuntos/298/imagenes/009/193/0009193757/1200x0/smart/carmen-electra-hilo-dental-2webp.png'),
          ),
        ),
        title: const Text('Alexander'),
        centerTitle: true,
      ),
      body: _ChatView(),
    );
  }
}

class _ChatView extends StatelessWidget {
  const _ChatView({super.key});

  @override
  Widget build(BuildContext context) {
    //para redibujar un widget
    final chatProvider = context.watch<ChatProvider>();

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Expanded(
                child: ListView.builder(
              controller: chatProvider.chatScrollController,
              itemCount: chatProvider.messageList.length,
              itemBuilder: (context, index) {
                final message = chatProvider.messageList[index];

                return (message.fromWho == FromWho.another)
                    ? AnotherMessagesBuble()
                    : MyMessagesBuble(
                        message: message,
                      );
              },
            )), //caja de texto
            MessageFieldBox(
              //              onValue: (value) => chatProvider.sendMessage(value),
              onValue: chatProvider.sendMessage,
            )
          ],
        ),
      ),
    );
  }
}
