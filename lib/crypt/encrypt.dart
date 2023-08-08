import 'package:encrypt/encrypt.dart';

final key=Key.fromUtf8('MySecretKeyForEncryptionAndDecry');//32 chars
final iv=IV.fromUtf8('helloworldhellow');//16 chars

//flutter encryption
String encryp(String text){
  final encrypter=Encrypter(AES(key,mode: AESMode.cbc));
  final encrypted=encrypter.encrypt(text,iv: iv);
  print('text:$text');
  print('encrypted: ${encrypted.base64}');
  return encrypted.base64;

}

String decryp(String text){
  final encrypter=Encrypter(AES(key,mode: AESMode.cbc));
  final decrypted=encrypter.decrypt(Encrypted.fromBase16(text),iv:iv);
  return decrypted;

}