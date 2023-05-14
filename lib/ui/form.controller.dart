import 'package:get/get.dart';
import 'package:custom_server_driven_ui/model/schema.model.dart';
import 'package:custom_server_driven_ui/utils/utils.dart';

class FormController extends GetxController {
  Rx<Map<String, dynamic>> values = Rx({});
  Rx<bool> isValidForm = Rx(false);

  void initialValues(Map<String, dynamic> values, List<SchemaModel> schema) {
    this.values.value = copyDeepMap(values);
    for (var item in schema) {
      if ((item is InputFieldSchemaModel) &&
          !this.values.value.containsKey(item.key)) {
        setValues(item.key, item.getMapData());
      }
    }
  }

  void updateValues(String key, selected) {
    values.value[key]['value'] = selected;
  }

  void setValues(String key, value) {
    values.value[key] = value;
  }

  findValue(String key) {
    return values.value[key]?['value'];
  }

  void validateForm() {
    for (var item in values.value.values) {
      if (item['value'] == null && item['essencial']) {
        isValidForm.value = false;
        break;
      }
    }
    isValidForm.value = true;
  }

  Map<String, dynamic>? getValues() {
    if (isValidForm.value) {
      Map<String, dynamic> filteredMap = Map<String, dynamic>.of(values.value)
        ..removeWhere((key, value) => value['value'] == null);
      return filteredMap;
    }
    return null;
  }
}
