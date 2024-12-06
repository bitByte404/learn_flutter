import 'package:flutter/material.dart';
import 'package:learn_async/demo/custom_navigator/helper.dart';

extension Context on BuildContext {
  Future<T?> routeTo<T extends Object?>(Type  router) {
    return Navigator.pushNamed(this, Helper.typeName(router));
  }
}