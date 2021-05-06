import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nagazap/app/modules/home/home_controller.dart';
import 'package:nagazap/app/modules/home/widgets/appbar_widget.dart';
import 'package:nagazap/app/modules/home/widgets/list_contacts_widget.dart';

class HomePage extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        controller: controller,
      ),
      body: ListContactsWidget(controller: controller),
    );
  }
}
