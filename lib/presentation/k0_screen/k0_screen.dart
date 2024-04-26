import 'package:flutter/material.dart';
import '../../core/app_export.dart';
import 'bloc/k0_bloc.dart';
import 'models/k0_model.dart';

class K0Screen extends StatelessWidget {
  const K0Screen({Key? key})
      : super(
          key: key,
        );

  static Widget builder(BuildContext context) {
    return BlocProvider<K0Bloc>(
      create: (context) => K0Bloc(K0State(
        k0ModelObj: K0Model(),
      ))
        ..add(K0InitialEvent()),
      child: K0Screen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<K0Bloc, K0State>(
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            body: SizedBox(
              width: double.maxFinite,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomImageView(
                        imagePath: ImageConstant.imgExport1,
                        height: 71.v,
                        width: 73.h,
                        margin: EdgeInsets.only(
                          top: 10.v,
                          bottom: 11.v,
                        ),
                      ),
                      CustomImageView(
                        imagePath: ImageConstant.imgExport3,
                        height: 92.v,
                        width: 101.h,
                        margin: EdgeInsets.only(left: 4.h),
                      ),
                      CustomImageView(
                        imagePath: ImageConstant.imgExport2,
                        height: 70.v,
                        width: 79.h,
                        margin: EdgeInsets.only(
                          left: 4.h,
                          top: 10.v,
                          bottom: 11.v,
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 2.v),
                  GestureDetector(
                    onTap: () {
                      onTapTxtSmiley(context);
                    },
                    child: Text(
                      "lbl_smiley".tr,
                      style: theme.textTheme.displayMedium,
                    ),
                  ),
                  SizedBox(height: 5.v)
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  /// Navigates to the k1Screen when the action is triggered.
  onTapTxtSmiley(BuildContext context) {
    NavigatorService.pushNamed(
      AppRoutes.k1Screen,
    );
  }
}
