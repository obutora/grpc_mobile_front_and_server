import 'dart:io';

import 'package:grpc/grpc.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final grpcChannelProvider = Provider.autoDispose<ClientChannel>((ref) {
  // final trustedRoot = File('./cert/client/ca-crt.pem').readAsBytesSync();
  // final credentials = ChannelCredentials.secure(
  //   certificates: trustedRoot,
  //   authority: 'localhost',
  // );

  final channel = ClientChannel(
    'localhost',
    port: 5000,
    options: const ChannelOptions(
      credentials: ChannelCredentials.insecure(), // SSL/TLSを使わない場合
      // credentials: credentials,
    ),
  );

  ref.onDispose(() {
    channel.shutdown();
  });

  return channel;
});
