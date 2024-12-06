import 'package:flutter/material.dart';

class TabPage extends StatefulWidget {
  const TabPage({super.key});

  @override
  State<TabPage> createState() => _TabPageState();
}

// AutomaticKeepAliveClientMixin保持组件运行转台，但是这种页面不能太多
class _TabPageState extends State<TabPage>with AutomaticKeepAliveClientMixin<TabPage> {

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return const Center(child: Text('test'),);
  }

  @override
  bool get wantKeepAlive => true; // 保留组件状态，而不用每次都初始化
}
