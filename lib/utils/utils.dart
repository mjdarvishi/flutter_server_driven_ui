
import 'package:server_driven_ui/model/schema.model.dart';

Map<String, dynamic> copyDeepMap(Map<String, dynamic> map) {
  Map<String, dynamic> newMap = {};

  map.forEach((String key, dynamic value) {
    if (value is Map<String, dynamic>) {
      newMap[key] = copyDeepMap(value);
    } else if (value is List<SelectionItemModel>) {
      newMap[key] = List<SelectionItemModel>.of(value);
    } else {
      newMap[key] = value;
    }
  });

  return newMap;
}

String convertToString(dynamic value){
  if(value is int) {
    return value.toString();
  }
  if(value==null){
    return 'not register';
  }
  return value as String;
}