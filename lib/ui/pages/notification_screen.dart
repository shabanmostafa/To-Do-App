import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do_app/ui/theme.dart';

class NotificationScreen extends StatefulWidget {
  NotificationScreen({Key? key, required this.payLoad}) : super(key: key);
  final String payLoad;

  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  String _payLoad = '';
  @override
  void initState() {
    super.initState();
    _payLoad = widget.payLoad;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () => Get.back(),
        ),
        elevation: 0,
        backgroundColor: context.theme.primaryColor,
        title: Text(
          _payLoad.toString().split('|')[0],
          style: TextStyle(color: Get.isDarkMode ? Colors.white : Colors.black),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'hello,Shaban',
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: Get.isDarkMode ? Colors.white : darkGreyClr,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              'You have a new remember',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w300,
                color: Get.isDarkMode ? Colors.grey : darkGreyClr,
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                padding: const EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 20,
                ),
                decoration: BoxDecoration(
                  color: primaryClr,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Icon(
                            Icons.text_format,
                            color: Colors.white,
                            size: 30,
                          ),
                          const SizedBox(width: 10),
                          Text(
                            'title',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),

                      Text(
                        _payLoad.toString().split('|')[0],
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Row(
                        children: [
                          const Icon(
                            Icons.calendar_today_outlined,
                            color: Colors.white,
                            size: 30,
                          ),
                          const SizedBox(width: 10),
                          Text(
                            'date',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),

                      Text(
                        _payLoad.toString().split('|')[1],
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Row(
                        children: [
                          const Icon(
                            Icons.description,
                            color: Colors.white,
                            size: 30,
                          ),
                          const SizedBox(width: 10),
                          Text(
                            'description',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),

                      Text(
                        _payLoad.toString().split('|')[2],
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
