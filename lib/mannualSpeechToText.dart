// import 'dart:async';
//
// import 'package:flutter/material.dart';
// import 'package:manual_speech_to_text/manual_speech_to_text.dart';
//
//
// class ManualSpeechRecognitionExample extends StatefulWidget {
//   const ManualSpeechRecognitionExample({super.key});
//
//   @override
//   State<ManualSpeechRecognitionExample> createState() =>
//       _ManualSpeechRecognitionStateExample();
// }
//
// class _ManualSpeechRecognitionStateExample
//     extends State<ManualSpeechRecognitionExample> {
//   String _finalRecognizedText ='';
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text("Manual Speech Recognition")),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//
//               Text(
//                 'Final Recognized Text: $_finalRecognizedText',
//                 style: const TextStyle(fontSize: 20),
//               ),
//               Spacer(),
//               IconButton(onPressed: (){
//                 _shoDialog();
//               }, icon: Icon(Icons.mic,size: 50,))
//
//
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   void _shoDialog()async{
//   final res= await showDialog<String>(context: context, builder: (context)=>ShowDialogForMic());
//   if(res != null){
//     _finalRecognizedText = res;
//     setState(() {
//
//     });
//   }
//   }
// }
//
//
// class ShowDialogForMic extends StatefulWidget {
//
//
//   const ShowDialogForMic({super.key});
//
//   @override
//   State<ShowDialogForMic> createState() => _ShowDialogForMicState();
// }
//
// class _ShowDialogForMicState extends State<ShowDialogForMic> {
//   late ManualSttController _controller;
//   String _finalRecognizedText = '';
//   ManualSttState _currentState = ManualSttState.stopped;
//   double _soundLevel = 0.0;
//
//   @override
//   void initState() {
//     super.initState();
//     _controller = ManualSttController(context);
//     _setupController();
//    Future.delayed(Duration(seconds: 1)).then((onValue){
//      _controller.startStt();
//    });
//
//   }
//
//   void _setupController() {
//     _controller.listen(
//       onListeningStateChanged: (state) {
//         setState(() => _currentState = state);
//       },
//       onListeningTextChanged: (recognizedText) {
//         setState(() => _finalRecognizedText = recognizedText);
//       },
//       onSoundLevelChanged: (level) {
//         setState(() => _soundLevel = level);
//       },
//     );
//
//     //? Optional: clear text on start
//     // _controller.clearTextOnStart = false;
//
//     //? Optional: Set language
//     // _controller.localId = 'en-US';
//
//     //? Optional: Enable haptic feedback
//     // _controller.enableHapticFeedback = true;
//
//     //? Optional: pause if mute for specified duration
//     _controller.pauseIfMuteFor = Duration(seconds: 5);
//
//     //? Optional: Handle permanently denied microphone permission
//     // _controller.handlePermanentlyDeniedPermission(() {
//     //   ScaffoldMessenger.of(context).showSnackBar(
//     //     const SnackBar(content: Text('Microphone permission is required')),
//     //   );
//     // });
//
//     //? Optional: Customize Permission Dialog
//     // NOTE: if [handlePermanentlyDeniedPermission] this function is used, then below dialog's customization won't work.
//
//     //? Optional:
//     // _controller.permanentDenialDialogTitle = 'Microphone Access Required';
//
//     //? Optional:
//     // _controller.permanentDenialDialogContent =
//     //     'Speech-to-text functionality needs microphone permission.';
//   }
//
//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Dialog(
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(15),
//       ),
//       child: GestureDetector(
//         onTap: () {
//           FocusScope.of(context).unfocus();
//         },
//         child: Container(
//           padding: const EdgeInsets.all(20),
//           width: MediaQuery.of(context).size.width / 3.3,
//           height: MediaQuery.of(context).size.height / 3,
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Expanded(
//                 child: Text(
//                   _finalRecognizedText,
//                   style: const TextStyle(fontSize: 20),
//                 ),
//               ),
//               const SizedBox(height: 10),
//               LinearProgressIndicator(
//                 value: _soundLevel.clamp(0.0, 1.0),
//               ),
//               const SizedBox(height: 10),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: [
//                   ElevatedButton(
//                     onPressed: _currentState == ManualSttState.listening
//                         ? _controller.pauseStt
//                         : _currentState == ManualSttState.paused
//                         ? _controller.resumeStt
//                         : null,
//                     child: Text(
//                       _currentState == ManualSttState.paused
//                           ? 'Resume'
//                           : 'Pause',
//                     ),
//                   ),
//                   ElevatedButton(
//                     onPressed: _currentState != ManualSttState.stopped
//                         ? () {
//                       _controller.stopStt();
//                       Navigator.pop(context, _finalRecognizedText);
//                     }
//                         : null,
//                     child: const Text('Stop'),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
