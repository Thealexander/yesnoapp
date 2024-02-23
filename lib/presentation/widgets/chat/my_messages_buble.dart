import 'package:flutter/material.dart';

class MyMessagesBuble extends StatelessWidget {
  const MyMessagesBuble({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(
          decoration: BoxDecoration(
              color: colors.primary, borderRadius: BorderRadius.circular(20)),
          child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Text(
                'this is testing text',
                style: TextStyle(color: Colors.white),
              )),
        ),
        const SizedBox(height: 10)
      ],
    );
  }
}
