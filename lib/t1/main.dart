import 'dart:async';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.greenAccent),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

/*  // 使用Flutter语法糖
  void _incrementCounter() async {
    await Future.delayed(const Duration(seconds: 3));
    setState(() {
      _counter++;
    });
  }*/

  /*// 不使用Flutter语法糖
  void _incrementCounter() {
    Future.delayed(const Duration(seconds: 3), () {
      setState(() {
        _counter++;
      });
    });
  }*/

  void _incrementCounter() => Future.delayed(const Duration(seconds: 3))
      .then((value) => setState(() => _counter++));

  // 不要任务异步就是多线程
  // 在java中，很多开发者任务异步就是多线程，因为需要开启线程等操作
  // 而在js中一个程序就一个线程，那怎么说异步就是多线程
  // 而Flutter 语法方面虽然偏向java，但是在异步中更加偏向于js, 所以不要在Flutter中说异步是多线程

  // 是否出现 程序未响应
  // 1.指向大量计算耗时中
  // 2.request server 等等Server的Response响应给App中

  // 多线程的思路来解决
  // 任务一 任务二 任务三

  // 事件循环 （EventLoop）
  // EventQueue队列 [服务器异步请求事件，大量图片渲染计算事件....]
  // 程序 { 运行1000w代码中， 在EventQueue处理过程中，是不阻塞的，还可以继续处理，其他程序功能哦}

  @override
  Widget build(BuildContext context) {

    Future.delayed(const Duration(seconds: 10), () {
      print('cw 事件在 EventQueue队列10秒之后的回调');
    });

    Future(
        () => print('cw 事件在EventQueue队列 处理中')
    );

    print('cw 还是可以继续处理其他程序功能');

    // 没有什么先来后到，只有优先级
    // MicrotaskQueue 优先级最高，只有该队列里面的事件全部执行完毕，才会执行EventQueue
    // EventQueue
    // // 尽量避免使用MicrotaskQueue，因为基本上都是Flutter体系使用的，程序员使用的话，可能会干扰Flutter体系
    // scheduleMicrotask((){
    //   print('cw 事件在MicrotaskQueue队列 处理中');
    // });

    // 会加入队列，执行异步操作
    scheduleMicrotask(() {
      print('cw依赖Microtask队列1');
    });
    Future.microtask(() => print('cw依赖Microtask队列2'));

    // 会加入到队列，执行异步操作
    Future.delayed(const Duration(seconds: 3)).then((value) => print('cw依赖Event队列1'));

    // 小心，不会加入队列，属于没有队列
    Future.sync(() => print('cw不依赖任何队列1')).then((value) => print('cw不依赖任何队列2'));
    Future.value().then((value) => print('cw不依赖任何队列3'));


    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
