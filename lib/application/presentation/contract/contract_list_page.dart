import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_contract_users/application/bloc/contract_bloc.dart';
import 'package:flutter_contract_users/application/network/internet_bloc.dart';
import 'package:flutter_contract_users/application/presentation/widgets/custom_widget.dart';
import 'contract_detail_page.dart';

class ContractListPage extends StatelessWidget {
  const ContractListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        context.read<ContractBloc>().add(GetContractEvent());
      },
      child: Scaffold(
        appBar: CustomWidget.showAppbar(
            title: 'รายชื่อผู้ติดต่อ', showIcon: false, onPressed: () {}),
        body: BlocListener<InternetBloc, InternetState>(
          listener: (context, state) {
            if (state is NotConnected) {
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text(state.message)));
            }
          },
          child: BlocConsumer<ContractBloc, ContractState>(
              listener: (context, state) {},
              builder: (context, state) {
                if (state is GetContractSuccess) {
                  return SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: state.listContracts.contracts.length,
                            itemBuilder: (context, index) {
                              return CustomWidget.showCardContract(
                                  contract:
                                      state.listContracts.contracts[index],
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            ContractDetailPage(
                                                contract: state.listContracts
                                                    .contracts[index]),
                                      ),
                                    );
                                  });
                            })
                      ],
                    ),
                  );
                }

                if (state is ContractStateLoading) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (state is ContractStateError) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(state.message),
                        const SizedBox(
                          height: 20,
                        ),
                        ElevatedButton(
                          onPressed: () {
                            context
                                .read<ContractBloc>()
                                .add(GetContractEvent());
                          },
                          child: const Text('Try again.'),
                        )
                      ],
                    ),
                  );
                }

                return const SizedBox();
              }),
        ),
      ),
    );
  }
}
