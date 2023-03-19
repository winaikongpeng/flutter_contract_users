import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_contract_users/application/bloc/contract_bloc.dart';
import 'package:flutter_contract_users/application/network/internet_bloc.dart';
import 'package:flutter_contract_users/domain/repositories/contract_repository.dart';
import 'contract/contract_list_page.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ContractBloc>(
          create: (context) =>
              ContractBloc(ContractRepository())..add(GetContractEvent()),
        ),
        BlocProvider<InternetBloc>(
          create: (context) => InternetBloc(),
        ),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'flutter contract users',
        home: ContractListPage(),
      ),
    );
  }
}
