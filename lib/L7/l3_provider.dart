import 'package:flutter/cupertino.dart';

class l3_provider extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new _l3_providerState();
  }
}

class _l3_providerState extends State<l3_provider> {
  @override
  Widget build(BuildContext context) {}
}

class InheritedProvider<T> extends InheritedWidget {
  InheritedProvider({@required this.data, Widget child}) : super(child: child);

  //共享状态使用泛型
  final T data;

  @override
  bool updateShouldNotify(InheritedProvider<T> old) {
    return true;
  }
}

class ChangeNotifier implements Listenable {
  List listeners = [];

  @override
  void addListener(listener) {
    //添加监听器
    listeners.add(listener);
  }

  @override
  void removeListener(listener) {
    //移除监听器
    listeners.remove(listener);
  }

  void notifyListeners() {
    //通知所有监听器，触发监听器回调
    listeners.forEach((item) => item());
  }
}


//class ChangeNotifierProvider<T extends ChangeNotifier> extends StatefulWidget {
//
//  ChangeNotifierProvider({key key, this.data, this.child});
//
//  final Widget widget;
//  final T data;
//
//  static T of<T>(BuildContext context){
//    final type = _typeOf<InheritedProvider<T>>();
//    final provider =  context.dependOnInheritedWidgetOfExactType<InheritedProvider<T>>();
//    return provider.data;
//  }
//
//
//  @override
//  State<StatefulWidget> createState() {
//    // TODO: implement createState
//    return _ChangeNotifierProviderState<T>();
//  }
//
//}
//
//
//class _ChangeNotifierProviderState<T extends ChangeNotifier>
//    extends State<ChangeNotifierProvider<T>> {
//
//  @override
//  Widget build(BuildContext context) {
//    // TODO: implement build
//    throw UnimplementedError();
//  }
//
//}
