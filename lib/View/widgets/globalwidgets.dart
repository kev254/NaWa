import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../themes/colors.dart';

Widget imageButton({
  required Color txtColour,
  required Color bgColour,
  required bool isLoading,
  required void Function()? function,
  Icon? icon,
  String? label,
}) {
  return Container(
    width: 70, // Set a fixed width to make it circular
    height: 70, // Set the same height as width to make it a perfect circle
    padding: const EdgeInsets.all(
        8), // Add padding for the icon and loading indicator
    alignment: Alignment.center,
    child: ElevatedButton(
      onPressed: isLoading ? null : function,
      style: ElevatedButton.styleFrom(
        shape: CircleBorder(), // Set the button shape to a circle
        primary: bgColour, // Set background color
        padding: EdgeInsets.all(16), // Increase padding for circular shape
      ),
      child: (isLoading)
          ? CircularProgressIndicator(
              color: Colors.white,
              strokeWidth: 1.5,
            )
          : (icon != null)
              ? icon
              : (label != null)
                  ? Text(
                      label,
                      style: TextStyle(
                        color: txtColour,
                        fontFamily: 'Nunito',
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                      ),
                    )
                  : SizedBox.shrink(), // Hide the button if there's no content
    ),
  );
}

Widget smallCardwithImage({
  required Color bgColour,
  required bool isLoading,
  required String imageUrl,
  required BuildContext context,
  required void Function()? function,
  Icon? icon,
  String? label,
}) {
  double myHeight = MediaQuery.of(context).size.height;
  double myWidth = MediaQuery.of(context).size.width;
  return Container(
    padding: EdgeInsets.symmetric(
        horizontal: myWidth * 0.04, vertical: myHeight * 0.02),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15), color: bgColour),
    child: Image.asset(
      imageUrl,
      height: myHeight * 0.05,
      color: Colors.white,
      // color: Color(0xff7847FC),
    ),
  );
}

Widget customAppBar({
  required double myHeight,
  required BuildContext context,
  required double myWidth,
}) {
  return Padding(
    padding: EdgeInsets.only(top: myHeight * 0.04, left: myWidth * 0.08),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        smallCardwithImage(
            bgColour: Colors.transparent,
            isLoading: false,
            imageUrl: "assets/user_icon.png",
            context: context,
            function: () {}),
        Text(
          'Kevin. O',
          style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: AppColors.whiteColor),
        ),
        SizedBox(
          width: 20,
        ),
        imageButton(
            txtColour: AppColors.whiteColor,
            bgColour: Colors.transparent,
            isLoading: false,
            function: () {},
            icon: Icon(Icons.notifications)),
      ],
    ),
  );
}

Widget labelWidget({
  required String text,
  required double myHeight,
  required double myWidth,
}) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: myWidth * 0.03),
    child: Text(
      text,
      style: TextStyle(
          fontSize: 16, color: Colors.white, fontWeight: FontWeight.normal),
    ),
  );
}

Widget homebigCard({
  required double myWidth,
  required double myHeight,
  required BuildContext context,
}) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: myWidth * 0.08),
    child: Container(
      height: myHeight * 0.2,
      // width: myWidth * 0.9,
      decoration: BoxDecoration(
          color: AppColors.primaryColor,
          borderRadius: BorderRadius.circular(10)),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: myWidth * 0.05, vertical: myHeight * 0.015),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                labelWidget(
                    text: "Wallet Balance",
                    myHeight: myHeight,
                    myWidth: myWidth),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: myHeight * 0.02),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: myWidth * 0.05, vertical: myHeight * 0.01),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(children: [
                  Text(
                    'Available Balance',
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.normal),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    '80,200.00',
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ]),
                Column(children: [
                  Text(
                    'Actual Balance',
                    style: TextStyle(
                        fontSize: 16,
                        color: AppColors.whiteColor,
                        fontWeight: FontWeight.normal),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    '80,200.00',
                    style: TextStyle(
                        fontSize: 20,
                        color: AppColors.whiteColor,
                        fontWeight: FontWeight.bold),
                  ),
                ]),
              ],
            ),
          )
        ],
      ),
    ),
  );
}
void showSnackbar({required String title, required String subtitle, path}) {
  Get.snackbar(
    title,
    subtitle,
    backgroundColor: Colors.white,
    colorText: AppColors.primaryColor,
    icon: Icon(path, size: 28, color: AppColors.primaryColor),
    snackPosition: SnackPosition.BOTTOM,
  );
}

