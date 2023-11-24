import 'package:d_chart/commons/data_model.dart';
import 'package:d_chart/ordinal/bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:nawa/View/themes/colors.dart';

import '../widgets/globalwidgets.dart';
import 'functions/walalet_operations.dart';
final walletCtrl = Get.put(WalletCtrl());


class DashboardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
        centerTitle: true,
        backgroundColor: AppColors.blackColor,
      ),
      backgroundColor: Colors.black45,
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          AspectRatio(
            aspectRatio: 16 / 11,
            child: DChartBarO(
              groupList: [
                OrdinalGroup(
                  color: Color(0xFFFF5959),
                  id: '1',
                  data: [
                    OrdinalData(domain: 'Aug', measure: 2),
                    OrdinalData(domain: 'Sept', measure: 6),
                    OrdinalData(domain: 'Oct', measure: 3),
                    OrdinalData(domain: 'Nov', measure: 7),
                    OrdinalData(domain: 'Dec', measure: 7),
                    OrdinalData(domain: 'Jan', measure: 7),
                  ],
                ),
                OrdinalGroup(
                  color: Color(0xFF5976FF),
                  id: '2',
                  data: [
                    OrdinalData(domain: 'Aug', measure: 8),
                    OrdinalData(domain: 'Sept', measure: 4),
                    OrdinalData(domain: 'Oct', measure: 9),
                    OrdinalData(domain: 'Nov', measure: 3),
                    OrdinalData(domain: 'Dec', measure: 4),
                    OrdinalData(domain: 'Jan', measure: 1),
                  ],
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(
                Icons.circle,
                size: 20,
                color: AppColors.primaryColor,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                "Income",
                style: TextStyle(color: AppColors.whiteColor),
              ),
              SizedBox(
                width: 20,
              ),
              Icon(
                Icons.circle,
                size: 20,
                color: Color(0xFFFF5959),
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                "Expenses",
                style: TextStyle(color: AppColors.whiteColor),
              )
            ],
          ),
          SizedBox(
            height: 20,
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: SizedBox(
                  height: 90,
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          15.0), // Adjust the radius as needed
                    ),
                    elevation: 3,
                    color: AppColors.blackTextColor,
                    child: Column(
                      children: [
                        ListTile(
                          leading: Icon(Icons.circle_outlined,
                              color: AppColors.primaryColor, size: 22),
                          trailing: const Icon(
                            Icons.keyboard_arrow_down_outlined,
                            color: Colors.white,
                            size: 22,
                          ),
                          title: Text(
                            "Income",
                            style: const TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.normal,
                              fontFamily: 'Nunito',
                            ),
                          ),
                          tileColor: Colors.transparent,
                          textColor: Colors.white,
                          selectedTileColor: AppColors.primaryColor,
                        ),
                        Text(
                          "80,200",
                          style: TextStyle(
                              color: AppColors.whiteColor,
                              fontWeight: FontWeight.w600),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: SizedBox(
                  height: 90,
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          15.0), // Adjust the radius as needed
                    ),
                    elevation: 3,
                    color: AppColors.blackTextColor,
                    child: Column(
                      children: [
                        ListTile(
                          leading: Icon(Icons.circle_outlined,
                              color: Color(0xFFFF5959), size: 22),
                          trailing: const Icon(
                            Icons.keyboard_arrow_down_outlined,
                            color: Colors.white,
                            size: 22,
                          ),
                          title: Text(
                            "Expenses",
                            style: const TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.normal,
                              fontFamily: 'Nunito',
                            ),
                          ),
                          tileColor: Colors.transparent,
                          textColor: Colors.white,
                          selectedTileColor: AppColors.primaryColor,
                        ),
                        Text(
                          "80,200",
                          style: TextStyle(
                              color: AppColors.whiteColor,
                              fontWeight: FontWeight.w600),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            " Total Balance",
            style: TextStyle(
                color: AppColors.whiteColor, fontWeight: FontWeight.w800),
          ),

          Card(
            shape: RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.circular(15.0), // Adjust the radius as needed
            ),
            elevation: 3,
            color: AppColors.blackTextColor,
            child: Column(
              children: [
                SizedBox(height: 10,),
                ListTile(
                  leading: Expanded(
                    child: Text(
                      "80,200",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w800),
                    ),
                  ),
                  trailing: ElevatedButton(
                    onPressed: (){
                      walletCtrl.depositDialog(context);

                    },
                    child: Text(
                      "Deposit",
                      style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
                    ),
                  ),
                  tileColor: Colors.transparent,
                  textColor: Colors.white,
                  selectedTileColor: AppColors.primaryColor,
                ),
                SizedBox(height: 10,),
              ],
            ),
          ),

          Card(
            shape: RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.circular(15.0), // Adjust the radius as needed
            ),
            elevation: 3,
            color: AppColors.primaryColor,
            child: Column(
              children: [
                ListTile(
                  leading: Icon(Icons.timelapse,
                      color: AppColors.whiteColor, size: 22),
                  trailing: const Icon(
                    Icons.arrow_forward_ios_outlined,
                    color: Colors.white,
                    size: 22,
                  ),
                  title: Text(
                    "Your avarage income has \n decreased from last years",
                    style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.normal,
                      fontFamily: 'Nunito',
                    ),
                  ),
                  tileColor: Colors.transparent,
                  textColor: Colors.white,
                  selectedTileColor: AppColors.primaryColor,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
