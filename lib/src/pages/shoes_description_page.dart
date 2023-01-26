import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoes_app/src/helpers/helpers.dart';
import 'package:shoes_app/src/models/shoes_model.dart';
import 'package:shoes_app/src/widgets/custom_widgets.dart';

class ShoesDescriptionPage extends StatelessWidget {
  const ShoesDescriptionPage({super.key});

  @override
  Widget build(BuildContext context) {
    changeStatusBarLight();
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              const Hero(
                tag: 'zapato-1',
                child: ShoesSizePreview(fullScreen: true)),
              Positioned(
                top: 80,
                left: 25,
                child: FloatingActionButton(
                  onPressed: () { 
                    changeStatusBarDark();
                    Navigator.pop(context);
                   },
                  elevation: 0,
                  highlightElevation: 0,
                  backgroundColor: Colors.transparent,
                  splashColor: Colors.transparent,
                  child: const Icon(Icons.arrow_back_ios, color: Colors.white,size: 50,))
              )
            ],
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: const [
                  ShoeDescription(
                      title: 'Nike Air Max 720',
                      description:
                          "The Nike Air Max 720 goes bigger than ever before with Nike's taller Air unit yet, offering more air underfoot for unimaginable, all-day comfort. Has Air Max gone too far? We hope so. "),
                  _AmountBuyNow(),
                  _ColorsAndMore(),
                  _ButtonLikeCardSettings()
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class _ButtonLikeCardSettings extends StatelessWidget {
  const _ButtonLikeCardSettings();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 60),
      padding: const EdgeInsets.symmetric(horizontal: 30),
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const _ShadedButton(Icon(Icons.heart_broken, color: Colors.red,size: 25,)),
          _ShadedButton(Icon(Icons.add_shopping_cart, color: Colors.grey.withOpacity(0.4),size: 25,)),
          _ShadedButton(Icon(Icons.settings, color: Colors.grey.withOpacity(0.4),size: 25,)),
        ],
      ),
    );
  }
}

class _ShadedButton extends StatelessWidget {
  final Icon icon;
  const _ShadedButton(this.icon);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 55,
      height: 55,
      decoration: const BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(color: Colors.black12,spreadRadius: -5, blurRadius: 20, offset: Offset(0, 10) )
        ]
      ),
      child: icon,
    );
  }
}

class _ColorsAndMore extends StatelessWidget {
  const _ColorsAndMore({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
  
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        children: [
          Expanded(
            child: Stack(
              children: const [
                Positioned(left: 90, child: _ColorButton(color: Color(0xFFd1e037),index:4, assetImage: 'verde')),
                Positioned(left: 60, child: _ColorButton(color: Color(0xFFfbb600),index:3, assetImage: 'amarillo')),
                Positioned(left: 30, child: _ColorButton(color: Color(0xFF4aa5ff),index:2, assetImage: 'azul')),
                _ColorButton(color: Color(0xFF415661), index:1, assetImage: 'negro',),
              ],
            ),
          ),
          const OrangeButton(text: 'More related items',width: 170, height: 30, color: Color(0xffffcc7b))
        ],
      ),
    );
  }
}

class _ColorButton extends StatelessWidget {
  final Color color;
  final int index;
  final String assetImage;
  const _ColorButton({
    Key? key, required this.color,required this.index, required this.assetImage
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return FadeInLeft(
        delay: Duration(milliseconds: index*100),
        duration: const Duration(milliseconds: 300),
        child: GestureDetector(
          onTap: (){
            final shoeModel = Provider.of<ShoesModel>(context,listen: false);
            final image = 'assets/imgs/$assetImage.png';
            shoeModel.assetImage = image;
          },
          child: Container(
            width: 35,
            height: 35,
            decoration: BoxDecoration(
                color: color, 
                shape: BoxShape.circle),
          ),
        ),
    );
  }
}

class _AmountBuyNow extends StatelessWidget {
  const _AmountBuyNow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Container(
        margin: const EdgeInsets.only(top: 20, bottom: 20),
        child: Row(
          children: [
            const Text(
              '\$180.0',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            const Spacer(),
            Bounce(
              delay: const Duration(seconds: 1),
              from: 8,
              child: const OrangeButton(text: 'Buy Now', width: 120.0, height: 40.0)
            ),
          ],
        ),
      ),
    );
  }
}
