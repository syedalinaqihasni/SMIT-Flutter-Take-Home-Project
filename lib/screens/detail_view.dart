import 'package:flutter/material.dart';
import 'package:takehomeproject/models/nobel_prizess.dart';

class DetailView extends StatelessWidget {
  const DetailView({super.key, required this.nobelPrize});
  final NobelPrize nobelPrize;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            )),
        shadowColor: Colors.transparent,
        backgroundColor: Colors.amber,
        title: const Center(
            child: Text(
          'Nobel Prize Details',
          style: TextStyle(color: Colors.black),
        )),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            //yellow Profile box
            Container(
              height: MediaQuery.of(context).size.height * 0.25,
              width: double.maxFinite,
              color: const Color.fromARGB(255, 251, 216, 111),
              child: Column(
                children: [
                  Icon(
                    Icons.person,
                    size: MediaQuery.of(context).size.height * 0.17,
                  ),
                  Text(
                    nobelPrize.laureates!.first.fullName.toString(),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.height * 0.03,
                      fontWeight: FontWeight.w500,
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),

            // 1st detail
            Container(
              padding: const EdgeInsets.only(bottom: 20),
              alignment: Alignment.centerLeft,
              child: Row(
                children: [
                  const Icon(
                    Icons.calendar_today_rounded,
                    color: Colors.blue,
                  ),
                  const Text(
                    'Award year: ',
                    textAlign: TextAlign.left,
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
                  ),
                  Text(
                    nobelPrize.awardYear.toString(),
                    textAlign: TextAlign.left,
                    style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 13,
                        color: Colors.grey),
                  ),
                ],
              ),
            ),

            // 2nd detail
            Container(
              padding: const EdgeInsets.only(bottom: 20),
              alignment: Alignment.centerLeft,
              child: Row(
                children: [
                  const Icon(
                    Icons.category_sharp,
                    color: Colors.blue,
                  ),
                  const Text(
                    ' Category: ',
                    textAlign: TextAlign.left,
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
                  ),
                  Text(
                    nobelPrize.category.toString(),
                    textAlign: TextAlign.left,
                    style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 13,
                        color: Colors.grey),
                  ),
                ],
              ),
            ),
            // 3rd detail
            Container(
              padding: const EdgeInsets.only(bottom: 20),
              alignment: Alignment.centerLeft,
              child: Row(
                children: [
                  const Icon(
                    Icons.text_fields_sharp,
                    color: Colors.blue,
                  ),
                  const Text(
                    ' Category Full Name: ',
                    textAlign: TextAlign.left,
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
                  ),
                  Container(
                    constraints: BoxConstraints(
                        maxWidth: MediaQuery.of(context).size.width * 0.45),
                    child: Text(
                      nobelPrize.categoryFullName.toString(),
                      textAlign: TextAlign.left,
                      style: const TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 13,
                          color: Colors.grey),
                    ),
                  ),
                ],
              ),
            ),
            // 4th detail
            Container(
              padding: const EdgeInsets.only(bottom: 20),
              alignment: Alignment.centerLeft,
              child: Row(
                children: [
                  const Icon(
                    Icons.calendar_month_rounded,
                    color: Colors.blue,
                  ),
                  const Text(
                    ' Date Awarded:',
                    textAlign: TextAlign.left,
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
                  ),
                  Text(
                    nobelPrize.dateAwarded.toString(),
                    textAlign: TextAlign.left,
                    style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 13,
                        color: Colors.grey),
                  ),
                ],
              ),
            ),
            // 5th detail
            Container(
              padding: const EdgeInsets.only(bottom: 20),
              alignment: Alignment.centerLeft,
              child: Row(
                children: [
                  const Icon(
                    Icons.attach_money_sharp,
                    color: Colors.blue,
                  ),
                  const Text(
                    ' Prize Amount:',
                    textAlign: TextAlign.left,
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
                  ),
                  Text(
                    nobelPrize.prizeAmount.toString(),
                    textAlign: TextAlign.left,
                    style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 13,
                        color: Colors.grey),
                  ),
                ],
              ),
            ),
            // 6th detail
            Container(
              padding: const EdgeInsets.only(bottom: 20),
              alignment: Alignment.centerLeft,
              child: Row(
                children: [
                  const Icon(
                    Icons.attach_money_sharp,
                    color: Colors.blue,
                  ),
                  const Text(
                    ' Prize Amount Adjusted: ',
                    textAlign: TextAlign.left,
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
                  ),
                  Text(
                    nobelPrize.prizeAmountAdjusted.toString(),
                    textAlign: TextAlign.left,
                    style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 13,
                        color: Colors.grey),
                  ),
                ],
              ),
            ),
            // 7th detail
            Container(
              padding: const EdgeInsets.only(bottom: 20),
              alignment: Alignment.centerLeft,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(
                    Icons.message,
                    color: Colors.blue,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        ' Motivation for Award:',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 16),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Container(
                        constraints: BoxConstraints(
                            maxWidth: MediaQuery.of(context).size.width - 100),
                        child: Text(
                          nobelPrize.laureates!.first.motivation.toString(),
                          textAlign: TextAlign.left,
                          style: const TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 13,
                              color: Colors.grey),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
