import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'learn State',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  late final _controller = AnimationController(
    vsync: this,
    duration: const Duration(seconds: 1),
  )..repeat();

  int _counter = 0;

  void _incrementCounter() {
    _counter++;
    // 数据驱动UI的思想 (开发者只需要关心状态数据，只要状态数据发生改变，UI自动更新)
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('State'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: AnimatedBuilder(
          animation: _controller, // 60Hz 一秒钟60次，被我们监听
          builder: (context, child) {
            // 不用const修饰的话，每次调用build刷新界面都会被实例化一次，造成资源浪费
            return const My();
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: "Increment",
        child: const Icon(Icons.add),
      ),
    );
  }
}

class My extends StatelessWidget {
  const My({super.key});

  @override
  Widget build(BuildContext context) {
    print('Derry My Build run...');
    return const Placeholder();
  }
}
