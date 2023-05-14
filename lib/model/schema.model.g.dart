// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'schema.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SchemaModel _$SchemaModelFromJson(Map<String, dynamic> json) => SchemaModel(
      $enumDecode(_$SchemaTypeEnumMap, json['type']),
      json['name'] as String,
    );

Map<String, dynamic> _$SchemaModelToJson(SchemaModel instance) =>
    <String, dynamic>{
      'type': _$SchemaTypeEnumMap[instance.type]!,
      'name': instance.name,
    };

const _$SchemaTypeEnumMap = {
  SchemaType.input: 'input',
  SchemaType.select: 'select',
  SchemaType.rang: 'range',
  SchemaType.btn: 'btn',
  SchemaType.bool: 'bool',
};

BtnSchemaModel _$BtnSchemaModelFromJson(Map<String, dynamic> json) =>
    BtnSchemaModel(
      $enumDecode(_$SchemaTypeEnumMap, json['type']),
      json['name'],
      json['key'] as String,
    );

Map<String, dynamic> _$BtnSchemaModelToJson(BtnSchemaModel instance) =>
    <String, dynamic>{
      'type': _$SchemaTypeEnumMap[instance.type]!,
      'name': instance.name,
      'key': instance.key,
    };

TextFieldSchemaModel _$TextFieldSchemaModelFromJson(
        Map<String, dynamic> json) =>
    TextFieldSchemaModel(
      $enumDecode(_$SchemaTypeEnumMap, json['type']),
      json['name'] as String,
      $enumDecode(_$InputTypeEnumMap, json['inputType']),
      json['key'] as String,
      multyLine: json['multyLine'] as bool? ?? false,
      essencial: json['essencial'] as bool? ?? false,
    );

Map<String, dynamic> _$TextFieldSchemaModelToJson(
        TextFieldSchemaModel instance) =>
    <String, dynamic>{
      'type': _$SchemaTypeEnumMap[instance.type]!,
      'name': instance.name,
      'key': instance.key,
      'essencial': instance.essencial,
      'inputType': _$InputTypeEnumMap[instance.inputType]!,
      'multyLine': instance.multyLine,
    };

const _$InputTypeEnumMap = {
  InputType.text: 'text',
  InputType.number: 'number',
};

SwitchSchemaModel _$SwitchSchemaModelFromJson(Map<String, dynamic> json) =>
    SwitchSchemaModel(
      $enumDecode(_$SchemaTypeEnumMap, json['type']),
      json['name'] as String,
      json['key'] as String,
      essencial: json['essencial'] as bool? ?? false,
    );

Map<String, dynamic> _$SwitchSchemaModelToJson(SwitchSchemaModel instance) =>
    <String, dynamic>{
      'type': _$SchemaTypeEnumMap[instance.type]!,
      'name': instance.name,
      'key': instance.key,
      'essencial': instance.essencial,
    };

RangSchemaModel _$RangSchemaModelFromJson(Map<String, dynamic> json) =>
    RangSchemaModel(
      $enumDecode(_$SchemaTypeEnumMap, json['type']),
      json['name'] as String,
      json['key'] as String,
      to: (json['to'] as List<dynamic>?)
              ?.map(
                  (e) => SelectionItemModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      from: (json['from'] as List<dynamic>?)
              ?.map(
                  (e) => SelectionItemModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      essencial: json['essencial'] as bool? ?? false,
    );

Map<String, dynamic> _$RangSchemaModelToJson(RangSchemaModel instance) =>
    <String, dynamic>{
      'type': _$SchemaTypeEnumMap[instance.type]!,
      'name': instance.name,
      'key': instance.key,
      'essencial': instance.essencial,
      'from': instance.from,
      'to': instance.to,
    };

SelectionSchemaModel _$SelectionSchemaModelFromJson(
        Map<String, dynamic> json) =>
    SelectionSchemaModel(
      $enumDecode(_$SchemaTypeEnumMap, json['type']),
      json['name'] as String,
      json['key'] as String,
      multySelection: json['multySelection'] as bool? ?? false,
      items: (json['items'] as List<dynamic>?)
              ?.map(
                  (e) => SelectionItemModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      essencial: json['essencial'] as bool? ?? false,
    );

Map<String, dynamic> _$SelectionSchemaModelToJson(
        SelectionSchemaModel instance) =>
    <String, dynamic>{
      'type': _$SchemaTypeEnumMap[instance.type]!,
      'name': instance.name,
      'key': instance.key,
      'essencial': instance.essencial,
      'items': instance.items,
      'multySelection': instance.multySelection,
    };

SelectionItemModel _$SelectionItemModelFromJson(Map<String, dynamic> json) =>
    SelectionItemModel(
      json['value'],
      json['key'] as String,
    );

Map<String, dynamic> _$SelectionItemModelToJson(SelectionItemModel instance) =>
    <String, dynamic>{
      'key': instance.key,
      'value': instance.value,
    };

UiModel _$UiModelFromJson(Map<String, dynamic> json) => UiModel(
      (json['data'] as List<dynamic>)
          .map((e) => SchemaModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$UiModelToJson(UiModel instance) => <String, dynamic>{
      'data': instance.data,
    };
