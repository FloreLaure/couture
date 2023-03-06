import 'package:flutter/cupertino.dart';

const key = Key("bonjourtoutlemondejesuisonprogra");
final iv = IV.fromUtf8("hellotoutlemonde");

class IV {
  static fromUtf8(String s) {}
}

String encrypt(String text) {
  final encrypter = Encrypter(AES(key, mode: AESMode.cbc));
  final finalCrypt = encrypter.decrypt(text, iv: iv);
  return finalCrypt.base64;
}

String decrypt(String text) {
  final encrypter = Encrypter(AES(key, mode: AESMode.cbc));
  final decrypt = encrypter.decrypt(Encrypted.fromBase64(text), iv: iv);
  return decrypt;
}

class Encrypted {
  static fromBase64(String text) {}
}

class Encrypter {
  Encrypter(AES aes);

  decrypt(fromBase64, {required iv}) {}
}

class AESMode {
  // ignore: prefer_typing_uninitialized_variables
  static var cbc;
}

class AES {
  AES(key, {required mode});
}
