import 'package:dio/dio.dart';
import 'package:flutter_application_1/Core/utils/api_services.dart';
import 'package:flutter_application_1/Features/home/data/data_sources/home_local_datasource.dart';
import 'package:flutter_application_1/Features/home/data/data_sources/home_remote_datasource.dart';
import 'package:flutter_application_1/Features/home/data/repos/home_repo_implementation.dart';
import 'package:get_it/get_it.dart';

 final GetIt locator=GetIt.instance;
 void setup(){
  locator.registerSingleton<ApiServices>(
    ApiServices(Dio()));
locator.registerSingleton<HomeRpoImplementation>(HomeRpoImplementation(
  homeLocalDataSource: HomeLocalDataSourceImplementation(),
  homeRemoteDataSource: HomeRemoteDataSourceImplementation(
locator.get<ApiServices>()
  )
));
 }
