import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/root_controller.dart';

class RootView extends GetView<RootController> {
  const RootView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('RootView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'RootView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
