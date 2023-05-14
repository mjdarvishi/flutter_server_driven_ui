import 'package:get/get.dart';
import 'package:server_driven_ui/model/schema.model.dart';
import 'package:server_driven_ui/ui/factory/base_widget.dart';
import 'package:server_driven_ui/ui/factory/widgets/text_field/multy_line_text_filed.driven.dart';
import 'package:server_driven_ui/ui/factory/widgets/text_field/one_line_text_field.driven.dart';
import 'package:server_driven_ui/ui/form.controller.dart';

abstract class TextFieldFactory
    extends BaseDrivenUiInputWidget<TextFieldSchemaModel> {
  final controller = Get.find<FormController>();

  TextFieldFactory(TextFieldSchemaModel schema, {super.key}) : super(schema);

  factory TextFieldFactory.fromType(TextFieldSchemaModel schema) {
    if (schema.multyLine) {
      return MultyLineTextFieldDriven(schema: schema);
    } else {
      return SingleLineTextFieldDriven(schema: schema);
    }
  }
}
