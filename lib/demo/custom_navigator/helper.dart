import 'package:flutter/material.dart';

class Helper {
  Helper._();
  static String typeName(Type type) => type.toString();

  static Map<String, T> typeNameMap<T>(Map<Type, T> map) {
    final Map<String, T> target = <String, T> {};
    map.forEach((key, value) => target[typeName(key)] = value);
    return target;
  }
}