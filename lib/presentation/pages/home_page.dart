import 'package:cep_finder/features/address/data/datasources/address_datasource.dart';
import 'package:cep_finder/features/address/data/repositories/address_repository_impl.dart';
import 'package:cep_finder/features/address/domain/usecases/get_address_info_usecase.dart';
import 'package:cep_finder/presentation/cubit/address_cubit.dart';
import 'package:cep_finder/presentation/widget/custom_button.dart';
import 'package:cep_finder/presentation/widget/custom_cep_input.dart';
import 'package:cep_finder/presentation/widget/custom_cep_result.dart';
import 'package:cep_finder/utils/constants/colors.dart';
import 'package:cep_finder/utils/constants/images.dart';
import 'package:cep_finder/utils/constants/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _cep = '';
  final _cepController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AddressCubit>(
      create: (context) => AddressCubit(
        getAddressInfoUsecase: GetAddressInfoUsecase(
          repository: AddressRepositoryImpl(
            datasource: ApiAddressDataSource(),
          ),
        ),
      ),
      child: Builder(builder: (context) {
        return Scaffold(
            appBar: AppBar(
              backgroundColor: CustomColors.appBarColor,
              title: const Text(
                StringsConstants.appTitle,
              ),
            ),
            body: Center(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 24.0),
                child: Column(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.2,
                      child: Image.asset(
                        AppImages.logo,
                        width: 100,
                        height: 100,
                      ),
                    ),
                    CustomCepInputWidget(
                      onChanged: (value) {
                        setState(() {
                          _cep = value;
                        });
                      },
                      cepController: _cepController,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    CustomButtonWidget(
                      text: StringsConstants.search,
                      onButtonPressed: () {
                        if (_cep.isEmpty) {
                          ScaffoldMessenger.of(context)
                              .showSnackBar(const SnackBar(
                            content: Text(StringsConstants.cepValido),
                          ));
                          return;
                        }
                        context.read<AddressCubit>().getAddress(_cep);
                      },
                    ),
                    const SizedBox(
                      height: 16.0,
                    ),
                    BlocBuilder<AddressCubit, AddressState>(
                        builder: (context, state) {
                      if (state is AddressInitial) {
                        return const Text('');
                      }

                      if (state is AddressLoading) {
                        return const CircularProgressIndicator();
                      }

                      if (state is AddressError) {
                        return const Text(StringsConstants.errorMessage);
                      }

                      state as AddressLoaded;
                      return CustomCepResultWidget(
                        address: state.address,
                        cardTitle: _cep,
                      );
                    }),
                  ],
                ),
              ),
            ));
      }),
    );
  }
}
