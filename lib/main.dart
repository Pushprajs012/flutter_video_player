import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vdo_player/UIHelper.dart';
import 'package:vdo_player/VdoPlayer.dart';
import 'package:uni_links3/uni_links.dart';
import 'package:vdo_player/providers/PdfProvider.dart';

void main() {
  runApp(MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => PdfProvider())]));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(title: 'Flutter Video Player'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    deepLinkLisner();
  }

  void deepLinkLisner() async {
    final Uri? link = await getInitialUri();

    if (link != null) {
      _handleDeepLink(link.toString());
    }

    linkStream.listen((String? link) {
      if (link != null) {
        _handleDeepLink(link.toString());
      }
    });
  }

  void _handleDeepLink(String deepLink) {
    if (deepLink != null) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => VdoPlayer(url: deepLink),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    var _controller = TextEditingController();
    return Scaffold(
        appBar: AppBar(
          // TRY THIS: Try changing the color here to a specific color (to
          // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
          // change color while the other colors stay the same.
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text(widget.title),
        ),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.all(30.0),
              child: UIHelper.editText(_controller, "Enter Url"),
            ),
            SizedBox(
              height: 10,
            ),
            UIHelper.btn("Play Vdo", () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => VdoPlayer(url: _controller.text)),
              );
            })
          ],
        )));
  }
}
