import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/bookmark_controller.dart';

class BookmarkView extends GetView<BookmarkController> {
  const BookmarkView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF040A0F),
      appBar: AppBar(
        title: const Text('BookmarkView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'BookmarkView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
