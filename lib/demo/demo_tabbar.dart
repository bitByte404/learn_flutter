import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'TabBar',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  final _tabs = <String>["精选", "推荐", "关注", "朋友", "我的"];

  // final _tabs = <String>["精选", "推荐", "关注"];
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController =
        TabController(length: _tabs.length, vsync: this, initialIndex: 2);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*appBar: AppBar(
        title: const Center(child: Text('Tabbar')),
        bottom: TabBar(
            // 标签选中颜色
            labelColor: Colors.pink,
            // 未选中标签颜色
            unselectedLabelColor: Colors.grey,
            labelStyle: const TextStyle(fontWeight: FontWeight.bold),
            unselectedLabelStyle:
                const TextStyle(fontWeight: FontWeight.normal, fontSize: 17 ),
            controller: _tabController,
            // 指示器样式
            indicatorColor: Colors.redAccent,
            indicatorSize: TabBarIndicatorSize.label,
            indicatorWeight: 3,
            // 分割线样式
            dividerColor: Colors.greenAccent,
            dividerHeight: 0,
            // 去除点击效果
            overlayColor: WidgetStateProperty.all(Colors.transparent),
            tabs: List.generate(
                _tabs.length,
                (index) => Tab(
                  // 切换界面无法保存转台，会重新加载
                  // 可以使用AutomaticKeepAliveClientMixin解决
                      text: _tabs[index],
                    ))),
      ),*/
        body: NestedScrollView(
            headerSliverBuilder: (context, innerBoxIsScrolled) {
              return <Widget
              >[
              SliverAppBar(
              floating: true,
              title: Center(child: const Text('你好')),
              pinned: true,
              bottom: MyTabBar(
              // 标签选中颜色
              labelColor: Colors.pink,
              // 未选中标签颜色
              unselectedLabelColor: Colors.grey,
              labelStyle: const TextStyle(fontWeight: FontWeight.bold),
              unselectedLabelStyle: const TextStyle(
              fontWeight: FontWeight.normal, fontSize: 17),
              controller: _tabController,
              // 指示器样式
              indicatorColor: Colors.redAccent,
              indicatorSize: TabBarIndicatorSize.label,
              indicatorWeight: 3,
              // 分割线样式
              dividerColor: Colors.greenAccent,
              dividerHeight: 0,
              // 去除点击效果
              overlayColor: WidgetStateProperty.all(Colors.transparent),
              tabs: List.generate(
              _tabs.length,
              (index) => Padding(padding: const EdgeInsets.symmetric(vertical: 5), child: Text(_tabs[index]),)
              // (index) => Tab(
              //       // 切换界面无法保存转台，会重新加载
              //       // 可以使用AutomaticKeepAliveClientMixin解决
              //       text: _tabs[index],
              //     ))),
              )
              ))];
            },
            body: TabBarView(
                controller: _tabController,
                children: List.generate(
                    _tabs.length,
                        (index) =>
                        Center(
                          child: Text(_tabs[index]),
                        )))));
  }
}

class MyTabBar extends TabBar {
  MyTabBar({
    super.key,
    required super.tabs,
    super.controller,
    super.isScrollable = false,
    super.padding,
    super.indicatorColor,
    super.automaticIndicatorColorAdjustment = true,
    super.indicatorWeight = 2.0,
    super.indicatorPadding = EdgeInsets.zero,
    super.indicator,
    super.indicatorSize,
    super.dividerColor,
    super.dividerHeight,
    super.labelColor,
    super.labelStyle,
    super.labelPadding,
    super.unselectedLabelColor,
    super.unselectedLabelStyle,
    super.dragStartBehavior = DragStartBehavior.start,
    super.overlayColor,
    super.mouseCursor,
    super.enableFeedback,
    super.onTap,
    super.physics,
    super.splashFactory,
    super.splashBorderRadius,
    super.tabAlignment,
    super.textScaler,
  });

  @override
  Size get preferredSize => const Size.fromHeight(36);
}