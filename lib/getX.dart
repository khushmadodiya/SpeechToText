
import 'package:get/get.dart';

class SpeechController extends GetxController{
 RxBool  speechEnabled = false.obs;
 RxString lastWords = ''.obs;
 void setSpeedEnabled(bool val){
   speechEnabled = val.obs;
 }
 void setLastWords(String val){
   lastWords = val.obs;
 }
}