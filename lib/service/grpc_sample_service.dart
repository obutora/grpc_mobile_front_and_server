import 'package:grpc/grpc.dart';
import 'package:grpc_mobile_server/provider/grpc_channel_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../grpc_gen/sample.pbgrpc.dart';

class GrpcSampleService {
  static final options = CallOptions(metadata: {
    'authorization': 'Bearer token-hogehogefugafuga',
  });

  static Future<Sample> getSample(ClientChannel channel, String id) async {
    final client = SampleServiceClient(channel);
    final res = await client.getSample(
      // セッターを使ってidをセット
      // 以前のバージョンでは、名前付きの引数として渡せたが、
      // リリース時のバイナリサイズが増加するため削除された（21.0.0）
      // https://pub.dev/packages/protoc_plugin/changelog
      GetSampleRequest()..id = id,
      options: options,
    );

    return res;
  }

  static Stream<StreamResult> getStreamingSample(ClientChannel channel) {
    final client = SampleServiceClient(channel);
    final request = GetSampleRequest()..id = 'id';

    return client.getStreamingSample(
      request,
      options: options,
    );
  }
}

final streamProvider = StreamProvider.autoDispose((ref) {
  final channel = ref.watch(grpcChannelProvider);

  return GrpcSampleService.getStreamingSample(channel);
});
