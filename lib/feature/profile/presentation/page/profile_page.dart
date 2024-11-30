import 'package:flutter/material.dart';
import 'package:movieapp/core/color_constant.dart';
import 'package:movieapp/feature/profile/presentation/widget/header_profile.dart';
import 'package:movieapp/feature/profile/presentation/widget/option_profile_widget.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primary,
      appBar: AppBar(
        backgroundColor: ashBlue,
      ),
      body: const Center(
        child: Column(
          children: [
            HeaderProfile(),
            SizedBox(
              height: 50,
            ),
            OptionProfileWidget(),
            Spacer(),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "v1.1.1",
                style: TextStyle(
                    fontWeight: FontWeight.bold, fontSize: 18, color: ashBlue),
              ),
            )
          ],
        ),
      ),
    );
  }
}
