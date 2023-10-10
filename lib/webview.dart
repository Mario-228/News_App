import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewScreen extends StatelessWidget {
  final String url;
  const WebViewScreen({super.key, required this.url});
  @override
  Widget build(BuildContext context) {
      WebViewController web =WebViewController();
    return Scaffold(
      appBar: AppBar(foregroundColor: Colors.grey,),
      body:WebViewWidget(controller:web..loadRequest(Uri.parse(url)) ,)
    );
  }
}