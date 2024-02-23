import 'package:flutter/material.dart';
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
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Expanded(
                child: ListView.builder(
              itemCount: 100,
              itemBuilder: (context, index) {
                return (index % 2 == 0)
                    ? const AnotherMessagesBuble()
                    : const MyMessagesBuble();
              },
            )), //caja de texto
            const MessageFieldBox()
          ],
        ),
      ),
    );
  }
}
