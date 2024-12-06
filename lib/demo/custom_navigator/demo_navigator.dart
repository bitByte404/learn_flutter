import 'package:flutter/material.dart';
import 'package:learn_async/demo/custom_navigator/extension.dart';
import 'package:learn_async/demo/custom_navigator/helper.dart';
import 'package:learn_async/demo/custom_navigator/page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static const String page3 = "/page3";
  static const String page4 = "/page4";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '路由管理',
      debugShowCheckedModeBanner: false,
      // initialRoute: "/page1",
      // routes: <String, WidgetBuilder>{
      //   // // 第一种：直接定义路由名
      //   // '/page1': (_) => const Page1(),
      //   // 'page2': (_) => const Page2(),
      //   //
      //   // // 第二种：定义静态常量名
      //   // page3: (_) => const Page3(),
      //   // page4: (_) => const Page4(),
      //
      //   // // 第三种
      //   // Helper.typeName(Page1): (_) => const Page1(),
      //   // Helper.typeName(Page2): (_) => const Page2(),
      //   // Helper.typeName(Page3): (_) => const Page3(),
      //   // Helper.typeName(Page4): (_) => const Page4(),
      // },
      // 进一步优化：
      routes: Helper.typeNameMap({
        Page1: (_) => const Page1(),
        Page2: (_) => const Page2(),
        Page3: (_) => const Page3(),
        Page4: (_) => const Page4(),
      }),
      home: Scaffold(
        body: SafeArea(
          child: Center(
            child: Column(
              children: [
                MaterialButton(
                  onPressed: () {
                    // 容易拼错
                    // Navigator.pushNamed(context, '/page1');

                    // 优化：
                    // Navigator.pushNamed(context, Helper.typeName(Page3));

                    // 优化：
                    context.routeTo(Page1);
                  },
                  color: Colors.redAccent,
                  child: const Text('跳转界面1'),
                ),
                MaterialButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/page2');
                  },
                  color: Colors.yellow,
                  child: const Text('跳转界面2'),
                ),
                MaterialButton(
                  onPressed: () {
                    // 静态变量占用内容
                    Navigator.pushNamed(
                      context,
                      page3,
                    );
                  },
                  color: Colors.greenAccent,
                  child: const Text('跳转界面3'),
                ),
                MaterialButton(
                  onPressed: () {
                    Navigator.pushNamed(context, page4);
                  },
                  color: Colors.orange,
                  child: const Text('跳转界面4'),
                ),
              ],
            ),
          ),
        ),
      ),
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
    return const Placeholder();
  }
}
