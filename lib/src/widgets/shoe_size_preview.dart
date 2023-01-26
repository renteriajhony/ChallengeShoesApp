import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoes_app/src/models/shoes_model.dart';
import 'package:shoes_app/src/pages/shoes_description_page.dart';

class ShoesSizePreview extends StatelessWidget {
  final bool fullScreen;
  const ShoesSizePreview({super.key, this.fullScreen = false});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        if(!fullScreen){
          Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) { 
            return const ShoesDescriptionPage();
           }));
        }
      },
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: (fullScreen)? 5 : 30, 
          vertical: (fullScreen)? 5 : 0),
        child: Container(
          width: double.infinity,
          height: (fullScreen)?420: 430,
          decoration: BoxDecoration(
              color: const Color(0xFFFFCF53),
              borderRadius: (fullScreen)? const BorderRadius.only(
                bottomLeft: Radius.circular(50),
                bottomRight: Radius.circular(50),
                topLeft: Radius.circular(40),
                topRight: Radius.circular(40)
              )
              :BorderRadius.circular(50)
          ),
          child: Column(
            children: [
              _ShoeWithShadow(fullScreen), 
              if(!fullScreen)
              const _ShoeSizes()
            ],
          ),
        ),
      ),
    );
  }
}

class _ShoeWithShadow extends StatelessWidget {
  final bool fullScreen;
  const _ShoeWithShadow(this.fullScreen);

  @override
  Widget build(BuildContext context) {
    final shoeModel = Provider.of<ShoesModel>(context,listen: true);
    return Padding(
      padding: const EdgeInsets.all(50.0),
      child: Stack(
        children: [
          const Positioned(bottom: 20, right: 0, child: _ShoeShadow()),
          // Image(image: AssetImage(shoeModel.assetImage)),
          BounceInLeft(
            duration: (fullScreen)? const Duration(seconds: 2) : const Duration(milliseconds: 0),
            from: (fullScreen)? 30 : 0,
            child: Image(image: AssetImage(shoeModel.assetImage)))
        ],
      ),
    );
  }
}

class _ShoeShadow extends StatelessWidget {
  const _ShoeShadow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: -0.5,
      child: Container(
        width: 230,
        height: 120,
        decoration: BoxDecoration(
            // color: Colors.red,
            borderRadius: BorderRadius.circular(100),
            boxShadow: const [
              BoxShadow(color: Color(0xFFEAA14E), blurRadius: 40)
            ]),
      ),
    );
  }
}

class _ShoeSizes extends StatelessWidget {
  const _ShoeSizes();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: const [
          _SizeChoeBox(7),
          _SizeChoeBox(7.5),
          _SizeChoeBox(8),
          _SizeChoeBox(8.5),
          _SizeChoeBox(9),
          _SizeChoeBox(9.5),
        ],
      ),
    );
  }
}

class _SizeChoeBox extends StatelessWidget {
  final double numero;
  const _SizeChoeBox(this.numero);

  @override
  Widget build(BuildContext context) {
    final shoeModel = Provider.of<ShoesModel>(context,listen: true);
    return GestureDetector(
      onTap: (){
        shoeModel.sizeShoe = numero;
      },
      child: Container(
        alignment: Alignment.center,
        width: 45,
        height: 45,
        decoration:
            BoxDecoration(
                color:  (numero == shoeModel.sizeShoe) ? const Color(0xFFF1A23A): Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  if (numero == shoeModel.sizeShoe)
                  const BoxShadow(
                  color: Color(0xFFF1A23A),
                  blurRadius: 10,
                  offset: Offset(0, 5)
                )] 
              ),
        child: Text(
          numero.toString().replaceAll('.0', ''),
          style: TextStyle(
              color: (numero == shoeModel.sizeShoe) ? Colors.white : const Color(0xFFF1A23A),
              fontSize: 16,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
