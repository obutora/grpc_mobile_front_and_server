import 'package:flutter/material.dart';
import 'package:grpc_mobile_server/provider/grpc_channel_provider.dart';
import 'package:grpc_mobile_server/service/grpc_sample_service.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final channel = ref.watch(grpcChannelProvider);

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: ElevatedButton(
            onPressed: () async {
              try {
                final res = await GrpcSampleService.getSample(channel, '3200');
                print(res);

                print('tag length : ${res.tags.length}');

                // print(res.updatedAt);
                // print(DateTime.fromMillisecondsSinceEpoch(
                //     res.updatedAt.seconds.toInt() * 1000));
              } catch (e) {
                print(e);
              }
            },
            child: const Text('test'),
          ),
        ),
      ),
    );
  }
}
