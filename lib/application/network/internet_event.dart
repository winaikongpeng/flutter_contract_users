part of 'internet_bloc.dart';

abstract class InternetEvent {}

class OnConnected extends InternetEvent {}

class OnNotConnected extends InternetEvent {}
