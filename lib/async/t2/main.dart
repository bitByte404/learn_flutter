import 'dart:async';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import 'package:flutter/material.dart';

void main() {
  // EventQueue区域
  // 依旧会把此事件push到EventQueue中，轮到此事件才能执行
  Future(() => print('cw event queue111'));
  // 并不是说，0s就不等了，不会立即执行，依旧会把此事件push到EventQueue中，轮到此事件才能执行
  Future.delayed(Duration.zero, () => print('cw event queue222'));

  // 如果设置1s，并不是说1s后就一定执行，而是说1s后才能把此事件push到队列中，等到此事件轮到执行，才能执行
  Future.delayed(const Duration(seconds: 1), () => print('cw eventQueue333'));

  // MicrotaskQueue 区域
  scheduleMicrotask(() {
    print('cw microtast queue 1111');
  });

  Future.microtask(() => print('cw microtask queue 2222'));

  Future.value(333).then((value) => print('cw microtask queue $value'));

  print('cw DDD');

  runApp(MyApp());
}

String testFutureValueAction() {
  print('cw testFutrueValueAction run。。。');
  return "cw CCC";
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.yellow),
          useMaterial3: true),
      title: 'demo2',
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Async"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('You have pushed the button this many times:'),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: () async {
        // Future 未来，金融里面的期货 ，在程序中就是我给你一个承诺，以后给实现
        // 你还可以把Future想象就是拆盲盒，具体是什么，后面才会给你

        // http.get('www.baidu.com' as Uri).then((value) => print('正常，终于可以打开盲盒')).catchError(() =>
        //     print('打开盲盒报错了'));

        // 自己也可以创建这个过程，来感受打开盲盒的意思
        String result1 = getFutrue1();
        print('Chenwei Chenwei我是没有加入任何事件的普通功能，我会先执行哦，rusult $result1');

        getFutrue3().then((value) => print("chenwei result2$value"));
        getFutrue4()
            .then((value) {
              print(value);
              return value;
            })
            .then((value) => print(value))
            .catchError((errorAction) => print(errorAction))
            .whenComplete(() => print('chenwei 拆盲盒结束'));

        // 体现出链式调用的优势
        print('我开始程序了');
        Future.delayed(const Duration(seconds: 3))
            .then((value) => print('3s后，程序执行完成了')); // 这一类，可以发挥链式调用的优点
        Future.delayed(
            const Duration(seconds: 3), () => {print('3s后，程序执行完成了')});

        getFutrue5()
            .then((value) {
              print(value);
              return value;
            })
            .then((value) => print(value))
            .catchError((errorAction) => print(errorAction)).whenComplete(() => print('chenwei拆盲盒结束了'));

        // async是自动打包盲盒，await是自动拆开盲盒(使用await，所在区域需要有async的配合)

        String value = await getFutrue5();
        print('Chenwei getFuture5 $value');

        // 不用 await就麻烦了
        Future<String> value2 = getFutrue5();
        value2.then((value) => print('chenwei getFuture5: ${value}'));

        String value3 = getFuture6();
        print('Chenwei getFutrue6: $value3');

        try {
          String value3 = getFuture6();
          print('Chenwei getFuture6 $value3');
        } catch(e) {
          print(e);
        }
      }),
    );
  }
}

String getFutrue1() {
  return "Chenwei1";
}

Future<String> getFuture2() {
  return Future(() => "Chenwei2");
}

Future<String> getFutrue3() =>
    Future.delayed(const Duration(seconds: 3), () => "Chenwei3");

Future<String> getFutrue4() => Future.value('ChenWei 大海');

// 只要在函数中，增加async关键字，你返回的类型，会自动拼接成Future<类型>
/*Future<String>*/
Future<String> getFutrue5() async {
  // 隐式 return Future.value('海阔天空');
  return "海阔天空";
}

getFuture6() async {
  throw "Chenwei 出错误了";
  return "Chenwei 灰色轨迹";
}
