// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:myspeech_to_text/getX.dart';
// import 'package:speech_to_text/speech_recognition_result.dart';
// import 'package:speech_to_text/speech_to_text.dart';
//
// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       home: MyHomePage(),
//     );
//   }
// }
//
// class MyHomePage extends StatefulWidget {
//   MyHomePage({Key? key}) : super(key: key);
//
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//   SpeechToText _speechToText = SpeechToText();
//   final SpeechController _speechController = Get.put(SpeechController());
//   int count = 0;
//   List<String> prevWords =[];
//   String finalString  = '';
//
//   @override
//   void initState() {
//     super.initState();
//     _initSpeech();
//   }
//
//   void _initSpeech() async {
//     bool res = await _speechToText.initialize();
//     _speechController.setSpeedEnabled(res);
//   }
//
//   void start() {
//     finalString ='';
//     count = 0;
//     _startRecorsively();
//   }
//
//   void _startRecorsively() {
//     count++;
//     _startListening();
//     Future.delayed(Duration(milliseconds: 1500), () {
//       print("count:$count");
//       if (count < 15) {
//         print("recursion called");
//         _startRecorsively();
//       }
//       else if(count==15){
//         for(int i=0;i<prevWords.length;i++){
//           finalString += prevWords[i];
//           finalString +=" ";
//         }
//         setState(() {
//           prevWords.clear();
//         });
//       }
//       // if (_speechController.lastWords.value == '' && count < 15) {
//       //   print("recursion called");
//       //   _startRecorsively();
//       // }
//       // else if(_speechController.lastWords.value != '' && count<15){
//       //  _startRecorsively();
//       // }
//     });
//   }
//
//   void _startListening() async {
//     prevWords.add(_speechController.lastWords.value);
//     _speechController.lastWords = ''.obs;
//
//     await _speechToText.listen(
//         listenOptions: SpeechListenOptions(
//           onDevice: false,
//         ),
//         pauseFor: Duration(seconds: 10),
//         listenFor: Duration(seconds: 20),
//         localeId: "en-US",
//         onResult: (SpeechRecognitionResult result) {
//           String words = result.recognizedWords;
//           print(words);
//           _speechController.setLastWords(result.recognizedWords);
//           setState(() {
//
//           });
//         });
//
//     setState(() {
//
//     });
//   }
//
//
//   void _stopListening() async {
//     await _speechToText.stop();
//     setState(() {
//       _speechController.lastWords = ''.obs;
//     });
//   }
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Speech Demo'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Container(
//               padding: EdgeInsets.all(16),
//               child: Text(
//                 'Recognized words:',
//                 style: TextStyle(fontSize: 20.0),
//               ),
//             ),
//             Expanded(
//               child: Column(
//                 children:[ Container(
//                   padding: EdgeInsets.all(16),
//                   child: Text(
//                     // If listening is active show the recognized words
//                     count!=0
//                         ? '${_speechController.lastWords.value}'
//
//                         : _speechController.speechEnabled.value
//                         ? 'Tap the microphone to start listening...'
//                         : 'Speech not available',
//                   ),
//                 ),
//                   Text(finalString,style: TextStyle(fontSize: 20),)
//       ]
//               ),
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed:
//         // If not yet listening for speech start, otherwise stop
//         count!=0 ? _startListening : _stopListening,
//         tooltip: 'Listen',
//         child: Icon(count!=0 ? Icons.mic_off : Icons.mic),
//       ),
//     );
//   }
// }
//


// import 'package:flutter/material.dart';
//
// import 'mannualSpeechToText.dart';
//
// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: ManualSpeechRecognitionExample(),
//     );
//   }
// }
