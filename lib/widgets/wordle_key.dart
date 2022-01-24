import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wordle_clone/providers/game_state_provider.dart';

class WordleKey extends ConsumerWidget {
  final String letter;

  const WordleKey(this.letter, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Widget keyCap;
    double width = 50;
    if (letter == "_") {
      keyCap = const Icon(
        Icons.keyboard_return,
        size: 18,
      );
    } else if (letter == "<") {
      keyCap = const Icon(
        Icons.backspace_outlined,
        size: 18,
      );
    } else {
      width = 35;
      keyCap = Text(
        letter.toUpperCase(),
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      );
    }

    return InkWell(
      onTap: () {
        ref.read(gameStateProvider.notifier).updateCurrentAttempt(letter);
      },
      child: Container(
        width: width,
        height: 55,
        alignment: Alignment.center,
        margin: const EdgeInsets.all(3),
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(4)),
            color: Color.fromARGB(44, 44, 44, 44)),
        child: keyCap ,
      ),
    );

  }
}
