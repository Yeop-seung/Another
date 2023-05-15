import 'package:another/constant/const/color.dart';
import 'package:another/watch/screen/widget/carousel_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:another/watch/screen/widget/watch_record_result_box.dart';

class WatchRunningRecord extends StatefulWidget {
  const WatchRunningRecord({
    super.key,
  });

  @override
  State<WatchRunningRecord> createState() => _WatchRunningRecordState();
}

class _WatchRunningRecordState extends State<WatchRunningRecord> {
  final PageController _pageController = PageController(
    initialPage: 0,
  );
  bool isStart = false;
  int currentPageIndex = 0;
  int pageViewCount = 2;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 30.0,
        centerTitle: true,
        elevation: 0,
        title: CustomCarouselIndicator(
          count: pageViewCount,
          currentIndex: currentPageIndex,
        ),
        backgroundColor: BACKGROUND_COLOR,
      ),
      body: PageView(
        reverse: true,
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: RecordResultBox(),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                isStart
                    ? Container(
                        height: 45.0,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: MAIN_COLOR,
                            fixedSize: Size(120.0, 30.0),
                          ),
                          onPressed: onPressed,
                          child: const Text(
                            '러닝 시작',
                            style: TextStyle(
                              fontSize: 22.0,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      )
                    : Container(
                      height: 45.0,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: MAIN_COLOR,
                            fixedSize: Size(
                              120.0,
                              30.0,
                            ),
                          ),
                          onPressed: onPressed,
                          child: const Text(
                            '일시 정지',
                            style: TextStyle(
                              fontSize: 22.0,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                    ),
                SizedBox(
                  height: 16.0,
                ),
                Container(
                  height: 45.0,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: MAIN_COLOR,
                      fixedSize: Size(
                        120.0,
                        30.0,
                      ),
                    ),
                    onPressed: onPressed,
                    child: const Text(
                      '러닝 종료',
                      style: TextStyle(
                        fontSize: 22.0,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 16.0,
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  void onPressed() {
    setState(() {
      isStart = !isStart;
    });
  }
}