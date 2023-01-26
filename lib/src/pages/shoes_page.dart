import 'package:flutter/material.dart';
import 'package:shoes_app/src/helpers/helpers.dart';
import 'package:shoes_app/src/widgets/custom_widgets.dart';

class ShoesPage extends StatelessWidget {
  const ShoesPage({super.key});

  @override
  Widget build(BuildContext context) {
    changeStatusBarDark();
    return Scaffold(
      body: Column(
        children: [
          const CustomAppBar(texto: 'For You'),
          const SizedBox(
            height: 20,
          ),
          Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
            child: Column(
              children: const [
                Hero(
                  tag: 'zapato-1',
                  child: ShoesSizePreview(fullScreen: false,)),
                ShoeDescription(
                    title: 'Nike Air Max 720',
                    description:
                        "The Nike Air Max 720 goes bigger than ever before with Nike's taller Air unit yet, offering more air underfoot for unimaginable, all-day comfort. Has Air Max gone too far? We hope so. ")
              ],
            ),
          )),
         const AddCarButton(monto: 180.0)
       ],
      ),
    );
  }
}
