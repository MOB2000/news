import 'package:flutter/material.dart';
import 'package:news/constants/strings.dart';
import 'package:news/constants/styles.dart';
import 'package:news/models/source.dart';
import 'package:news/providers/news_provider.dart';
import 'package:news/widgets/helpers/custom_future_builder.dart';
import 'package:news/widgets/source_widget.dart';
import 'package:provider/provider.dart';

class TopChannels extends StatelessWidget {
  const TopChannels({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<NewsProvider>(context);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        const Padding(
          padding: EdgeInsets.only(bottom: 8),
          child: Text(
            kTopChannels,
            style: kHomeTitleStyle,
          ),
        ),
        Expanded(
          child: CustomFutureBuilder<List<Source>>(
            future: provider.sources,
            builder: (sources) => GridView.builder(
              itemCount: sources.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 0.86,
              ),
              itemBuilder: (context, index) {
                return SourceWidget(source: sources[index]);
              },
            ),
          ),
        ),
      ],
    );
  }
}
