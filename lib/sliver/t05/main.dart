import 'dart:async';
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
            const SliverAppBar(
              title: Text('Sliver'),
              backgroundColor: Colors.greenAccent,
            ),
            SliverToBoxAdapter(
              child: AppBar(
                backgroundColor: Colors.yellow,
                title: const Text('普通AppBar'),
              ),
            ),
            const SliverAnimatedOpacity(
              opacity: 0.2,
              duration: Duration(seconds: 3),
              sliver: SliverToBoxAdapter(
                child: FlutterLogo(
                  size: 100,
                ),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.all(66),
              sliver: SliverGrid(
                  delegate: SliverChildListDelegate([
                    const FlutterLogo(
                      size: 66,
                    ),
                    const FlutterLogo(
                      size: 66,
                    ),
                    const FlutterLogo(
                      size: 66,
                    ),
                    const FlutterLogo(
                      size: 66,
                    ),
                  ]),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3)),
            ),

            const SliverToBoxAdapter(), // Sliver世界中，不需要给Child
            const SliverToBoxAdapter(child: Divider(thickness: 3.0, color: Colors.orange,),),
            // 能够计算还剩多少视窗
            SliverFillRemaining(child: Container(color: Colors.blueAccent,),),

            // 使用之前的知识，手写一套SliverFillRemaining
            SliverLayoutBuilder(builder: (BuildContext context, constrains) {
              return SliverToBoxAdapter(
                child: Placeholder(fallbackHeight: MediaQuery.of(context).size.height,),
              );
            })
          ],
        ));
  }
}
