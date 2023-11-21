import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_prompt/flutter_prompt.dart';

import 'future_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
        textTheme: const TextTheme(
          labelLarge: TextStyle(color: Colors.white, fontSize: 12),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            textStyle: MaterialStateProperty.all(
              const TextStyle(color: Colors.white, fontSize: 14),
            ),
            foregroundColor: MaterialStateProperty.all(Colors.white),
            backgroundColor: MaterialStateProperty.resolveWith(
              (states) => switch (states) {
                MaterialState.disabled => Colors.grey,
                MaterialState.selected => Colors.green,
                MaterialState.pressed => Colors.yellow,
                _ => Colors.green,
              },
            ),
          ),
        ),
      ),
      //Method 1
      // home: const Home(),
      // builder: Prompt.init(style: MyCustomStyle()),
      //Method 2
      home: Prompt.initRoot(child: const Home(), style: MyCustomStyle()),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String _platformVersion = 'Unknown';
  final _flutterPromptPlugin = Prompt();

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    String platformVersion;
    // Platform messages may fail, so we use a try/catch PlatformException.
    // We also handle the message potentially returning null.
    try {
      platformVersion = await _flutterPromptPlugin.getPlatformVersion() ??
          'Unknown platform version';
    } on PlatformException {
      platformVersion = 'Failed to get platform version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _platformVersion = platformVersion;
    });
  }

  @override
  Widget build(BuildContext context) {
    var count = 1;

    final style = MyCustomStyle();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Prompt'),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('Running on: $_platformVersion\n'),
            Title(
              color: Colors.black,
              child: const Text("TOAST"),
            ),
            Wrap(
              runSpacing: 10,
              spacing: 10,
              children: [
                ElevatedButton(
                  // style: ButtonStyle(
                  //   textStyle: MaterialStateProperty.all(TextStyle(color: Colors.red)),
                  // ),
                  onPressed: () {
                    Prompt.showToast(
                      "Top Left ${count++}",
                      alignment: Alignment.topLeft,
                    );
                  },
                  child: Text("Top Left"),
                ),
                ElevatedButton(
                  onPressed: () {
                    Prompt.showToast(
                      "Top Center${count++}",
                      alignment: Alignment.topCenter,
                    );
                  },
                  child: const Text("Top Center"),
                ),
                ElevatedButton(
                  onPressed: () {
                    Prompt.showToast(
                      "Top Right${count++}",
                      alignment: Alignment.topRight,
                    );
                  },
                  child: const Text("Top Right"),
                ),
                ElevatedButton(
                  onPressed: () {
                    Prompt.showToast(
                      "Bottom Left ${count++}，",
                      alignment: Alignment.bottomLeft,
                    );
                  },
                  child: const Text("Bottom Left"),
                ),
                ElevatedButton(
                  onPressed: () {
                    Prompt.showToast(
                      "Bottom Center${count++}",
                      alignment: Alignment.bottomCenter,
                    );
                  },
                  child: const Text("Bottom Center"),
                ),
                ElevatedButton(
                  onPressed: () {
                    Prompt.showToast(
                      "Bottom Right${count++}",
                      alignment: Alignment.bottomRight,
                    );
                  },
                  child: const Text("Bottom Right"),
                ),
                ElevatedButton(
                  onPressed: () {
                    Prompt.showToast(
                      "A long text, test the display effect.,A long text, test the display effect.,A long text, test the display effect.",
                    );
                  },
                  child: const Text("Long Text"),
                ),
              ],
            ),
            Title(
              color: Colors.black,
              child: const Text("Theme Toast"),
            ),
            Wrap(
              spacing: 4,
              children: [
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(style.colorSuccess),
                  ),
                  onPressed: () {
                    Prompt.showToast(
                      "Success ${count++}",
                      type: ToastType.success,
                    );
                  },
                  child: const Text("Success"),
                ),
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(style.colorInfo),
                  ),
                  onPressed: () {
                    Prompt.showToast(
                      "Info ${count++}",
                      type: ToastType.info,
                    );
                  },
                  child: const Text("Info"),
                ),
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(style.colorError),
                  ),
                  onPressed: () {
                    Prompt.showToast(
                      "Error ${count++}",
                      type: ToastType.error,
                    );
                  },
                  child: const Text("Error"),
                ),
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(style.colorWarning),
                  ),
                  onPressed: () {
                    Prompt.showToast(
                      "Warning ${count++}",
                      type: ToastType.warning,
                      duration: const Duration(seconds: 3),
                    );
                  },
                  child: const Text("Warning"),
                ),
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(style.colorWarning),
                  ),
                  onPressed: () {
                    Prompt.showToastWidget(
                      (ctx) => Container(
                        decoration: BoxDecoration(
                          color: Colors.grey.shade400,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        padding: const EdgeInsets.all(10),
                        child: const Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            CircleAvatar(
                              child: Icon(Icons.verified_user),
                            ),
                            Text("hello~~")
                          ],
                        ),
                      ),
                      type: ToastType.warning,
                      duration: const Duration(seconds: 3),
                    );
                  },
                  child: const Text("CustomToast"),
                ),
              ],
            ),
            Title(
              color: Colors.black,
              child: const Text("Loading"),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Prompt.showLoading(msg: "拼命加载中...");
                    Future.delayed(const Duration(seconds: 1), () {
                      Prompt.hideLoading();
                    });
                  },
                  child: const Text("Loading"),
                ),
              ],
            ),
            FutureWidget(
              future: _testAsyncLoading(),
              onSuccess: (BuildContext context, data) {
                return Text("async loading $data");
              },
            )
          ],
        ),
      ),
    );
  }
}

Future<int> _testAsyncLoading() {
  Prompt.showLoading(msg: "async loading demo");
  return Future.delayed(const Duration(seconds: 3), () => 123)
      .whenComplete(() => Prompt.hideLoading());
}

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
