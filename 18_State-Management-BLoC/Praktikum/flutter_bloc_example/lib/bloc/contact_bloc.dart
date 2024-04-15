import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc_example/models/contact_model.dart';

part 'contact_event.dart';
part 'contact_state.dart';

class ContactBloc extends Bloc<ContactEvent, ContactState> {
  ContactBloc() : super(const ContactState()) {
    on<GetContacts>((event, emit) {
      // Kita akan menyimpan 2 data kontak default
      emit(const ContactState(
        contacts: [
          ContactModel(name: 'Mas Suryadi', phone: '08123456789'),
          ContactModel(name: 'Mas Dimas', phone: '08123456788'),
          ContactModel(name: 'Mas Hashbi', phone: '08123456787'),
        ],
      ));
    });

    on<AddContact>((event, emit) {
      // [Data 1, Data 2, Data 3].add(Data 4) -> [Data 1, Data 2, Data 3, Data 4]
      final List<ContactModel> newContacts = List.from(state.contacts)..add(event.contact);
      emit(state.copyWith(contacts: newContacts));
    });

    on<DeleteContact>((event, emit) {
      // [Data 1, Data 2, Data 3, Data 4].remove(Data 3) -> [Data 1, Data 2, Data 4]
      final List<ContactModel> newContacts = List.from(state.contacts)..remove(event.contact);
      emit(state.copyWith(contacts: newContacts));
    });
  }
}
