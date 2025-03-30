import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/publish_controller.dart';

class PublishView extends GetView<PublishController> {
  const PublishView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PublishView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'PublishView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
