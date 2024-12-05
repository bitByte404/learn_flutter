import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Flutter02'),
        ),
        body: Center(
          child: Container(
            // width: 400,
            height: 400,
            color: Colors.orange,
            padding: const EdgeInsets.all(5),
            child: SizedBox.expand(
              child: LayoutBuilder(
                  builder: (BuildContext context, BoxConstraints constraints) {
                print('Chenwei 父级对子集的真实值: $constraints');
                return const FlutterLogo(
                  size: 30,
                );
              }),
            ),
          ),
        ),
      ),
    );
  }
}
