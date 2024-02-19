import 'package:ecom_ostad/pressentation/ui/utils/images_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class CompleteProfileScreen extends StatefulWidget {
  const CompleteProfileScreen({super.key});

  @override
  State<CompleteProfileScreen> createState() => _CompleteProfileScreenState();
}

class _CompleteProfileScreenState extends State<CompleteProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                const SizedBox(height: 32,),
                Center(child: SvgPicture.asset(ImageAssets.craftyBayLogoSvg,width: 100,)),
                const SizedBox(height: 16,),
                Text('Complete Profile',style: Theme.of(context).textTheme.titleLarge,),
                const SizedBox(height: 4,),
                Text('Get Started with us with your details',style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.grey),),
                const SizedBox(height: 16,),
                TextFormField(
                  decoration: const InputDecoration(
                    hintText: 'First Name'
                  ),
                ),
                const SizedBox(height: 16,),
                TextFormField(
                  decoration:const InputDecoration(
                      hintText: 'Last Name'
                  ),
                ),
                const SizedBox(height: 16,),
                TextFormField(
                  decoration: const InputDecoration(
                      hintText: 'Mobile'
                  ),
                ),
                const SizedBox(height: 16,),
                TextFormField(
                  decoration: const InputDecoration(
                      hintText: 'City'
                  ),
                ),
                const SizedBox(height: 16,),
                TextFormField(
                  maxLines: 4,
                  decoration: const InputDecoration(
                      hintText: 'Shipping Address',
                    contentPadding: EdgeInsets.symmetric(horizontal: 16,vertical: 16),
                  ),
                ),
                const SizedBox(height: 16,),
                SizedBox(
                  width: double.infinity,
                    child: ElevatedButton(onPressed: (){}, child: const Text('Complete'),)),


              ],
            ),
          ),
        ),
      ),
    );
  }
}
