import 'dart:async';

import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
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
final myFutrue =
    Future.delayed(const Duration(seconds: 3), () => "我是Future盲盒的值哦");
final myStream =
    Stream.periodic(const Duration(seconds: 3), (_) => "来自Stream河流的数据");

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

  // @override
  // void initState() {
  //   // _run();
  //   myController.sink.add('Chenwei'); // 可以给源头添加事件数据
  //   myController2.stream.listen((event) {
  //     // 通过监听Stream来获取最新的事件数据
  //     print("获取到数据1 $event");
  //   });
  //
  //   myController2.stream.listen((event) {
  //     print("获取到数据2 $event");
  //   });
  //
  //   myController2.sink.add("数据");
  //   // Future.delayed(const Duration(seconds: 3)).then((_) {
  //   //   myController.sink.add('3s后获取的新数据');
  //   // });
  //
  //
  //   super.initState();
  // }

  /*Future<String>*/
  getFutureString() async {
    return "ChenweiFuture";
    // return Future.value("ChenweiString");
  }

  getStreamString() async* {
    while (true) {
      await Future.delayed(const Duration(seconds: 1));
      // yield DateTime.now().toString();
      yield Stream.value(DateTime.now());
    }
  }

  @override
  void dispose() {
    myController2.close();
    myController.close();
    super.dispose();
  }

  int _count = 80;

  _run2() {
    if (_count >= 100) {
      _count = 80;
      return;
    }
    _count++;
    myController.sink.add("当前进度: ${_count}%");
  }
  
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 8)).then((_) => myController.sink.add("延时的数据"));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stream'),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Center(
        child: Column(
          children: [
            MaterialButton(
              onPressed: () {
                myController.sink.addError("Error啦");
              },
              color: Colors.blue,
              child: const Text("故意报错，抛出异常"),
            ),
            MaterialButton(
              onPressed: () {
                myController.sink.add(true);
                myController.sink.add(10000);
                myController.sink.add(4545.555);
              },
              color: Colors.green,
              child: const Text(
                "混搭任何千变万化的数据类型的值",
              ),
            ),
            MaterialButton(
              onPressed: () {
                myController.close();
              },
              color: Colors.orange,
              child: const Text("关闭控制器的流"),
            ),
            MaterialButton(
              onPressed: () {
                myController.sink.add(34444);
              },
              color: Colors.yellow,
              child: const Text("给源头添加int"),
            ),
            
            StreamBuilder(stream: myController.stream, builder: (BuildContext context, AsyncSnapshot<dynamic> asnapshot) {
              print("Chenwei builder一次");
              switch(asnapshot.connectionState) {
                case ConnectionState.none:
                  return const Text("Chenwei NONE: 没有数据啦");
                case ConnectionState.waiting:
                  return const Text("Chenwei WAITING: 正在等待数据流");
                case ConnectionState.active:
                  if (asnapshot.hasError) {
                    return Text("ACTIVE: 错误啦：${asnapshot.error}", style: const TextStyle(color: Colors.red),);
                  } else if (asnapshot.hasData) {
                    return Text("ACTIVE: 正确啦： ${asnapshot.data}", style: const TextStyle(color: Colors.green),);
                  }
                  break;
                case ConnectionState.done:
                  return const Text('Chenwei DONE: 数据流已经全部完毕，数据流已经关闭啦');
              }
              return const Text('啥也没有');
            })
          ],
        ),
      ),
    );
  }
}
