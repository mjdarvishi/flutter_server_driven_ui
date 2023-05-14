import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:server_driven_ui/widget/button.dart';

class ShowListFilterWidget<T> extends StatefulWidget {
  String title;
  List<T> items;
  List<T>? selectedItems;
  Widget Function(T item, bool isSelected) itemBuilder;
  Function(List<T> itemsSelected) selectCallBack;

  ShowListFilterWidget({
    Key? key,
    this.selectedItems,
    required this.title,
    required this.itemBuilder,
    required this.selectCallBack,
    required this.items,
  }) : super(key: key);

  @override
  State<ShowListFilterWidget<T>> createState() =>
      _ShowListFilterWidgetState<T>();
}

class _ShowListFilterWidgetState<T> extends State<ShowListFilterWidget<T>> {
  List<T> _selectedItems = [];
  ScrollController scrollController = ScrollController();
  @override
  void initState() {
    super.initState();
    if (widget.selectedItems != null) {
      _selectedItems = widget.selectedItems!;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        showModalBottomSheet<dynamic>(
          context: context,
          isScrollControlled: true,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
          ),
          builder: (context1) {
            return StatefulBuilder(
              builder: (BuildContext context,
                      void Function(void Function()) setStateModal) =>
                  Column(
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
                  Directionality(
                    textDirection: TextDirection.ltr,
                    child: ConstrainedBox(
                      constraints: BoxConstraints(maxHeight: Get.height * .5),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: RawScrollbar(
                          controller: scrollController,
                          thumbColor: Colors.grey,
                          radius: const Radius.circular(20),
                          thickness: 5,
                          thumbVisibility: true,
                          child: SingleChildScrollView(
                            controller: scrollController,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                for (var item in widget.items)
                                  GestureDetector(
                                      onTap: () {
                                        print(_selectedItems.indexWhere(
                                            (element) => element == item));
                                        int index = _selectedItems.indexWhere(
                                            (element) => element == item);
                                        if (index != -1) {
                                          _selectedItems.removeAt(index);
                                        } else {
                                          _selectedItems.add(item);
                                        }
                                        widget.selectCallBack(_selectedItems);
                                        setStateModal(() {});
                                        setState(() {});
                                      },
                                      child: widget.itemBuilder(
                                          item,
                                          _selectedItems.indexWhere(
                                                  (element) => element == item) !=
                                              -1)),
                                const SizedBox(
                                  height: 15,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Button(
                    change: () => Get.back(),
                    title: 'بازگشت',
                    color: Colors.yellow[700]!,
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
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 16),
        width: Get.width,
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
            const Spacer(),
            Text(
              _selectedItems.isNotEmpty
                  ? '${_selectedItems.length} مورد '
                  : 'انتخاب کنید',
              style: context.textTheme.titleLarge!.copyWith(color: Colors.grey[700]),
            ),
          ],
        ),
      ),
    );
  }
}
