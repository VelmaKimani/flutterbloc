part of 'sevadetail_bloc.dart';

abstract class SevadetailEvent extends Equatable {
    @override
  List<Object> get props => [];
  const SevadetailEvent();
}

class nameChanged extends SevadetailEvent {
  final String name;

  const nameChanged({@required this.name});

  @override
  List<Object> get props => [name];

  @override
  String toString() => 'nameChanged { name: $name }';
}


class gothramChanged extends SevadetailEvent {
  final String gothramname;

  const gothramChanged({@required this.gothramname});

  @override
  List<Object> get props => [gothramname];

  @override
  String toString() => 'nameChanged { name: $gothramname }';
}

class ssevadetailChanged extends SevadetailEvent {
  final String ssevadetail;

  const ssevadetailChanged({this.ssevadetail});
}



class FormSubmitted extends SevadetailEvent {}

class FormReset extends SevadetailEvent {}

class FormLoaded extends SevadetailEvent {}
