import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_contract_users/domain/models/contract_model.dart';

class CustomWidget {
  static AppBar showAppbar(
          {required String title,
          required bool showIcon,
          required void Function()? onPressed}) =>
      AppBar(
        backgroundColor: Colors.black,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.light,
          statusBarBrightness: Brightness.light,
        ),
        centerTitle: true,
        title: Text(
          title,
          style: const TextStyle(color: Colors.white),
        ),
        leading: showIcon
            ? IconButton(
                onPressed: onPressed,
                icon: const Icon(
                  Icons.arrow_back_ios,
                  color: Colors.white,
                ),
              )
            : null,
      );

  static Widget showImageFromUrl(
          {required String imageUrl,
          required double width,
          required double height}) =>
      ClipOval(
        child: Image.network(
          imageUrl,
          width: width,
          height: height,
          fit: BoxFit.cover,
          loadingBuilder: (context, child, loadingProgress) {
            if (loadingProgress == null) return child;

            return Container(
              width: width,
              height: height,
              color: Colors.grey,
              child: const Center(
                child: CircularProgressIndicator(),
              ),
            );
          },
          errorBuilder: (context, object, stack) {
            return Container(
              width: width,
              height: height,
              color: Colors.grey,
              child: const Center(
                child: Text('No picture'),
              ),
            );
          },
        ),
      );

  static Widget showNormalText(String title) => Padding(
        padding: const EdgeInsets.only(left: 10, bottom: 5),
        child: Text(
          title,
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
        ),
      );

  static Widget showNormalTextCard(String title) => Padding(
        padding: const EdgeInsets.only(bottom: 5),
        child: Text(
          title,
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      );

  static Widget showCardContract(
          {required Contract contract, required void Function()? onTap}) =>
      InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            children: [
              showImageFromUrl(
                  imageUrl: contract.picture.medium, width: 60, height: 60),
              const SizedBox(
                width: 12,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 5),
                    child: Text(
                      '${contract.name.first} ${contract.name.last}',
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                  ),
                  showNormalTextCard('${contract.phone} '),
                  showNormalTextCard('${contract.email} '),
                ],
              ),
            ],
          ),
        ),
      );
}
