import 'package:equatable/equatable.dart';

class ContactModel extends Equatable {
  final String name;
  final String phone;

  const ContactModel({required this.name, required this.phone});

  @override
  List<Object> get props => [name, phone];
}
