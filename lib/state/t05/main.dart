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
  final _editController = TextEditingController();
  final _controller = NumberController();

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
          const Text('我是上面的：', style: TextStyle(fontSize: 30),),
          Container(height: 200, color: Colors.orange,),
          My(controller: _controller)
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _controller.reset();
        },
        tooltip: "Increment",
        child: const Icon(Icons.lock_reset),
      ),
    );
  }
}

class My extends StatefulWidget {
  const My({super.key, required this.controller,  });
  final NumberController controller;

  @override
  State<My> createState() => _MyState();
}

class _MyState extends State<My> {
  @override
  Widget build(BuildContext context) {
    return MaterialButton(onPressed: () {
      widget.controller.number++;
    }, child: ListenableBuilder(listenable: widget.controller, builder: (context, child) {
      return Text('我是下面的： ${widget.controller.number}', style: const TextStyle(fontSize: 30),);
    }),);
  }
}

class NumberController extends ChangeNotifier {
  int _number = 0;
  int get number => _number;
  set number(v) {
    _number = v;
    notifyListeners();
  }

  void reset() {
    _number = 0;
    notifyListeners();
  }
}