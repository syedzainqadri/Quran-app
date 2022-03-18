import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class Url extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: Color(0xff020916),
        child: WebviewScaffold(
          url: 'https://shafiqurrehmanacademy.com/registration/',
          withJavascript: true,
          withLocalStorage: true,
          withZoom: true,
          enableAppScheme: true,
          primary: true,
          supportMultipleWindows: true,
          allowFileURLs: true,
          withLocalUrl: true,
          scrollBar: true,
          appCacheEnabled: true,
        ),
      ),
    );
  }
}
