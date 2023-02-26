import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nectar/home_page.dart';


class StartedPage extends StatelessWidget {
  const StartedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        fit: StackFit.expand,
        children: [
          Image.asset(
            'assets/images/welcome_image.png',
            fit: BoxFit.cover,
          ),
          Positioned(
            bottom: 30,
            child: Center(
                child: Column(
                  children: [
                    SvgPicture.asset('assets/icons/app_icon.svg'),
                    const SizedBox(height: 20,),
                    const Text(
                        'Welcome',
                        style: TextStyle(
                          fontSize: 60,
                          color: Colors.white,
                          fontFamily: 'Gilroy'
                        )
                    ),
                    const SizedBox(height: 5,),
                    const Text(
                        'to our store',
                        style: TextStyle(
                            fontSize: 60,
                            color: Colors.white,
                            fontFamily: 'Gilroy'
                        )
                    ),
                    const SizedBox(height: 5,),
                    const Text(
                        'Get your groceries as fast as in hour',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white54,
                        )
                    ),
                    const SizedBox(height: 50,),
                    SizedBox(
                      width: 350,
                      height: 60,
                      child: ElevatedButton(
                          autofocus: true,
                          onPressed: (){
                            Navigator.of(context)
                                .pushReplacement(MaterialPageRoute(builder: (context) => const HomePage()));
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Colors.green[400],
                            textStyle: const TextStyle(
                              fontSize: 25,
                            ),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15)), // <-- Radius
                          ),
                          child: const Text('Get Started')
                      ),
                    )

                  ],
            ))
          ),
        ],
      ),
    );
  }
}