Widget customFormField({
  required String label,
  required bool require,
  required TextEditingController controller,
  TextInputType? type,
  Color? txtColor,
  required String? Function(String?) validator,
  required double height,
  required double width,
}) {
  return Padding(
    padding: const EdgeInsets.only(top: 8.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: txtColor ?? Colors.white, // Provide a default color
          ),
        ),
        TextFormField(
          cursorColor: AppColors.primaryColor, // Make sure AppColors is defined
          controller: controller,
          keyboardType: type,
          validator: validator,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: AppColors.primaryColor, // Customize text color as needed
          ),
          decoration: InputDecoration(
            fillColor: Colors.white,
            filled: true,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(4.0)),
            ),
          ),
        ),
      ],
    ),
  );
}
Widget PasswordField ( {
   required String label,
   required TextEditingController controller,
   required String? Function(String?) validator,
   required RxBool isHidden,
}){
    return Obx(
          () => Padding(
        padding: const EdgeInsets.only(top: 15.0, bottom: 15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 5),
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: label,
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                    const TextSpan(
                      text: ' *',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: Colors.red,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 50,
              child: TextFormField(
                cursorColor: AppColors.primaryColor,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                ),
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(4.0)),
                  ),
                  suffix: InkWell(
                    onTap: () {
                      isHidden.toggle();
                    },
                    child: Icon(
                      isHidden.value ? Icons.visibility : Icons.visibility_off,
                      color: AppColors.primaryColor,
                    ),
                  ),
                ),
                obscureText: !isHidden.value,
                controller: controller,
                validator: validator,
              ),
            ),
          ],
        ),
      ),
    );
  }
Widget PrimaryButton (
{
 required String label,
 required Color txtColor,
 required Color bgColor,
 required bool isLoading,
 void Function()? onPressed,
}){

    return Container(
      height: 70,
      padding: const EdgeInsets.symmetric(vertical: 10),
      alignment: Alignment.center,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          minimumSize: const Size(double.infinity, 70),
          backgroundColor: bgColor,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
        ),
        child: (isLoading)
            ? const SizedBox(
          width: 16,
          height: 16,
          child: CircularProgressIndicator(
            color: Colors.white,
            strokeWidth: 1.5,
          ),
        )
            : Text(
          label,
          style: TextStyle(
            color: txtColor,
            fontSize: 15,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
Widget TextSpanWidget({
  required String mainLabel,
  required String childLabel,
  Color? mainLabelColor,
  void Function()? function,
}){

    return Container(
      padding: const EdgeInsets.only(top: 20),
      child: GestureDetector(
        onTap: function,
        child: RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            text: mainLabel,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: mainLabelColor,
            ),
            children: <TextSpan>[
              TextSpan(
                text: childLabel,
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: AppColors.greenColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

Widget OTPField(
{
required TextEditingController controller,
  required BuildContext context,
}){


    return SizedBox(
      height: 50,
      width: 40,
      child: TextFormField(
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        controller: controller,
        maxLength: 1,
        cursorColor: AppColors.primaryColor,
        onChanged: (value) {
          if (value.length == 1) {
            FocusScope.of(context).nextFocus();
          }
        },
        validator: (value) {
          if (value == null || value.isEmpty) {
            return '_';
          }
          return null;
        },
        decoration: const InputDecoration(
          filled: true,
          fillColor: Colors.white,
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
          counterText: '',
        ),
      ),
    );
  }






