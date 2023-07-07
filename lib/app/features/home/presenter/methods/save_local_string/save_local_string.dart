import 'package:dictionary_challenge/app/features/home/presenter/methods/save_local_string/helpers/response_item_local.dart';
import 'package:dictionary_challenge/app/features/home/presenter/methods/save_local_string/helpers/save_local_param.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'helpers/get_local_param.dart';

class SaveLocalString {
  static Future<SharedPreferences> _initSharedpreferences() async =>
      await SharedPreferences.getInstance();

  static Future<List<ResponseItemLocal?>?> getItems(GetLocalParam param) async {
    final prefs = await _initSharedpreferences();
    final response = prefs.getStringList(param.key);
    return response?.map((e) => ResponseItemLocal(item: e)).toList();
  }

  static Future<void> saveLocalListString(SaveLocalParam param) async {
    final prefs = await _initSharedpreferences();
    await prefs.setStringList(
      param.key,
      param.itemsToSave.sublist(0, 70).map((e) => e).toList(),
    );
  }
}
