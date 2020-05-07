import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterrazorpay/repository/seva_bloc_repository.dart';

part 'sevadetail_event.dart';
part 'sevadetail_state.dart';

class SevadetailBloc extends Bloc<SevadetailEvent, SevadetailState> {
   sevablocrepository _sevablocrepository;


  SevadetailBloc({sevablocrepository newCarRepository})
      : _sevablocrepository = newCarRepository;

  final RegExp _nameRegExp = RegExp(
    r'^[a-zA-Z]+(?:\.[a-zA-Z0-9-]+)*$',
  );

  final RegExp _gothramRegExp = RegExp(
    r'^[a-zA-Z0-9.]+[a-zA-Z]',
  );


  @override
  SevadetailState get initialState => SevadetailState.initial();

    @override
  void onTransition(Transition<SevadetailEvent, SevadetailState> transition) {
    print(transition);
    super.onTransition(transition);
  }

  bool _isnameValid(String name) {
    return _nameRegExp.hasMatch(name);
  }

  bool _isgothramValid(String gothram) {
    return _gothramRegExp.hasMatch(gothram);
  }


  @override
  Stream<SevadetailState> mapEventToState(
    SevadetailEvent event,
  ) async* {
    // TODO: implement mapEventToState
    if (event is nameChanged) {
      yield state.copyWith(
        name: event.name,
        isnameValid: _isnameValid(event.name),
      );
    }
    if (event is gothramChanged) {
      yield state.copyWith(
        gothram: event.gothramname,
        isgothramValid: _isgothramValid(event.gothramname),
      );
      if (event is FormLoaded) {
        yield*  _mapFormLoadedToState();
      }
    }
   /*if (event is FormSubmitted) {
      yield state.copyWith(formSubmittedSuccessfully: true);
    }*/
    if (event is FormReset) {
      yield SevadetailState.initial();
    }
  }

  Stream<SevadetailState> _mapFormLoadedToState() async*{
    yield SevadetailState.sevadetailsLoading();
    final brands = await _sevablocrepository.fetchdetails();
    yield SevadetailState.sevadetailsLoaded(brands: brands);
  }

  }
