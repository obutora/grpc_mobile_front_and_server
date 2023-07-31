//
//  Generated code. Do not modify.
//  source: proto/sample.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class SampleType extends $pb.ProtobufEnum {
  static const SampleType NORMAL = SampleType._(0, _omitEnumNames ? '' : 'NORMAL');
  static const SampleType SPECIAL = SampleType._(1, _omitEnumNames ? '' : 'SPECIAL');

  static const $core.List<SampleType> values = <SampleType> [
    NORMAL,
    SPECIAL,
  ];

  static final $core.Map<$core.int, SampleType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static SampleType? valueOf($core.int value) => _byValue[value];

  const SampleType._($core.int v, $core.String n) : super(v, n);
}


const _omitEnumNames = $core.bool.fromEnvironment('protobuf.omit_enum_names');
