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
        // appBar: AppBar(
        //   backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        //   title: const Text('Sliver demo'),
        // ),
        body: CustomScrollView(
          physics: const BouncingScrollPhysics(),
      slivers: [
        const SliverAppBar(
          backgroundColor: Colors.greenAccent,
          // title: Text('哈哈哈哈哈'),
          // 只要稍微往上滑动，就会显示整个AppBar
          // pinned: true, // 一直显示AppBar
          stretch: true,
          // floating: true,
          flexibleSpace: FlexibleSpaceBar(
            background: Icon(Icons.back_hand, size: 100, color: Colors.redAccent,),
            title: Text("Sliver的appbar", style: TextStyle(color: Colors.white),),
            collapseMode: CollapseMode.pin,
            stretchModes: [
              StretchMode.blurBackground,
              StretchMode.zoomBackground,
              StretchMode.fadeTitle,
            ],
          ),
          expandedHeight: 200,
        ),
        const SliverToBoxAdapter(
          child: Placeholder(),
        ),
        SliverList(
            delegate: SliverChildListDelegate([
          const Icon(
            Icons.hearing,
            size: 200,
          ),
          const Icon(
            Icons.hearing,
          ),
          const Icon(
            Icons.hearing,
            size: 200,
          ),
          const Icon(
            Icons.hearing,
          ),
          const Icon(
            Icons.hearing,
            size: 200,
          ),
        ]))
      ],
    ));
  }
}
