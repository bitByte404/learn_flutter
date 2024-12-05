import 'dart:async';

import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Async',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.greenAccent),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

// Futree是期货，是以后能给我一个内容吗，就像盲盒一样
// 而Steam是一串很多的内容，源源不断
final myFutrue = Future.delayed(const Duration(seconds: 3), () => "我是Future盲盒的值哦");
final myStream = Stream.periodic(const Duration(seconds: 3), (_) => "来自Stream河流的数据");

// 当数据没有被监听时，会启动缓存
final myController = StreamController();
// 当数据没有被监听时，不会缓存
final myController2 = StreamController.broadcast();

class _MyHomePageState extends State<MyHomePage> {

  _run() {
    myFutrue.then((value) => print('myFutrue get value: $value'));
    myStream.listen((event) {
      // 监听Stream的一组系列，源源不断的系列内容
      print('myStream get value: $event');
    });
  }

  @override
  void initState() {
    // _run();
    myController.sink.add('Chenwei'); // 可以给源头添加事件数据
    myController2.stream.listen((event) {
      // 通过监听Stream来获取最新的事件数据
      print("获取到数据 $event");
    });

    myController2.stream.listen((event) {
      print("获取到数据 $event");
    });

    // Future.delayed(const Duration(seconds: 3)).then((_) {
    //   myController.sink.add('3s后获取的新数据');
    // });


    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Future'),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Center(
        child: FutureBuilder(future: Future.delayed(const Duration(seconds: 3)).then((value) => throw("请求服务器出现异常！！！！")), builder: (BuildContext context, AsyncSnapshot<dynamic>  asapshot ) {
          if (asapshot.hasError) return const Icon(Icons.error, size: 66, color: Colors.red,);
          return Text('${asapshot.data}', style: const TextStyle(color: Colors.greenAccent),);
        }, initialData: "亲爱的，正在请求中...",),
      ),
    );
  }
}
