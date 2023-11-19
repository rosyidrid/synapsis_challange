import 'package:flutter/material.dart';
import 'package:synapsis_challange/constant/color.dart';
import 'package:synapsis_challange/ui/pages/question/question_view_model.dart';

class PopUp {
  static questionNumberPopUp(BuildContext context,
      {dynamic data,
      int? isActive,
      VoidCallback? callBack,
      required QuestionViewModel viewModel}) {
    List<int> answered = [];
    if (viewModel.dataCache != null) {
      for (int i = 0; i < data.length; i++) {
        for (int j = 0; j < viewModel.dataCache['answers'].length; j++) {
          if (data[i].id == viewModel.dataCache['answers'][j]['question_id']) {
            answered.add(i + 1);
          }
        }
      }
    }
    Color isAnswered(
        {dynamic dataList,
        Color? condition1,
        Color? condition2,
        Color? condition3}) {
      if (dataList == isActive) {
        return condition1!;
      }

      for (int i = 0; i < answered.length; i++) {
        if (answered[i] == dataList) {
          return condition2!;
        }
      }

      return condition3!;
    }

    showDialog(
        useSafeArea: false,
        context: context,
        builder: (context) {
          Size size = MediaQuery.of(context).size;
          List<int> dataList = List.generate(data.length, (index) => index + 1);

          final PageController pageController = PageController(initialPage: 0);

          return Material(
            color: transparent,
            child: SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                    maxWidth: size.width, maxHeight: size.height * 0.55),
                child: Container(
                  padding: const EdgeInsets.only(
                      top: 50, bottom: 10, left: 18, right: 18),
                  color: white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        alignment: Alignment.centerLeft,
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: const Text(
                          "Survei Question",
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              color: black,
                              fontSize: 15,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                      const Divider(),
                      Expanded(
                        child: PageView.builder(
                          controller: pageController,
                          itemCount: (dataList.length / 20).ceil(),
                          itemBuilder: (BuildContext context, int index) {
                            int startIndex = index * 20;
                            int endIndex = (startIndex + 20 <= dataList.length)
                                ? startIndex + 20
                                : dataList.length;
                            return GridView.builder(
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 5, // 5 items per row
                              ),
                              itemCount: endIndex - startIndex,
                              itemBuilder:
                                  (BuildContext context, int subIndex) {
                                return InkWell(
                                  child: Container(
                                    margin: const EdgeInsets.all(5),
                                    padding: const EdgeInsets.all(5),
                                    decoration: BoxDecoration(
                                        color: isAnswered(
                                            dataList:
                                                dataList[startIndex + subIndex],
                                            condition1: softTosca,
                                            condition2: primary,
                                            condition3: white),
                                        border: Border.all(
                                          color: isAnswered(
                                              dataList: dataList[
                                                  startIndex + subIndex],
                                              condition1: primary,
                                              condition2: white,
                                              condition3: darkGrey),
                                        ),
                                        borderRadius: BorderRadius.circular(4)),
                                    child: Center(
                                      child: Text(
                                        '${dataList[startIndex + subIndex]}',
                                        style: TextStyle(
                                          color: isAnswered(
                                              dataList: dataList[
                                                  startIndex + subIndex],
                                              condition1: primary,
                                              condition2: white,
                                              condition3: darkGrey),
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ),
                                  ),
                                  onTap: () {
                                    Navigator.pop(context);
                                    viewModel.setQuestionWhileTap(
                                        dataList[startIndex + subIndex]);
                                  },
                                );
                              },
                            );
                          },
                          scrollDirection: Axis.horizontal,
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      AnimatedBuilder(
                        animation: pageController,
                        builder: (BuildContext context, Widget? child) {
                          int currentPage = pageController.page?.round() ?? 0;
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: List<Widget>.generate(
                              (dataList.length / 20).ceil(),
                              (int index) {
                                return Container(
                                  width: 8.0,
                                  height: 8.0,
                                  margin: const EdgeInsets.symmetric(
                                      vertical: 10.0, horizontal: 4.0),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: currentPage == index
                                        ? primary
                                        : Colors.grey,
                                  ),
                                );
                              },
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}
//if the data <= 20
// Expanded(
//                           child: GridView.builder(
//                             gridDelegate:
//                                 const SliverGridDelegateWithFixedCrossAxisCount(
//                               crossAxisCount: 5, // 5 items per row
//                             ),
//                             itemCount: dataList.length,
//                             itemBuilder: (BuildContext context, int index) {
//                               return Container(
//                                 margin: const EdgeInsets.all(8.0),
//                                 color: primary,
//                                 child: Center(
//                                   child: Text(
//                                     '${dataList[index]}',
//                                     style: const TextStyle(
//                                       color: white,
//                                       fontSize: 14,
//                                       fontWeight: FontWeight.w400,
//                                     ),
//                                   ),
//                                 ),
//                               );
//                             },
//                           ),
//                         )
//                       : 