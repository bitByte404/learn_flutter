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

      // 什么是视窗？
      // 里面在滚动的区域就是视窗
      /* body: Center(
        child: SizedBox(
          height: 500,
          width: 360,
          child: ListView.builder(itemBuilder: (context, index) {
            return Container(
              height: 100,
              color: Colors.primaries[Random().nextInt(Colors.primaries.length)],
            );
          }),
        ),
      ),*/

      // Sliver是另一个世界，与上面的ListView.builder的传统方式，不是一个世界领域的
      // 可以把上面的ListView.builder认为是Widget系列的世界，而下面领域是Sliver系列的世界
      // 如果我们想要从Widget系列的世界，进入Sliver系列的世界，首先需要运用视窗桥梁CustomScrollerView
      // 而在CustomScrollView里面就是Sliver系列了，既然是Sliver，任何Widget都需要使用SliverrXXX包裹，例如SliverToBoxAdapter， SliverGrid， SliverList
      body: CustomScrollView(
        slivers: [
          const SliverToBoxAdapter(
            child: FlutterLogo(
              size: 100,
            ),
          ),
          const SliverToBoxAdapter(
            child: FlutterLogo(
              size: 100,
            ),
          ),
          const SliverToBoxAdapter(
            child: FlutterLogo(
              size: 100,
            ),
          ),
          const SliverToBoxAdapter(
            child: FlutterLogo(
              size: 100,
            ),
          ),
          const SliverToBoxAdapter(
            child: Icon(
              Icons.phone,
              size: 100,
            ),
          ),
          const SliverToBoxAdapter(
            child: Icon(
              Icons.settings_system_daydream,
              size: 100,
            ),
          ),
          SliverGrid(
              delegate: SliverChildBuilderDelegate((context, index) {
                return Container(
                  height: 200,
                  color: Colors
                      .primaries[Random().nextInt(Colors.primaries.length)],
                );
              }),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3)),
          SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
              return Container(
                height: 100,
                color:
                    Colors.primaries[Random().nextInt(Colors.primaries.length)],
              );
            }, childCount: 30),
          ),
        ],
      ),
    );
  }
}
