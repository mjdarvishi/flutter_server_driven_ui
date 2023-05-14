import 'package:flutter/material.dart';

typedef BtnCallBack = void Function(Map<String, dynamic> items);

abstract class BaseDrivenUiWidget<S> extends StatelessWidget {
  final S schema;
  const BaseDrivenUiWidget(this.schema, {super.key});
}
abstract class BaseDrivenUiStateFullWidget<S> extends StatefulWidget {
  final S schema;
  const BaseDrivenUiStateFullWidget(this.schema, {super.key});
}

abstract class BaseDrivenUiInputWidget<S> extends BaseDrivenUiWidget<S>{
  const BaseDrivenUiInputWidget(S schema, {super.key}):super(schema);

}