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
      // 进入Sliver世界的大门，需要用视窗，此视窗里面可以有无限的Sliver系列内容
      body: CustomScrollView(
        slivers: [
          // 不能将Widget世界中的部件，直接写入Sliver世界里面，不在同一个世界

          // Sliver一对一的形式
          const SliverToBoxAdapter(
            child: Text('Start'),
          ),

          // Sliver一对多的形式
          SliverList(
              delegate: SliverChildListDelegate([
            const Icon(
              Icons.padding,
              size: 100,
            ),
            const Icon(
              Icons.flag,
              size: 100,
            ),
            const Icon(
              Icons.account_balance,
              size: 100,
            )
          ])),

          SliverGrid(
              delegate: SliverChildListDelegate([
                const Icon(
                  Icons.dark_mode_rounded,
                  size: 100,
                ),
                const Icon(
                  Icons.earbuds_battery_outlined,
                  size: 100,
                ),
                const Icon(
                  Icons.face,
                  size: 100,
                ),
                const Icon(
                  Icons.dark_mode_rounded,
                  size: 100,
                ),
                const Icon(
                  Icons.earbuds_battery_outlined,
                  size: 100,
                ),
                const Icon(
                  Icons.face,
                  size: 100,
                ),
              ]),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3)),
          
          const SliverToBoxAdapter(child: Text('End'),)
        ],
      ),
    );
  }
}
