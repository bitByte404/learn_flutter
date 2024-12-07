import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Demo',
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
          title: const Text('Demo'),
        ),
        drawer: const HomeDrawer(),
        endDrawer: const HomeDrawer(),
        // drawerScrimColor: Colors.white,
        drawerEdgeDragWidth: 40,
        drawerEnableOpenDragGesture: true,
        // drawerDragStartBehavior: DragStartBehavior.down,
        body: Center(
          child: Column(
            children: [
              Builder(builder: (context) {
                return MaterialButton(
                  color: Colors.greenAccent,
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                  },
                  child: const Text('Scafford内部打开左侧菜单'),
                );
              }),
              Builder(builder: (context) {
                return MaterialButton(
                  color: Colors.pink,
                  onPressed: () {
                    Scaffold.of(context).openEndDrawer();
                  },
                  child: const Text('Scafford内部打开右侧菜单'),
                );
              }),
              const MyContainer()
            ],
          ),
        ));
  }
}

class MyContainer extends StatelessWidget {
  const MyContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MaterialButton(
          onPressed: () {
            Scaffold.of(context).openDrawer();
          },
          color: Colors.yellow,
          child: const Text('Scaffold外打开左侧菜单'),
        ),
        MaterialButton(
          onPressed: () {
            Scaffold.of(context).openEndDrawer();
          },
          color: Colors.redAccent,
          child: const Text('Scaffold外打开右侧菜单'),
        ),
      ],
    );
  }
}

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.8,
      color: Colors.white,
      child: Column(
        children: [
          Container(
            height: 250,
            color: Colors.greenAccent,
            child: const Align(
              alignment: Alignment.bottomCenter,
              child: Column(
                children: [
                  Icon(
                    Icons.supervised_user_circle_outlined,
                    size: 150,
                  ),
                  Text('阿伟炸鸡'),
                ],
              ),
            ),
          ),
          ...List.generate(8, (index) {
            return const ListTile(
              leading: Icon(
                Icons.comment,
              ),
              title: Text('浏览记录'),
              trailing: Icon(
                Icons.arrow_forward_ios,
                color: Color(0xFFF5F5F9),
              ),
            );
          }),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const CustomIcon(
                label: '扫一扫',
                icon: Icons.document_scanner,
              ),
              const CustomIcon(
                label: '帮助与客服',
                icon: Icons.live_help_outlined,
              ),
              const CustomIcon(
                label: '设置',
                icon: Icons.settings,
              ),
              GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: const CustomIcon(
                    label: '关闭',
                    icon: Icons.exit_to_app,
                  )),
            ],
          )
        ],
      ),
    );
  }
}

class CustomIcon extends StatelessWidget {
  final String label;
  final IconData? icon;

  const CustomIcon({
    super.key,
    required this.label,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          child: Container(
            padding: const EdgeInsets.all(8),
            color: const Color(0xFFE7E7E7),
            child: Icon(
              icon,
              semanticLabel: label,
            ),
          ),
        ),
        Text(label),
      ],
    );
  }
}
