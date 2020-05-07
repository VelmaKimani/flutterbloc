part of 'sevadetail_bloc.dart';



class SevadetailState extends Equatable {

  final String name;
  final bool isnameValid;
  final String gothram;
  final bool isgothramValid;
  final DateTime date;
  final String value;
  final bool isvalue;
  final String buttonvalue;
  final bool isbuttonvalue;
  final List<String> sevadetail;
  final String ssevadetail;
  final bool formSubmittedSuccessfully;



  SevadetailState( {this.name, this.gothram, this.date, this.value,this.sevadetail, this.ssevadetail,
    this.buttonvalue,this.isnameValid, this.isgothramValid, this.isvalue, this.isbuttonvalue,this.formSubmittedSuccessfully});

  factory SevadetailState.initial() {
    return SevadetailState(name: '',gothram: '',date:DateTime.parse("1969-07-20 20:18:04Z"),value: '',buttonvalue:'',isnameValid: false,isgothramValid: false,isvalue: false,isbuttonvalue: false,formSubmittedSuccessfully: false,sevadetail: <String>[],
      ssevadetail: null,);}

  factory SevadetailState.sevadetailsLoading() => SevadetailState(
    sevadetail: <String>[],
    ssevadetail: null,
  );

  factory SevadetailState.sevadetailsLoaded({
    @required List<String> brands,
  }) =>
      SevadetailState(
        sevadetail: brands,
        ssevadetail: null,
      );


  @override
  String toString() {
    return 'SevadetailState{name: $name, isnameValid: $isnameValid, gothram: $gothram, isgothramValid: $isgothramValid, date: $date, value: $value, isvalue: $isvalue, buttonvalue: $buttonvalue, isbuttonvalue: $isbuttonvalue, sevadetail: $sevadetail, ssevadetail: $ssevadetail, formSubmittedSuccessfully: $formSubmittedSuccessfully}';
  }

  @override
  List<Object> get props => [name,isnameValid,gothram,isgothramValid,date,value,buttonvalue,isvalue,isbuttonvalue,ssevadetail,sevadetail];

  SevadetailState copyWith({
    String name,String gothram,DateTime date,String value,String buttonvalue, bool isnameValid, isgothramValid,List<String> sevadetail,
    String ssevadetail,
  }) {
    return SevadetailState(
      name: name??this.name,
      isnameValid: isnameValid??this.isnameValid,
      gothram: gothram??this.gothram,
      isgothramValid: isgothramValid??this.isgothramValid,
      date: date??this.date,
      value: value??this.value,
      isvalue: value??this.isvalue,
      buttonvalue: buttonvalue??this.buttonvalue,
      isbuttonvalue: buttonvalue??this.isbuttonvalue,
      sevadetail: sevadetail ?? this.sevadetail,
      ssevadetail: ssevadetail ?? this.ssevadetail,
    );
  }
}