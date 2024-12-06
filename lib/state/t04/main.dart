import 'package:flutter/material.dart';
import 'package:http/http.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomColor(
      color: Colors.greenAccent,
      child: MaterialApp(
        title: 'learn State',
        theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.orange),
            useMaterial3: true),
        home: const MyHomePage(),
      ),
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




  @override
  Widget build(BuildContext context) {
    return CustomColor(
      color: Colors.yellow,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('State'),
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        ),
        body: const  Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const My(),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {

          },
          tooltip: "Increment",
          child: const Icon(Icons.lock_reset),
        ),
      ),
    );
  }
}

class My extends StatefulWidget {
  const My({super.key });

  @override
  State<My> createState() => _MyState();
}

class _MyState extends State<My> {
  @override
  Widget build(BuildContext context) {
    // 查找原理: 通过context一层一层往上找，知道找到CustomColor，找最近的
    final getColor = context.dependOnInheritedWidgetOfExactType<CustomColor>();
    // MediaQuery.of(context).size.height // 这里使用的其实就是继承式组件
    return Container(
      width: 100,
      height: 100,
      color: getColor?.color,
    );
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

// 定义一个自己的 继承式组件
class CustomColor extends InheritedWidget {
  final Color color;
  const CustomColor({super.key, required super.child, required this.color});

  @override
  bool updateShouldNotify(covariant CustomColor oldWidget) {
    print('Chenwei updateShouldNotify color : ${oldWidget.color}');
    return true; // 当我们继承式组件发生变化的时候，是否告诉子组件需不需要重绘制
    // return false //就算Color有修改，也不需要通知给任何地方
  }

}