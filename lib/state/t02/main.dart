import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'learn State',
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.orange),
          useMaterial3: true),
      home: const MyHomePage(),
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

  void push(int v) {
    _counter += v;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('State'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Text('我是上面的$_counter'), My(counter: _counter, push: push,)],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: "Increment",
        child: const Icon(Icons.add),
      ),
    );
  }
}

class My extends StatelessWidget {
  const My({super.key, required this.counter, required this.push});

  // 只是值传递的话，无法通过修改下面部分数据改变上面的数字
  final int counter;
  // 回调，通过回调来修改上面的数据
  final void Function(int) push;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      color: Colors.greenAccent,
      margin: const EdgeInsets.all(30),
      child: Column(
        children: [
          const Icon(
            Icons.add,
            size: 100,
          ),
          Text('我是下面的$counter'),
          MaterialButton(
            color: Colors.pink,
            onPressed: () => push(3),
            child: const Text('点击下面，修改上面的变量 +3'),
          ),
          MaterialButton(
            color: Colors.yellow,
            onPressed: () => push(10),
            child: const Text('点击下面，修改上面的变量 +10'),
          ),
          MaterialButton(
            color: Colors.blue,
            onPressed: () => push(100),
            child: const Text('点击下面，修改上面的变量 +100'),
          ),
        ],
      ),
    );
  }
}
