import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:server_driven_ui/ui/factory/widgets/rang.dart';
import 'package:server_driven_ui/ui/factory/widgets/selection/selection_factory.dart';
import 'package:server_driven_ui/ui/factory/widgets/switch.dart';
import 'package:server_driven_ui/ui/factory/widgets/text_field/text_field_factory.dart';
import 'package:server_driven_ui/utils/utils.dart';

part 'schema.model.g.dart';

typedef String? validationFunc(String? value);

enum InputType {
  @JsonValue('text')
  text,
  @JsonValue('number')
  number,
}

enum SchemaType {
  @JsonValue('input')
  input,
  @JsonValue('select')
  select,
  @JsonValue('range')
  rang,
  @JsonValue('btn')
  btn,
  @JsonValue('bool')
  bool,
}

mixin PrePerWidget {
  Widget buildWidget();
}

@JsonSerializable()
class SchemaModel {
  SchemaModel(this.type, this.name);

  SchemaType type;
  String name;

  factory SchemaModel.fromJson(Map<String, dynamic> json) {
    if ($enumDecode(_$SchemaTypeEnumMap, json['type']) == SchemaType.select) {
      return SelectionSchemaModel.fromJson(json);
    }
    if ($enumDecode(_$SchemaTypeEnumMap, json['type']) == SchemaType.input) {
      return TextFieldSchemaModel.fromJson(json);
    }
    if ($enumDecode(_$SchemaTypeEnumMap, json['type']) == SchemaType.rang) {
      return RangSchemaModel.fromJson(json);
    }
    if ($enumDecode(_$SchemaTypeEnumMap, json['type']) == SchemaType.bool) {
      return SwitchSchemaModel.fromJson(json);
    }
    if ($enumDecode(_$SchemaTypeEnumMap, json['type']) == SchemaType.btn) {
      return BtnSchemaModel.fromJson(json);
    }
    return SchemaModel.fromJson(json);
  }

  Map<String, dynamic> toJson() => _$SchemaModelToJson(this);
}

abstract class InputFieldSchemaModel extends SchemaModel with PrePerWidget {
  InputFieldSchemaModel(SchemaType type, String title, this.key,
      {this.essencial = false})
      : super(type, title);
  @JsonKey(fromJson: convertToString)
  String key;
  bool essencial;

  Map<String, dynamic> getMapData() {
    return <String, dynamic>{
      'title': name,
      'value': null,
      'essencial': essencial
    };
  }
}

@JsonSerializable()
class BtnSchemaModel extends SchemaModel with PrePerWidget{
  String key;
  BtnSchemaModel(
      SchemaType type, name,this.key)
      : super(type, name,);

  factory BtnSchemaModel.fromJson(Map<String, dynamic> json) =>
      _$BtnSchemaModelFromJson(json);

  Map<String, dynamic> toJson() => _$BtnSchemaModelToJson(this);

  @override
  Widget buildWidget() {
    return const SizedBox();
  }
}
@JsonSerializable()
class TextFieldSchemaModel extends InputFieldSchemaModel {
  TextFieldSchemaModel(
      SchemaType type, String name, this.inputType, String key,
      {this.multyLine = false, bool essencial = false})
      : super(type, name, key, essencial: essencial);
  InputType inputType;
  bool multyLine;

  factory TextFieldSchemaModel.fromJson(Map<String, dynamic> json) =>
      _$TextFieldSchemaModelFromJson(json);

  Map<String, dynamic> toJson() => _$TextFieldSchemaModelToJson(this);

  @override
  Widget buildWidget() {
    return TextFieldFactory.fromType(
      this,
    );
  }
}

@JsonSerializable()
class SwitchSchemaModel extends InputFieldSchemaModel {
  SwitchSchemaModel(SchemaType type, String name, String key,
      {bool essencial = false})
      : super(type, name, key, essencial: essencial);

  factory SwitchSchemaModel.fromJson(Map<String, dynamic> json) =>
      _$SwitchSchemaModelFromJson(json);

  Map<String, dynamic> toJson() => _$SwitchSchemaModelToJson(this);

  @override
  Widget buildWidget() {
    return SwitchDriven(schema: this);
  }
}

@JsonSerializable()
class RangSchemaModel extends InputFieldSchemaModel {
  RangSchemaModel(SchemaType type, String name, String key,
      {this.to = const [], this.from = const [], bool essencial = false})
      : super(type, name, key, essencial: essencial);
  List<SelectionItemModel> from;
  List<SelectionItemModel> to;

  factory RangSchemaModel.fromJson(Map<String, dynamic> json) =>
      _$RangSchemaModelFromJson(json);

  Map<String, dynamic> toJson() => _$RangSchemaModelToJson(this);

  @override
  Widget buildWidget() {
    return RangDriven(
      schema: this,
    );
  }
}

@JsonSerializable()
class SelectionSchemaModel extends InputFieldSchemaModel {
  SelectionSchemaModel(SchemaType type, String name, String key,
      {this.multySelection = false,
      this.items = const [],
      bool essencial = false})
      : super(type, name, key, essencial: essencial);
  List<SelectionItemModel> items;
  bool multySelection;

  factory SelectionSchemaModel.fromJson(Map<String, dynamic> json) =>
      _$SelectionSchemaModelFromJson(json);

  Map<String, dynamic> toJson() => _$SelectionSchemaModelToJson(this);

  @override
  Widget buildWidget() {
    return SelectionFactory.fromType(
      this,
    );
  }
}

@JsonSerializable()
class SelectionItemModel {
  SelectionItemModel(this.value, this.key);

  @JsonKey(fromJson: convertToString)
  String key;
  dynamic value;

  factory SelectionItemModel.fromJson(Map<String, dynamic> json) {
    return _$SelectionItemModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$SelectionItemModelToJson(this);

  @override
  bool operator ==(Object other) =>
      other is SelectionItemModel && other.key == key;
}

@JsonSerializable()
class UiModel {
  UiModel(this.data);

  List<SchemaModel> data;

  factory UiModel.fromJson(Map<String, dynamic> json) =>
      _$UiModelFromJson(json);

  Map<String, dynamic> toJson() => _$UiModelToJson(this);
}
