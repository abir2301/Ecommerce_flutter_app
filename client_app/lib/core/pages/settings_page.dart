import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:e_commerce_example_flutter/core/constants/theme/colors.dart';
import 'package:e_commerce_example_flutter/features/auth/presentation/view/widgets/profile_widget.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('About App'),
                        content: Text(
                            'Terfer is an e-commerce market that aims to offer users an easy way to shop with a friendly interface !!!!!'),
                        actions: <Widget>[
                          TextButton(
                            child: Text('Close'),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      );
                    });
              },
              icon: Icon(Icons.help))
        ],
        //automaticallyImplyLeading: false,
        title: const Text(
          'settings',
          style: TextStyle(color: Colors.black),
        ).tr(),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          // width: 500,
          padding: const EdgeInsets.fromLTRB(50, 10, 50, 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const ProfileWidget(),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('language'.tr(),
                            style: TextStyle(fontSize: 17.sp)),
                        DropdownButton<String>(
                          value: context.locale.languageCode,
                          icon: const Icon(Icons.arrow_drop_down,
                              color: CColors.orange),
                          iconSize: 24,
                          elevation: 16,
                          style:
                              TextStyle(color: Colors.black, fontSize: 18.sp),
                          underline: Container(
                            height: 2,
                            color: CColors.orange,
                          ),
                          onChanged: (data) {
                            if (data != null) {
                              context.setLocale(Locale(data));
                            }
                          },
                          items: const [
                            DropdownMenuItem<String>(
                              value: 'en',
                              child: Text('English'),
                            ),
                            DropdownMenuItem<String>(
                              value: 'ar',
                              child: Text('Arabic'),
                            )
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                   // const Text('about').tr(),
                    const SizedBox(
                      height: 50,
                    ),
                    // const Text(
                    //   textAlign: TextAlign.justify,
                    //   "Terfer is an e-commerce market that aims to offer users an easy way to shop with a friendly interface .",
                    //   style: TextStyle(
                    //     fontSize: 16.0,
                    //     color: Colors.black87,
                    //   ),
                    // )
                  ],
                ),
              ),
              Container(
                child: const Row(
                  //mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Icon(
                      Icons.email,
                    ),
                    SizedBox(width: 8.0),
                    Text('info@terfer.com'),
                    SizedBox(width: 16.0),
                    Icon(Icons.phone),
                    SizedBox(width: 8.0),
                    Text('+216 50 8.'),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
