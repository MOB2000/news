import 'package:flutter/material.dart';
import 'package:news/helpers/strings_helper.dart';
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
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasError) {
            return Center(
                child: Text(StringsHelper.formatException(snapshot.error)));
          }
          return builder(snapshot.data!);
        }

        return const LoadingWidget();
      },
    );
  }
}
