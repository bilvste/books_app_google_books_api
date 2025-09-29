import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PreviewPage extends StatefulWidget {
  final String url;

  const PreviewPage({super.key, required this.url});

  @override
  State<PreviewPage> createState() => _PreviewPageState();
}

class _PreviewPageState extends State<PreviewPage> {
  bool isLoading = true;
  late final WebViewController controller;

  @override
  void initState() {
    super.initState();

    final safeUrl = widget.url.replaceFirst("http://", "https://");

    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageStarted: (_) {
            setState(() => isLoading = true);
          },
          onPageFinished: (_) {
            setState(() => isLoading = false);
          },
          onWebResourceError: (error) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("Error: ${error.description}")),
            );
          },
        ),
      )
      ..loadRequest(Uri.parse(safeUrl));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Preview")),
      body: Stack(
        children: [
          WebViewWidget(controller: controller),
          if (isLoading) const Center(child: CircularProgressIndicator()),
        ],
      ),
    );
  }
}
