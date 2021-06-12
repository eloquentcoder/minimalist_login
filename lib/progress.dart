import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';

import 'constant.dart';

class ProgressIndication extends StatelessWidget {
  const ProgressIndication({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Container(
            height: 40,
            child: LoadingIndicator(
              indicatorType: Indicator.squareSpin,
              color: primaryColor,
            ),
          ),
        ),
      ),
    );
  }
}
