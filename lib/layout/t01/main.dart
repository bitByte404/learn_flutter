import 'package:flutter/material.dart';

// 子集设置的宽高必须需要满足父级设置的宽高，如果子集无法满足父级宽高，就会被父级自动纠正
void main() => runApp(Container(
  color: Colors.yellow,
  width: 2,
  height: 2,
  child: Center(
    child: Container(
      color: Colors.red,
      width: 66,
      height: 66,
      child: FlutterLogo(size: 30,),
    ),
  ),
));

// void main() => runApp(Container(color: Colors.yellow, height: 48,));
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Layout',
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

  @override
  Widget build(BuildContext context) {

    return Scaffold();
  }

}

