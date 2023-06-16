
import 'package:flutter/material.dart';

Widget emptyWidget() {
  return const SizedBox.shrink();
}

Widget buildLoadingIndicator(bool isLoading) {
  if (isLoading) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  } else {
    return emptyWidget();
  }
}
