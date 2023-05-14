import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:server_driven_ui/model/schema.model.dart';
import 'package:server_driven_ui/ui/factory/base_widget.dart';
import 'package:server_driven_ui/ui/form.controller.dart';
import 'package:server_driven_ui/widget/show_filter_widget.dart';

class RangDriven extends BaseDrivenUiWidget<RangSchemaModel> {
  final controller = Get.find<FormController>();

  RangDriven({super.key, required RangSchemaModel schema}) : super(schema);
  SelectionItemModel? _from;
  SelectionItemModel? _to;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ShowSingleFilterWidget<SelectionItemModel>(
              title: ' از${schema.name}',
              selectedItem: controller.findValue(schema.key),
              showItemSelection: (item) => item.key,
              itemBuilder: (item) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Text(
                      item.key,
                      style: Get.context?.textTheme.titleLarge,
                    ),
                  ),
              selectCallBack: (itemsSelected) {
                _from = itemsSelected;
                Get.back();
                if (_to != null) {
                  controller.updateValues(schema.key, itemsSelected);
                }
              },
              items: schema.from),
        ),
        Expanded(
          child: ShowSingleFilterWidget<SelectionItemModel>(
              title: ' تا${schema.name}',
              selectedItem: controller.findValue(schema.key),
              showItemSelection: (item) => item.key,
              itemBuilder: (item) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Text(
                      item.key,
                      style: Get.context?.textTheme.titleLarge,
                    ),
                  ),
              selectCallBack: (itemsSelected) {
                _to = itemsSelected;
                Get.back();
                if (_from != null) {
                  controller.updateValues(schema.key, itemsSelected);
                  controller.validateForm();
                }
              },
              items: schema.to),
        ),
      ],
    );
  }
}
