# flutter_prompt

A lightweight prompt library, including: toast, loading, bubbles, etc. 一个轻巧的提示库，包含有：吐司、加载、气泡等。

Support any custom toast effect and loading effect / 支持任意的自定义toast 效果和 loading 效果

Toast and loading do not affect each other / toast 和 loading 互不影响

![demo.gif](docs%2Fdemo.gif)

# Install / 安装

Add the following code to your project/ 将以下代码添加到您项目中的 pubspec.yaml 文件:

```yaml
dependencies:
  flutter_prompt: ^latest

```

# Init / 初始化

> Methods 1 / 方式一

```dart
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Prompt',
      home: YouerPage(title: 'Flutter Prompt'),
      home: const Home(),
      builder: Prompt.init(style: MyCustomStyle()),
    );
  }
}
```

> Methods 2 / 方式二

```dart
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Prompt',
      home: Prompt.initRoot(child: const Home(), style: MyCustomStyle()),
    );
  }
}
```

# How to Use / 如何使用

Use Toast:

```dart
example() {
  // toast
  Prompt.showToast("你的消息");

  //toast and position
  Prompt.showToast("你的消息", alignment: Alignment.topRight);

  // toast and type
  Prompt.showToast("你的消息", type: ToastType.success);
  Prompt.showToast("你的消息", type: ToastType.error);
  Prompt.showToast("你的消息", type: ToastType.warning);
  Prompt.showToast("你的消息", type: ToastType.info);

  //toast and time
  Prompt.showToast("你的消息", duration: Duration(seconds: 3),);

  // toast widget
  Prompt.showToastWidget((context) => Text("你好"));


  // loading 
  Prompt.showLoading();
  Prompt.showLoading(msg: "loading...");

  //hide Loading
  Prompt.hideLoading();
}
```

# Custom / 定制你的组件

在`customLoadingStyle`或者`customToastStyle`中可以返回一个任意的 Widget。


```
Prompt.init(style: MyCustomStyle())
```

```dart

class MyCustomStyle with FlutterPromptCustomStyle {
  ///自定义颜色
  ///Custom color
  @override
  Color get colorDefault => super.colorDefault;

  @override
  Color get colorError => super.colorError;

  @override
  Color get colorInfo => super.colorInfo;

  @override
  Color get colorSuccess => super.colorSuccess;

  @override
  Color get colorWarning => super.colorWarning;

  ///自定义图标
  ///Custom icon
  @override
  get iconDefault => super.iconDefault;

  @override
  Widget get iconError => super.iconError;

  @override
  Widget get iconInfo => super.iconInfo;

  @override
  Widget get iconSuccess => super.iconSuccess;

  @override
  Widget get iconWarning => super.iconWarning;

  ///自定义吐司设置
  ///Custom toast
  @override
  BorderRadius get toastRadius => super.toastRadius;

  @override
  EdgeInsets get toastPadding => super.toastPadding;

  @override
  double get toastGap => super.toastGap;

  ///自定义loading
  ///Custom loadng
  @override
  EdgeInsets get loadingBgMargin => super.loadingBgMargin;

  @override
  BorderRadius get loadingBgRadius => super.loadingBgRadius;

  @override
  Color get loadingColor => super.loadingColor;

  @override
  Color get loadingDefaultMaskColor => super.loadingDefaultMaskColor;

  @override
  String get loadingDefaultText => super.loadingDefaultText;

  @override
  double get loadingHeight => super.loadingHeight;

  @override
  Widget get loadingSpin => super.loadingSpin;

  @override
  double get loadingWidth => super.loadingWidth;

  @override
  Alignment get toastDefaultAlignment => Alignment.topCenter;


  ///自定义 loading 的显示组件
  @override
  Widget customLoadingStyle(BuildContext context, String? msg,
      {String? defaultMsg, Color? maskColor}) {
    return super.customLoadingStyle(context, msg,
        defaultMsg: defaultMsg, maskColor: maskColor);
  }

  ///自定义 toast 的显示方式
  @override
  Widget customToastStyle(BuildContext context, String msg,
      {Alignment? alignment = Alignment.center,
        String? id,
        Duration? duration,
        ToastType? type}) {
    return super.customToastStyle(context, msg,
        alignment: alignment, id: id, duration: duration, type: type);
  }
}


```


# Recommend a loading library / 推荐一个加载库
可以用来自定义 loading

It can be used to customize loading


https://pub.dev/packages/flutter_spinkit

# TODO 
Welcome to leave a message / 欢迎留言


1. [ ] Bubble / 气泡框
2. [ ]  ...


# 致谢
❤️❤️❤️

Thanks to [flutter_spinkit](https://pub.dev/packages/flutter_spinkit) , [flutter_easyloading](https://github.com/nslogx/flutter_easyloading) ❤️
