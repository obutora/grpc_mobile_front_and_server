//
//  Generated code. Do not modify.
//  source: sample.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use sampleTypeDescriptor instead')
const SampleType$json = {
  '1': 'SampleType',
  '2': [
    {'1': 'NORMAL', '2': 0},
    {'1': 'SPECIAL', '2': 1},
  ],
};

/// Descriptor for `SampleType`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List sampleTypeDescriptor = $convert.base64Decode(
    'CgpTYW1wbGVUeXBlEgoKBk5PUk1BTBAAEgsKB1NQRUNJQUwQAQ==');

@$core.Deprecated('Use sampleDescriptor instead')
const Sample$json = {
  '1': 'Sample',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 5, '10': 'id'},
    {'1': 'name', '3': 2, '4': 1, '5': 9, '10': 'name'},
    {'1': 'type', '3': 3, '4': 1, '5': 14, '6': '.sample.SampleType', '10': 'type'},
    {'1': 'child', '3': 4, '4': 1, '5': 11, '6': '.sample.ChildSample', '10': 'child'},
    {'1': 'updatedAt', '3': 5, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'updatedAt'},
    {'1': 'tags', '3': 6, '4': 3, '5': 9, '10': 'tags'},
  ],
};

/// Descriptor for `Sample`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List sampleDescriptor = $convert.base64Decode(
    'CgZTYW1wbGUSDgoCaWQYASABKAVSAmlkEhIKBG5hbWUYAiABKAlSBG5hbWUSJgoEdHlwZRgDIA'
    'EoDjISLnNhbXBsZS5TYW1wbGVUeXBlUgR0eXBlEikKBWNoaWxkGAQgASgLMhMuc2FtcGxlLkNo'
    'aWxkU2FtcGxlUgVjaGlsZBI4Cgl1cGRhdGVkQXQYBSABKAsyGi5nb29nbGUucHJvdG9idWYuVG'
    'ltZXN0YW1wUgl1cGRhdGVkQXQSEgoEdGFncxgGIAMoCVIEdGFncw==');

@$core.Deprecated('Use childSampleDescriptor instead')
const ChildSample$json = {
  '1': 'ChildSample',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    {'1': 'childName', '3': 2, '4': 1, '5': 9, '10': 'childName'},
  ],
};

/// Descriptor for `ChildSample`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List childSampleDescriptor = $convert.base64Decode(
    'CgtDaGlsZFNhbXBsZRIOCgJpZBgBIAEoCVICaWQSHAoJY2hpbGROYW1lGAIgASgJUgljaGlsZE'
    '5hbWU=');

@$core.Deprecated('Use getSampleRequestDescriptor instead')
const GetSampleRequest$json = {
  '1': 'GetSampleRequest',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
  ],
};

/// Descriptor for `GetSampleRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getSampleRequestDescriptor = $convert.base64Decode(
    'ChBHZXRTYW1wbGVSZXF1ZXN0Eg4KAmlkGAEgASgJUgJpZA==');

