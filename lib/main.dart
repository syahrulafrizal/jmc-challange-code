// // import 'package:flutter/material.dart';
// // import 'package:flutter/services.dart';
// // import 'package:flutter_localizations/flutter_localizations.dart';

// // import 'package:get/get.dart';
// // import 'package:jmc_test/app/config/languages/app_languages.dart';
// // import 'package:jmc_test/app/config/themes/app_colors.dart';
// // import 'package:jmc_test/app/config/themes/app_themes.dart';
// // import 'package:jmc_test/app/shared/utils/my_behavior.dart';
// // import 'package:jmc_test/app/shared/widgets/builder/background_safe_area.dart';

// // import 'app/routes/app_pages.dart';

// // Future<void> main() async {
// //   WidgetsFlutterBinding.ensureInitialized();
// //   runApp(const MyApp());
// // }

// // class MyApp extends StatefulWidget {
// //   const MyApp({super.key});

// //   @override
// //   State<MyApp> createState() => _MyAppState();
// // }

// // class _MyAppState extends State<MyApp> {
// //   @override
// //   void initState() {
// //     super.initState();
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     SystemChrome.setPreferredOrientations([
// //       DeviceOrientation.portraitUp,
// //     ]);
// //     SystemChrome.setSystemUIOverlayStyle(
// //       SystemUiOverlayStyle(
// //         statusBarIconBrightness: Brightness.light,
// //         statusBarColor: AppColors.primary,
// //         statusBarBrightness: Brightness.light,
// //       ),
// //     );
// //     return GetMaterialApp(
// //       title: "JMC Test",
// //       theme: AppThemes.lightTheme(),
// //       darkTheme: AppThemes.darkTheme(),
// //       themeMode: AppThemes().init(),
// //       initialRoute: AppPages.INITIAL,
// //       getPages: AppPages.routes,
// //       debugShowCheckedModeBanner: false,
// //       locale: const Locale('id', 'ID'),
// //       fallbackLocale: const Locale('id', 'ID'),
// //       defaultTransition: Transition.downToUp,
// //       transitionDuration: const Duration(milliseconds: 250),
// //       localizationsDelegates: const [
// //         GlobalMaterialLocalizations.delegate,
// //         GlobalCupertinoLocalizations.delegate,
// //         GlobalWidgetsLocalizations.delegate,
// //       ],
// //       supportedLocales: const [
// //         Locale('en', 'US'),
// //         Locale('id', 'ID'),
// //       ],
// //       translations: AppLanguages(),
// //       builder: (context, child) {
// //         return ScrollConfiguration(
// //           behavior: MyBehavior(),
// //           child: BackgroundSafeArea(
// //             content: child ?? Container(),
// //           ),
// //         );
// //       },
// //     );
// //   }
// // }

// import 'dart:core';

// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// import 'src/call_sample/call_sample.dart';
// import 'src/call_sample/data_channel_sample.dart';
// import 'src/route_item.dart';

// void main() => runApp(new MyApp());

// class MyApp extends StatefulWidget {
//   @override
//   _MyAppState createState() => new _MyAppState();
// }

// enum DialogDemoAction {
//   cancel,
//   connect,
// }

// class _MyAppState extends State<MyApp> {
//   List<RouteItem> items = [];
//   String _server = '';
//   late SharedPreferences _prefs;

//   bool _datachannel = false;
//   @override
//   initState() {
//     super.initState();
//     _initData();
//     _initItems();
//   }

//   _buildRow(context, item) {
//     return ListBody(children: <Widget>[
//       ListTile(
//         title: Text(item.title),
//         onTap: () => item.push(context),
//         trailing: Icon(Icons.arrow_right),
//       ),
//       Divider()
//     ]);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//           appBar: AppBar(
//             title: Text('Flutter-WebRTC example'),
//           ),
//           body: ListView.builder(
//               shrinkWrap: true,
//               padding: const EdgeInsets.all(0.0),
//               itemCount: items.length,
//               itemBuilder: (context, i) {
//                 return _buildRow(context, items[i]);
//               })),
//     );
//   }

//   _initData() async {
//     _prefs = await SharedPreferences.getInstance();
//     setState(() {
//       _server = _prefs.getString('server') ?? 'demo.cloudwebrtc.com';
//     });
//   }

//   void showDemoDialog<T>({required BuildContext context, required Widget child}) {
//     showDialog<T>(
//       context: context,
//       builder: (BuildContext context) => child,
//     ).then<void>((T? value) {
//       // The value passed to Navigator.pop() or null.
//       if (value != null) {
//         if (value == DialogDemoAction.connect) {
//           _prefs.setString('server', _server);
//           Navigator.push(
//               context,
//               MaterialPageRoute(
//                   builder: (BuildContext context) =>
//                       _datachannel ? DataChannelSample(host: _server) : CallSample(host: _server)));
//         }
//       }
//     });
//   }

//   _showAddressDialog(context) {
//     showDemoDialog<DialogDemoAction>(
//         context: context,
//         child: AlertDialog(
//             title: const Text('Enter server address:'),
//             content: TextField(
//               onChanged: (String text) {
//                 setState(() {
//                   _server = text;
//                 });
//               },
//               decoration: InputDecoration(
//                 hintText: _server,
//               ),
//               textAlign: TextAlign.center,
//             ),
//             actions: <Widget>[
//               TextButton(
//                   child: const Text('CANCEL'),
//                   onPressed: () {
//                     Navigator.pop(context, DialogDemoAction.cancel);
//                   }),
//               TextButton(
//                   child: const Text('CONNECT'),
//                   onPressed: () {
//                     Navigator.pop(context, DialogDemoAction.connect);
//                   })
//             ]));
//   }

//   _initItems() {
//     items = <RouteItem>[
//       RouteItem(
//           title: 'P2P Call Sample',
//           subtitle: 'P2P Call Sample.',
//           push: (BuildContext context) {
//             _datachannel = false;
//             _showAddressDialog(context);
//           }),
//       RouteItem(
//           title: 'Data Channel Sample',
//           subtitle: 'P2P Data Channel.',
//           push: (BuildContext context) {
//             _datachannel = true;
//             _showAddressDialog(context);
//           }),
//     ];
//   }
// }

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_webrtc/flutter_webrtc.dart';
import 'package:jmc_test/firebase_options.dart';
import 'package:jmc_test/signaling.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Signaling signaling = Signaling();
  RTCVideoRenderer _localRenderer = RTCVideoRenderer();
  RTCVideoRenderer _remoteRenderer = RTCVideoRenderer();
  String? roomId;
  TextEditingController textEditingController = TextEditingController(text: '');

  @override
  void initState() {
    _localRenderer.initialize();
    _remoteRenderer.initialize();

    signaling.onAddRemoteStream = ((stream) {
      _remoteRenderer.srcObject = stream;
      setState(() {});
    });

    super.initState();
  }

  @override
  void dispose() {
    _localRenderer.dispose();
    _remoteRenderer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Welcome to Flutter Explained - WebRTC"),
      ),
      body: Column(
        children: [
          SizedBox(height: 8),
          SizedBox(
            height: 40,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                ElevatedButton(
                  onPressed: () {
                    signaling.openUserMedia(_localRenderer, _remoteRenderer);
                  },
                  child: Text("Open camera & microphone"),
                ),
                SizedBox(
                  width: 8,
                ),
                ElevatedButton(
                  onPressed: () async {
                    roomId = await signaling.createRoom(_remoteRenderer);
                    textEditingController.text = roomId!;
                    setState(() {});
                  },
                  child: Text("Create room"),
                ),
                SizedBox(
                  width: 8,
                ),
                ElevatedButton(
                  onPressed: () {
                    // Add roomId
                    signaling.joinRoom(
                      textEditingController.text.trim(),
                      _remoteRenderer,
                    );
                  },
                  child: Text("Join room"),
                ),
                SizedBox(
                  width: 8,
                ),
                ElevatedButton(
                  onPressed: () {
                    signaling.hangUp(_localRenderer);
                  },
                  child: Text("Hangup"),
                )
              ],
            ),
          ),
          SizedBox(height: 8),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(child: RTCVideoView(_localRenderer, mirror: true)),
                  Expanded(child: RTCVideoView(_remoteRenderer)),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Join the following Room: "),
                Flexible(
                  child: TextFormField(
                    controller: textEditingController,
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: 8)
        ],
      ),
    );
  }
}
