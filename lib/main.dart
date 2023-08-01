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
    final stream = ref.watch(streamProvider);

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              ElevatedButton(
                onPressed: () async {
                  try {
                    final res =
                        await GrpcSampleService.getSample(channel, '3200');
                    print(res);

                    print('tag length : ${res.tags.length}');
                  } catch (e) {
                    print(e);
                  }
                },
                child: const Text('test'),
              ),
              ElevatedButton(
                onPressed: () async {
                  // try {
                  //   final stream =
                  //       GrpcSampleService.getStreamingSample(channel);

                  //   stream.listen((event) {
                  //     print(event.value);
                  //   });
                  // } catch (e) {
                  //   print(e);
                  // }
                  // // print(stream.valueOrNull?.value);
                },
                child: const Text('test'),
              ),
              stream.when(
                  error: (_, __) => Text('error'),
                  loading: () => const SizedBox(),
                  // data: (message) => Text(
                  //   message.value.toString(),
                  // ),
                  data: (message) => CircularProgressIndicator(
                        value: message.value.toDouble() / 100,
                      )),
            ],
          ),
        ),
      ),
    );
  }
}
