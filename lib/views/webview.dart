import 'dart:async';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebPage extends StatefulWidget {
  WebPage({Key key}) : super(key: key);

  @override
  _WebPageState createState() => _WebPageState();
}

class _WebPageState extends State<WebPage> {
  final globalKey = GlobalKey<ScaffoldState>();

  final Completer<WebViewController> _controller =
      Completer<WebViewController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: globalKey,
      appBar: AppBar(
        title: Text("Courses"),
        actions: <Widget>[
          NavigationControls(_controller.future),
        ],
      ),
      body: _buildWebView(),
      floatingActionButton: _buildShowUrlBtn(),
    );
  }

  Widget _buildWebView() {
    return WebView(
      javascriptMode: JavascriptMode.unrestricted,
      initialUrl: 'https://nepalitcourses.blogspot.com/',
      onWebViewCreated: (WebViewController webViewController) {
        _controller.complete(webViewController);
      },
      //A delegate function that decides how to handle navigation actions.
      navigationDelegate: (request) {
        return _buildNavigationDecision(request);
      },

      javascriptChannels: <JavascriptChannel>[
        _createTopBarJsChannel(),
      ].toSet(),
      onPageFinished: (url) {
        _showPageTitle();
      },
    );
  }

  NavigationDecision _buildNavigationDecision(NavigationRequest request) {
    if (request.url.contains('my-account')) {
      globalKey.currentState.showSnackBar(
        SnackBar(
          content: Text(
            'You do not have rights to access My Account page',
            style: TextStyle(fontSize: 20),
          ),
        ),
      );

      return NavigationDecision.prevent;
    }

    return NavigationDecision.navigate;
  }

  Widget _buildChangeTitleBtn() {
    return FloatingActionButton(
      onPressed: () {
        setState(() {});
      },
      child: Icon(Icons.favorite),
    );
  }

  Widget _buildShowUrlBtn() {
    return FutureBuilder<WebViewController>(
      future: _controller.future,
      builder:
          (BuildContext context, AsyncSnapshot<WebViewController> controller) {
        if (controller.hasData) {
          return FloatingActionButton(
            onPressed: () async {
              String url = await controller.data.currentUrl();

              Scaffold.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    'Current url is: $url',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              );
            },
            child: Icon(Icons.link),
          );
        }

        return Container();
      },
    );
  }

  void _showPageTitle() {
    _controller.future.then((webViewController) {
      webViewController
          .evaluateJavascript('TopBarJsChannel.postMessage(document.title);');
    });
  }

  //Receiving messaged from JavaScript code running inside a web view.
  JavascriptChannel _createTopBarJsChannel() {
    return JavascriptChannel(
      name: 'TopBarJsChannel',
      onMessageReceived: (JavascriptMessage message) {
        String newTitle = message.message;

        if (newTitle.contains('-')) {
          newTitle = newTitle.substring(0, newTitle.indexOf('-')).trim();
        }
      },
    );
  }
}

class NavigationControls extends StatelessWidget {
  final Future<WebViewController> _controllerFuture;

  const NavigationControls(this._controllerFuture, {key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<WebViewController>(
      future: _controllerFuture,
      builder:
          (BuildContext context, AsyncSnapshot<WebViewController> controller) {
        if (controller.hasData) {
          return Row(
            children: <Widget>[
              _buildHistoryBackBtn(context, controller),
              _buildHistoryForwardBtn(context, controller),
              _buildReloadBtn(controller),
            ],
          );
        }

        return Container();
      },
    );
  }

  IconButton _buildReloadBtn(AsyncSnapshot<WebViewController> controller) {
    return IconButton(
      icon: Icon(Icons.refresh),
      onPressed: () {
        controller.data.reload();
      },
    );
  }

  FlatButton _buildHistoryForwardBtn(
      BuildContext context, AsyncSnapshot<WebViewController> controller) {
    return FlatButton(
      textColor: Colors.white,
      child: Icon(Icons.arrow_forward_ios),
      onPressed: () async {
        if (await controller.data.canGoForward()) {
          controller.data.goForward();
        } else {
          Scaffold.of(context).showSnackBar(
            SnackBar(
              content: Text(
                'No forward history',
                style: TextStyle(fontSize: 20),
              ),
            ),
          );
        }
      },
    );
  }

  FlatButton _buildHistoryBackBtn(
      BuildContext context, AsyncSnapshot<WebViewController> controller) {
    return FlatButton(
      textColor: Colors.white,
      child: Icon(Icons.arrow_back_ios),
      onPressed: () async {
        if (await controller.data.canGoBack()) {
          controller.data.goBack();
        } else {
          Scaffold.of(context).showSnackBar(
            SnackBar(
              content: Text(
                'No back history',
                style: TextStyle(fontSize: 20),
              ),
            ),
          );
        }
      },
    );
  }
}
