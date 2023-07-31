import 'package:grpc/grpc.dart';
import 'package:grpc_mobile_server/grpc_gen/proto/sample.pbgrpc.dart';

class GrpcSampleService {
  static Future<Sample> getSample(ClientChannel channel, String id) async {
    final client = SampleServiceClient(channel);
    final res = await client.getSample(
      // セッターを使ってidをセット
      // 以前のバージョンでは、引数として渡せたが、
      // リリース時のバイナリサイズが増加するため削除された（21.0.0）
      // https://pub.dev/packages/protoc_plugin/changelog
      GetSampleRequest()..id = id,
      options: CallOptions(metadata: {
        'authorization': 'Bearer token-hogehogefugafuga',
      }),
    );

    return res;
  }
}
