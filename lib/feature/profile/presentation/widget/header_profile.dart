import 'package:flutter/material.dart';
import 'package:movieapp/core/color_constant.dart';

class HeaderProfile extends StatelessWidget {
  const HeaderProfile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          padding: const EdgeInsets.only(bottom: 20),
          height: 120,
          decoration: const BoxDecoration(
            color: ashBlue,
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(25)),
          ),
        ),
        const Positioned(
          bottom: -40,
          left: 30,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 80,
                backgroundColor: primary,
                child: CircleAvatar(
                  radius: 73,
                  backgroundImage: AssetImage("assets/profile/person.jpg"),
                ),
              ),
              SizedBox(
                width: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Username',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'username@gmail.com',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
