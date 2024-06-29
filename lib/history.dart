import 'package:flutter/material.dart';

class historyPagge extends StatefulWidget {
  const historyPagge({super.key});

  @override
  State<historyPagge> createState() => _historyPaggeState();
}

class _historyPaggeState extends State<historyPagge> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'History',
          style: TextStyle(
            color: Color.fromARGB(255, 255, 200, 0),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: 7,
        itemBuilder: (context, index) {
          return Expanded(
              child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 60,
              width: 600,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: const Color.fromARGB(255, 73, 71, 71)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(children: [Text("Wenesday"),Spacer(),Text("India"),Spacer(),Text("8:37 AM")],),
                  ),
            ),
          ));
        },
      ),
    );
  }
}
