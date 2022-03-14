import 'package:flutter/material.dart';
import 'package:news/widgets/helpers/loading_widget.dart';

class CustomFutureBuilder<T> extends StatelessWidget {
  final Future<T>? future;
  final Widget Function(T) builder;

  const CustomFutureBuilder({
    Key? key,
    required this.future,
    required this.builder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<T>(
      future: future,
      builder: (context, snapshot) {
        // TODO: check states
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasError) {
            return const Center(child: Text('Error'));
          }
          final data = snapshot.data!;
          return builder(data);
        }

        return const LoadingWidget();
      },
    );
  }
}
