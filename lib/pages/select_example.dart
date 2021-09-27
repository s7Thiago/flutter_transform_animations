import 'package:flutter/material.dart';
import 'package:transform_example/pages/list/shrink_top_list.dart';
import 'package:transform_example/pages/transform/transform_animations1.dart';
import 'package:transform_example/pages/transform/transform_animations2.dart';


class SelectExample extends StatelessWidget {
  const SelectExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final options = <Map<String, Widget>>[
      {
        'Transform Animations Example 1': const TransformAnimations1(),
      },
      {
        'Transform Animations Example 2': const TransformAnimations2(),
      },
      {
        'Shrink Top List': const ShrinkTopList(),
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Select an example'),
      ),
      body: Scaffold(
        body: ListView.builder(
          shrinkWrap: true,
          itemCount: options.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(options[index].keys.toList()[0]),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => options[index].values.toList()[0],
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
