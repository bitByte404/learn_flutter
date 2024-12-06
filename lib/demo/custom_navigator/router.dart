import 'package:flutter/material.dart';
import 'package:learn_async/async/t2/main.dart';
import 'package:learn_async/demo/custom_navigator/helper.dart';

// 为了更加方便直观的修改，将路由定义提前
const Type _HOME_ = MyHomePage;
final _route = Helper.routeDefine({

})

/**
 * 路由桥接混入类，专门用于桥接路由跳转的参数处理部分
 * 使得路由跳转更便利的感知页面需要接受的参数类型
 */

mixin RouterBride<RT_ARG_TYPE> {
  // MyRouter arg
}