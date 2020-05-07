import 'package:flutterrazorpay/models/SevaName.dart';


class sevablocrepository {
  List<SevaName> sevadetails = new List<SevaName>();
  sevablocrepository() {
    sevadetails.add(new SevaName('suprabatha', 'india', 234));
    sevadetails.add(new SevaName('thomala', 'germany', 123));
    sevadetails.add(new SevaName('rudhrabhishikam', 'newyork', 456));
  }
  List<String> fetchdetails() {
    List<String> sevaname = sevadetails.map((value) => value.sevadetail).toList();
    print(sevaname);
    return sevaname;
  }
}