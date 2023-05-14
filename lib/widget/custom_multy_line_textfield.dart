import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:server_driven_ui/widget/border_style.dart';
import 'package:server_driven_ui/widget/button.dart';

class ShowMultyTextFieldModal extends StatefulWidget {
  String title;
  String? value;
  String? Function(String? value)? validator;
  Function(String value) selectCallBack;
  VoidCallback? clearCallBack;

  ShowMultyTextFieldModal({
    Key? key,
    this.value,
    required this.title,
    this.validator,
    this.clearCallBack,
    required this.selectCallBack,
  }) : super(key: key);

  @override
  State<ShowMultyTextFieldModal> createState() =>
      _ShowMultyTextFieldModalState();
}

class _ShowMultyTextFieldModalState extends State<ShowMultyTextFieldModal> {
  TextEditingController textController = TextEditingController();
  String? _value;
  @override
  void initState() {
    super.initState();
    _value = widget.value;
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
                    maxLines: 3,
                    validator: widget.validator,
                    controller: textController,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    style: context.textTheme.titleLarge,
                    cursorColor: Colors.yellow[700],
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
                            change: (){
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
                                Get.back();
                                widget.selectCallBack(
                                    textController.text.replaceAll(',', ''));
                                setState(() {
                                  _value = textController.text;
                                });
                                textController.text = '';
                              }
                            } else {
                              if (widget.validator!(textController.text) ==
                                  null) {
                                Get.back();
                                widget.selectCallBack(
                                    textController.text.replaceAll(',', ''));
                                setState(() {
                                  _value = textController.text;
                                });

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
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  widget.title,
                  style: context.textTheme.titleLarge,
                ),
                const Spacer(),
                Text(
                  _value == null ? 'انتخاب کنید' : 'ویرایش',
                  style: context.textTheme.labelLarge!
                      .copyWith(color: Colors.grey[700]),
                ),
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            if (_value != null)
              ConstrainedBox(
                constraints: BoxConstraints(
                  minWidth: MediaQuery.of(context).size.width,
                  maxHeight: MediaQuery.of(context).size.height * .1,
                ),
                child: SingleChildScrollView(
                  child: Text(
                    _value ?? '',
                    style: context.textTheme.titleLarge!.copyWith(color: Colors.grey[700]),
                  ),
                ),
              )
          ],
        ),
      ),
    );
  }
}
