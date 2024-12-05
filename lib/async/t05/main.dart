import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Game',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final controller = StreamController.broadcast();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: StreamBuilder(
            stream: controller.stream,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Text('回答的计算结果是：${snapshot.data}');
              }
              return const Text('请回答计算结果');
            }),
      ),
      body: Stack(
        children: [
          ...List.generate(3, (index) => Count(inputStream: controller.stream)),
          Align(
            alignment: Alignment.bottomCenter,
            child: MyKey(controller: controller),
          )
        ],
      ),
    );
  }
}

class Count extends StatefulWidget {
  const Count({super.key, required this.inputStream});

  final Stream inputStream;

  @override
  State<Count> createState() => _CountState();
}

class _CountState extends State<Count> with SingleTickerProviderStateMixin {
  late int number1, number2;
  late AnimationController _controller;
  late double x;

  reInit() {
    number1 = Random().nextInt(5) + 1;
    number2 = Random().nextInt(5);
    x = Random().nextDouble() * 200;
    _controller.duration =
        Duration(milliseconds: Random().nextInt(5000) + 5000);
  }

  @override
  void initState() {
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 6));
    reInit();
    _controller.forward(from: Random().nextDouble()); // 起始值, 也是随机值
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        reInit();
        _controller.forward(from: 0.0);
      }
    });

    widget.inputStream.listen((input) {
      if (number1 + number2 == input) {
        reInit();
        _controller.forward(from: 0.0);
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var color = Colors
        .primaries[Random().nextInt(Colors.primaries.length)];
    return AnimatedBuilder(
        animation: _controller,
        builder: (BuildContext context, Widget? child) {
          return Positioned(
              top: 600 * _controller.value - 200,
              left: x,
              child: Container(
                decoration: BoxDecoration(
                  color: color,
                  // color: Colors
                  //     .primaries[Random().nextInt(Colors.primaries.length)],
                  border: Border.all(color: Colors.red),
                  borderRadius: BorderRadius.circular(50),
                ),
                padding: const EdgeInsets.all(66),
                child: Text(
                  "$number1 + $number2 = ?",
                  style: const TextStyle(fontSize: 30),
                ),
              ));
        });
  }
}

class MyKey extends StatelessWidget {
  const MyKey({super.key, required this.controller});

  final StreamController controller;

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 3,
      childAspectRatio: 1.5,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: List.generate(9, (index) {
        return MaterialButton(
          // color: Colors.yellow,
          onPressed: () {
            controller.sink.add(index + 1);
          },
          child: Center(
            child: Text(
              '${index + 1}',
              style: const TextStyle(fontSize: 66, color: Colors.orange),
            ),
          ),
        );
      }),
    );
  }
}
