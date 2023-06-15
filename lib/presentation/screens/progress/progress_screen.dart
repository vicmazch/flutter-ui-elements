import 'package:flutter/material.dart';

class ProgressScreen extends StatelessWidget {
  static const name = 'progress_screen';

  const ProgressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Progress'),
      ),
      body: const _ProgressView()
    );
  }
}

class _ProgressView extends StatelessWidget {
  const _ProgressView(
    // {super.key,}
  );

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        children: [
          SizedBox( height: 30,),
          Text('Circular progress indicator'),
          SizedBox( height: 10,),
          CircularProgressIndicator(strokeWidth: 2, backgroundColor: Colors.black45,),
          SizedBox( height: 20,),
          Text('Circular & Linear progress indicator controlado'),
          SizedBox( height: 10,),
          _ControlledProgressIndicator()
        ],
      ),
    );
  }
}

class _ControlledProgressIndicator extends StatelessWidget {
  const _ControlledProgressIndicator(
    // { super.key, }
  );

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Stream.periodic(const Duration(milliseconds: 300), (value) {
        debugPrint('::::: Stream value: $value');
        return (value * 2) / 100;
      }).takeWhile((value) => value <= 1) ,
      builder: (context, snapshot) {
        debugPrint('::::: snapshot: ${snapshot.data}');
        final progressValue = snapshot.data ?? 0.0;
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator( value: progressValue, strokeWidth: 4, backgroundColor: Colors.black12,),
              const SizedBox( width: 20,),
              Expanded( child: LinearProgressIndicator(value: progressValue,))
            ],
          ),
        );
      },
    );
  }
}