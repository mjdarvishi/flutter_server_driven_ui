import 'package:get/get.dart';
import 'package:server_driven_ui/model/schema.model.dart';
import 'package:server_driven_ui/ui/factory/base_widget.dart';
import 'package:server_driven_ui/ui/factory/widgets/selection/multy_item_selction.dart';
import 'package:server_driven_ui/ui/factory/widgets/selection/single_item_selection.driven.dart';
import 'package:server_driven_ui/ui/form.controller.dart';


abstract class SelectionFactory extends BaseDrivenUiInputWidget<SelectionSchemaModel> {
  SelectionFactory(
      {super.key, required SelectionSchemaModel schema})
      : super(schema);
  final controller = Get.find<FormController>();

  factory SelectionFactory.fromType(SelectionSchemaModel schema) {
    if (schema.multySelection) {
      return MultyItemSelectionDriven(schema: schema);
    } else {
      return SingleItemSelectionDriven(schema: schema);
    }
  }
}
