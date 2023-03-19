import 'package:flutter/material.dart';
import 'package:flutter_contract_users/application/presentation/widgets/custom_widget.dart';
import 'package:flutter_contract_users/domain/models/contract_model.dart';

class ContractDetailPage extends StatelessWidget {
  const ContractDetailPage({super.key, required this.contract});
  final Contract contract;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomWidget.showAppbar(
          title: 'ข้อมูลผู้ติดต่อ',
          showIcon: true,
          onPressed: () {
            Navigator.pop(context);
          }),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _boxSpace(height: 20),
          Center(
            child: CustomWidget.showImageFromUrl(
                imageUrl: contract.picture.large, width: 100, height: 100),
          ),
          _boxSpace(height: 15),
          Center(
            child: Text(
              '${contract.name.first} ${contract.name.last}',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
          ),
          _boxSpace(height: 40),
          CustomWidget.showNormalText('เบอร์โทรศัพท์:  ${contract.phone}'),
          CustomWidget.showNormalText('อีเมล:  ${contract.email}'),
        ],
      ),
    );
  }

  Widget _boxSpace({required double height}) => SizedBox(height: height);
}
