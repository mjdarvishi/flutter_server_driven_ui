import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:custom_server_driven_ui/model/schema.model.dart';
import 'package:custom_server_driven_ui/ui/factory/base_widget.dart';
import 'package:custom_server_driven_ui/ui/form.controller.dart';

class SwitchDriven extends BaseDrivenUiStateFullWidget<SwitchSchemaModel> {
  const SwitchDriven({super.key, required schema}) : super(schema);

  @override
  State<StatefulWidget> createState() => _SwitchDrivenState();
}

class _SwitchDrivenState extends State<SwitchDriven> {
  final controller = Get.find<FormController>();
  late bool _isSelected;
  @override
  void initState() {
    super.initState();
    _isSelected= controller.findValue(widget.schema.key) ?? false;
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(10, 13, 10, 13),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.schema.name,
                style: context.textTheme.titleLarge,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: SizedBox(
                  height: 30,
                  width: 30,
                  child: Switch(
                    value:_isSelected,
                    inactiveTrackColor: Colors.grey,
                    activeColor:Colors.yellow[700],
                    onChanged: (value) {
                      controller.updateValues(widget.schema.key, value);
                      setState(()=>_isSelected=value);
                      controller.validateForm();
                    },
                  ),
                ),
              )
            ],
          ),
        ),
        const Divider(
          thickness: 1,
          color: Colors.black12,
        )
      ],
    );
  }
}
