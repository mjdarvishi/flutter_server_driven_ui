import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:custom_server_driven_ui/model/schema.model.dart';
import 'package:custom_server_driven_ui/ui/factory/widgets/selection/selection_factory.dart';
import 'package:custom_server_driven_ui/widget/show_filter_widget.dart';

class SingleItemSelectionDriven extends SelectionFactory {
  SingleItemSelectionDriven({required SelectionSchemaModel schema, this.value})
      : super(schema: schema);
  String? value;

  @override
  Widget build(BuildContext context) {
    return ShowSingleFilterWidget<SelectionItemModel>(
        title: schema.name,
       showItemSelection: (item) => item.key,
        selectedItem: controller.findValue(schema.key),
        itemBuilder: (item) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Text(
                item.key,
                style: Get.context?.textTheme.titleLarge,
              ),
            ),
        selectCallBack: (itemsSelected) {
          controller.updateValues(schema.key, itemsSelected);
          controller.validateForm();
          Get.back();
        },
        items: schema.items);
  }
}
