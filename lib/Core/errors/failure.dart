import 'package:dio/dio.dart';
abstract class Failure {
  final String error;

  Failure({required this.error});
}
class ServerFailure extends Failure{
  ServerFailure({required super.error});
  factory ServerFailure.fromDioError(DioException e){
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
      return  ServerFailure(error: 'connectionTimeout with api services');
        
      case DioExceptionType.sendTimeout:
     return ServerFailure(error: 'sendTimeout with api services');
        
      case DioExceptionType.receiveTimeout:
      return   ServerFailure(error: 'receiveTimeout with api services');
        
      case DioExceptionType.badCertificate:
     return   ServerFailure(error: 'badCertificate with api services');
        
      case DioExceptionType.badResponse:
    return    ServerFailure.froResponse(e.response!.statusCode!, e.response!.data);
        
      case DioExceptionType.cancel:
      return  ServerFailure(error: 'Connection is canceled');
        
      case DioExceptionType.connectionError:
     return   ServerFailure(error: 'No Internet Connection');
        
      case DioExceptionType.unknown:
      return  ServerFailure(error: 'Oops, There was error,please try again');
        
    } 
  }
  factory ServerFailure.froResponse( int statuscode, dynamic response){
    if(statuscode==404){
      return ServerFailure(error: 'Your request not found,please try later');
    }
    else if(statuscode==500){
      return ServerFailure(error: 'There is problem eith server,please try later');
    }
    else if( statuscode==400|| statuscode==401|| statuscode==403){
      return ServerFailure(error: response['error']['message']);
    }
    return ServerFailure(error: 'There was n error, please try again');
  }
}
class CashFailure  extends Failure{
  CashFailure({required super.error});
}
class NetworkFailure  extends Failure{
  NetworkFailure({required super.error});
}
