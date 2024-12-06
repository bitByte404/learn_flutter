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


class MyHolder {
  double value;
  MyHolder(this.value);
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {

  int _counter = 0;

  void _incrementCounter() {
    _counter++;
    // 数据驱动UI的思想 (开发者只需要关心状态数据，只要状态数据发生改变，UI自动更新)
    setState(() {});
  }

  MyHolder mh = MyHolder(0.5);
  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('State'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('我是上面的：$_counter'),
          ElevatedButton(onPressed: () {
            mh.value = 1.0;
            setState(() {

            });
          }, child: const Text('控制下面区域为 百分之百的进度条')),

          TextField(
            controller: _controller,
          ),

          ElevatedButton(onPressed: () {
            _controller.clear();
          }, child: const Text('清空编辑框里面的内容')),
          My(counter: _counter, mh: mh)
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: "Increment",
        child: const Icon(Icons.add),
      ),
    );
  }
}

class My extends StatefulWidget {
  const My({super.key, required this.counter, required this.mh, });

  // 只是值传递的话，无法通过修改下面部分数据改变上面的数字
  final int counter;
  // // 回调，通过回调来修改上面的数据
  // final void Function(int) push;

  // 类似TextField的controller
  final MyHolder mh;

  @override
  State<My> createState() => _MyState();
}

class _MyState extends State<My> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      color: Colors.greenAccent,
      margin: const EdgeInsets.all(30),
      child: Column(
        children: [
          Icon(
            Icons.add,
            color: Colors.orange,
            size: 100 * widget.mh.value + 100,
          ),
          Text('我是下面的${widget.counter}'),
          Slider(value: widget.mh.value, onChanged: (double value) {
            setState(() {
              widget.mh.value = value;
            });
          })
        ],
      ),
    );
  }
}
