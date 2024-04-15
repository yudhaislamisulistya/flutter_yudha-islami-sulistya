part of 'contact_bloc.dart';

class ContactState extends Equatable {
  final List<ContactModel> contacts;
  const ContactState({this.contacts = const <ContactModel>[]});

  @override
  List<Object> get props => [contacts];

  // Digunakan untuk membuat instance baru dari ContactState dengan nilai contacts yang berbeda
  ContactState copyWith({List<ContactModel>? contacts}) {
    return ContactState(contacts: contacts ?? this.contacts);
  }
}
