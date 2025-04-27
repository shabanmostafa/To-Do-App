import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:to_do_app/ui/size_config.dart';
import 'package:to_do_app/ui/theme.dart';

class NoTasksYet extends StatelessWidget {
  const NoTasksYet({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AnimatedPositioned(
          duration: const Duration(milliseconds: 2000),
          child: SingleChildScrollView(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
                child:
                    SizeConfig.orientation == Orientation.landscape
                        ? Row(
                          key: const ValueKey('landscape'),
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              'images/task.svg',
                              height: 100,
                              color: primaryClr.withOpacity(0.5),
                            ),
                            const SizedBox(width: 10),
                            Text(
                              'You don\'t have any tasks yet,\nadd some tasks and check them off.',
                              style: subTitleStyle,
                              textAlign: TextAlign.center,
                            ),
                          ],
                        )
                        : Column(
                          key: const ValueKey('portrait'),
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const SizedBox(height: 220),
                            SvgPicture.asset(
                              'images/task.svg',
                              height: 100,
                              color: primaryClr.withOpacity(0.5),
                            ),
                            const SizedBox(height: 20),
                            Text(
                              'You don\'t have any tasks yet,\nadd some tasks and check them off.',
                              style: subTitleStyle,
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
