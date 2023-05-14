import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:custom_server_driven_ui/model/schema.model.dart';
import 'package:custom_server_driven_ui/ui/factory/widgets/selection/selection_factory.dart';
import 'package:custom_server_driven_ui/widget/show_list_filter_widget.dart';

class MultyItemSelectionDriven extends SelectionFactory {
  MultyItemSelectionDriven({
    required SelectionSchemaModel schema,
  }) : super(schema: schema);

  @override
  Widget build(BuildContext context) {
   return ShowListFilterWidget<SelectionItemModel>(
       title: schema.name,
       selectedItems: controller.findValue(schema.key),
       itemBuilder: (item, isSelected) => Container(
         color: isSelected ? Colors.yellow : Colors.white,
         width: Get.width,
         padding: const EdgeInsets.symmetric(vertical: 5),
         child: Center(
           child: Text(
             item.key,
             style: Get.context?.textTheme.titleLarge,
           ),
         ),
       ),
       selectCallBack: (itemsSelected) {
        controller.updateValues(schema.key, itemsSelected);
        controller.validateForm();
       },
       items: schema.items);
  }


}
