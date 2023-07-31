//
//  Generated code. Do not modify.
//  source: proto/sample.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:async' as $async;
import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'package:protobuf/protobuf.dart' as $pb;

import 'sample.pb.dart' as $0;

export 'sample.pb.dart';

@$pb.GrpcServiceName('sample.SampleService')
class SampleServiceClient extends $grpc.Client {
  static final _$getSample = $grpc.ClientMethod<$0.GetSampleRequest, $0.Sample>(
      '/sample.SampleService/GetSample',
      ($0.GetSampleRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.Sample.fromBuffer(value));

  SampleServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options,
        interceptors: interceptors);

  $grpc.ResponseFuture<$0.Sample> getSample($0.GetSampleRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getSample, request, options: options);
  }
}

@$pb.GrpcServiceName('sample.SampleService')
abstract class SampleServiceBase extends $grpc.Service {
  $core.String get $name => 'sample.SampleService';

  SampleServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.GetSampleRequest, $0.Sample>(
        'GetSample',
        getSample_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.GetSampleRequest.fromBuffer(value),
        ($0.Sample value) => value.writeToBuffer()));
  }

  $async.Future<$0.Sample> getSample_Pre($grpc.ServiceCall call, $async.Future<$0.GetSampleRequest> request) async {
    return getSample(call, await request);
  }

  $async.Future<$0.Sample> getSample($grpc.ServiceCall call, $0.GetSampleRequest request);
}
