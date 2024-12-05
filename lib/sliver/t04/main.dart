import 'dart:math';

import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Sliver',
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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Sliver demo'),
      ),
      body: CustomScrollView(
        slivers: [
          SliverPrototypeExtentList(
              delegate: SliverChildListDelegate([
                const Icon(
                  Icons.abc,
                  size: 100,
                ),
                const Icon(
                  Icons.baby_changing_station,
                  size: 100,
                ),
                const Icon(
                  Icons.dark_mode_rounded,
                  size: 100,
                ),
              ]),
              // 统一高度的圆形，其他Item必须参考此原型高度
              prototypeItem: const Icon(
                Icons.search,
                size: 166,
              )),

          // 每一个item条目，都会占满整个视窗
          SliverFillViewport(
              delegate: SliverChildListDelegate([
            const Icon(
              Icons.earbuds_battery_outlined,
              size: 100,
            ),
            const Icon(
              Icons.favorite,
              size: 100,
            ),
            const Icon(
              Icons.get_app_rounded,
              size: 100,
            ),
          ])),

          // Sliver去实现，传统的PageView效果
          SliverFillViewport(
              delegate: SliverChildListDelegate([
            Container(
              color: Colors.orange,
            ),
            Container(
              color: Colors.red,
            ),
            Container(
              color: Colors.greenAccent,
            ),
          ]))
        ],
      ),
    );
  }
}
