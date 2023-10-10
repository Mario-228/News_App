import 'package:shared_preferences/shared_preferences.dart';

class Cache
{
  static SharedPreferences? cacheMemory;

 static Future<void> init()async
 {
  cacheMemory=await SharedPreferences.getInstance();
 }
 static Future<bool> putData(String key,bool value)async
 {
 return await cacheMemory!.setBool(key, value);
 }
 static bool? getData(String key)
 {
    return cacheMemory!.getBool(key);
 }
}