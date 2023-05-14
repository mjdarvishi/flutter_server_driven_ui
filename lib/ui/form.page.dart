import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:custom_server_driven_ui/model/schema.model.dart';
import 'package:custom_server_driven_ui/ui/form.controller.dart';

class FormPageFactory extends StatelessWidget {
  final FormController controller = Get.put(FormController());
  final List<SchemaModel> schema;
  final Map<String, dynamic> values;

  FormPageFactory({super.key, required this.schema, this.values = const {}}) {
    controller.initialValues(values, schema);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: schema.map((e) => (e as PrePerWidget).buildWidget()).toList(),
    );
  }
}
