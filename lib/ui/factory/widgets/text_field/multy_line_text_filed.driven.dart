import 'package:flutter/material.dart';
import 'package:server_driven_ui/model/schema.model.dart';
import 'package:server_driven_ui/ui/factory/widgets/text_field/text_field_factory.dart';
import 'package:server_driven_ui/widget/custom_multy_line_textfield.dart';

class MultyLineTextFieldDriven extends TextFieldFactory {
  MultyLineTextFieldDriven({
    required TextFieldSchemaModel schema,
  }) : super(schema);

  @override
  Widget build(BuildContext context) {
    return ShowMultyTextFieldModal(
      title: schema.name,
      value: controller.findValue(schema.key),
      selectCallBack: (value) {
        if (schema.getValidation == null) {
          controller.updateValues(schema.key, value);
        } else {
          if (schema.getValidation!(value) == null) {
            controller.updateValues(schema.key, value);
          }
          controller.validateForm();
        }
      },
      validator: schema.getValidation,
      clearCallBack: schema.essencial
          ? null
          : () {
              controller.updateValues(schema.key, null);
              controller.validateForm();
            },
    );
  }
}
