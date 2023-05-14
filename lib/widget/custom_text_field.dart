import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:server_driven_ui/widget/border_style.dart';
import 'package:server_driven_ui/widget/button.dart';
import 'package:pattern_formatter/numeric_formatter.dart';

class ShowTextFieldModal extends StatefulWidget {
  String title;
  String? value;
  TextInputType? keyboardType;
  String? Function(String? value)? validator;
  Function(String value) selectCallBack;
  VoidCallback? clearCallBack;

  ShowTextFieldModal({
    this.value,
    required this.title,
    this.keyboardType = TextInputType.number,
    this.validator,
    this.clearCallBack,
    required this.selectCallBack,
  }) : super();

  @override
  State<ShowTextFieldModal> createState() => _ShowTextFieldModalState();
}

class _ShowTextFieldModalState extends State<ShowTextFieldModal> {
  TextEditingController textController = TextEditingController();
  String? _value;
  @override
  void initState() {
    super.initState();
    _value = widget.value;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (_value != null) {
          textController.text = _value!;
        } else {
          textController.text = '';
        }

        showModalBottomSheet<dynamic>(
          context: context,
          isScrollControlled: true,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
          ),
          builder: (context) {
            return Padding(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(
                    Icons.remove,
                    size: 20,
                    color: Colors.black87,
                  ),
                  Text(
                    widget.title.replaceAll('*', ''),
                    style: context.textTheme.titleLarge,
                  ),
                  const Padding(
                    padding:
                        EdgeInsets.symmetric(vertical: 8.0, horizontal: 25),
                    child: Divider(
                      color: Colors.grey,
                      thickness: 1,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    autofocus: true,
                    validator: widget.validator,
                    controller: textController,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    keyboardType: widget.keyboardType,
                    style: context.textTheme.titleLarge,
                    cursorColor: Colors.yellow[700],
                    inputFormatters: widget.keyboardType == TextInputType.number
                        ? [ThousandsFormatter()]
                        : null,
                    decoration: InputDecoration(
                      prefixIcon: Padding(
                        padding: const EdgeInsets.fromLTRB(5, 13, 15, 0),
                        child: Text(
                          widget.title,
                          style: context.textTheme.titleLarge,
                        ),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                        vertical: 15,
                      ),
                      border: addAdsBorder,
                      enabledBorder: addAdsBorder,
                      focusedBorder: addAdsFocusBorder,
                    ),
                  ),
                  Row(
                    children: [
                      if (widget.validator == null)
                        Flexible(
                          flex: 1,
                          child: Button(
                            color: Colors.red,
                            title: 'پاک کردن',
                            change: () {
                              if (widget.clearCallBack != null) {
                                widget.clearCallBack!();
                                textController.text = '';
                                setState(() {
                                  _value = null;
                                });
                              }
                              Get.back();
                            },
                          ),
                        ),
                      Flexible(
                        flex: 1,
                        child: Button(
                          color: Colors.yellow[700]!,
                          title: 'تایید',
                          change: () {
                            if (widget.validator == null) {
                              if (textController.text.isNotEmpty) {
                                widget.selectCallBack(
                                    textController.text.replaceAll(',', ''));
                                setState(() {
                                  _value = textController.text;
                                });
                                Get.back();
                                textController.text = '';
                              }
                            } else {
                              if (widget.validator!(textController.text) ==
                                  null) {
                                widget.selectCallBack(
                                    textController.text.replaceAll(',', ''));
                                setState(() {
                                  _value = textController.text;
                                });
                                Get.back();
                                textController.text = '';
                              }
                            }
                          },
                        ),
                      ),
                    ],
                  )
                ],
              ),
            );
          },
          backgroundColor: Colors.white,
          elevation: 2,
        );
      },
      child: Container(
        width: Get.width,
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 16),
        decoration: const BoxDecoration(
            border: Border(
                bottom: BorderSide(
          color: Colors.black12,
          width: 1,
        ))),
        child: Row(
          children: [
            Text(
              widget.title,
              style: context.textTheme.labelLarge,
            ),
            Text(
              _value ?? '',
              style: context.textTheme.titleLarge,
            ),
            const Spacer(),
            Text(
              _value == null ? 'انتخاب کنید' : 'ویرایش',
              style: context.textTheme.titleLarge!.copyWith(color: Colors.grey[700]),
            ),
          ],
        ),
      ),
    );
  }
}
