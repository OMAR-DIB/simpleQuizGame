import 'package:flutter/material.dart';


class Home extends StatefulWidget {
  const Home(this.switchS, {super.key});

  final void Function() switchS;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Image.asset(
            'images/dog.jpg',
            width: 300,
            height: 400,
            // color: Colors.white.withOpacity(0.001),
          ),
          const SizedBox(
            height: 15,
          ),
          const Text('Learn Flutter?'),
          const SizedBox(
            height: 15,
          ),
          OutlinedButton.icon(
            onPressed: widget.switchS,
            label: const Text('Next'),
            icon: const Icon(Icons.raw_on),
          ),
        ],
      ),
    );
  }
}
