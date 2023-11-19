import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:synapsis_challange/constant/color.dart';

class ListSurvey extends StatelessWidget {
  final String? surveyName;
  final String? createdDate;
  final VoidCallback? callBack;
  const ListSurvey(
      {super.key, this.surveyName, this.createdDate, this.callBack});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return InkWell(
      onTap: callBack,
      child: Container(
          width: size.width * .9,
          height: 70,
          decoration: BoxDecoration(
              border: Border.all(color: grey),
              borderRadius: BorderRadius.circular(4)),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Row(
              children: [
                SvgPicture.asset(
                  "assets/img/svg/examp.svg",
                  height: 35,
                  width: 35,
                ),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "$surveyName",
                      style: const TextStyle(
                          color: black,
                          fontSize: 14,
                          fontWeight: FontWeight.w500),
                    ),
                    Text(
                      "Created At: $createdDate",
                      style: const TextStyle(
                          color: green,
                          fontSize: 12,
                          fontWeight: FontWeight.w500),
                    )
                  ],
                )
              ],
            ),
          )),
    );
  }
}
