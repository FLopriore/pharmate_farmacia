import 'package:json_annotation/json_annotation.dart';
import 'package:pharmate_farmacia/data/medicine.dart';
import 'package:pharmate_farmacia/data/pharmacy.dart';
import 'package:pharmate_farmacia/data/user.dart';

/// This allows the `Order` class to access private members in
/// the generated file. The value for this is *.g.dart, where
/// the star denotes the source file name.
part 'order.g.dart';

/// An annotation for the code generator to know that this class needs the
/// JSON serialization logic to be generated.
@JsonSerializable(explicitToJson: true)
class Order {
  int uuid; // order ID
  Pharmacy farmacia;
  User utente;
  Medicine prodotto;
  int quantita;
  Status status;
  String date;

  Order(this.uuid, this.farmacia, this.utente, this.prodotto, this.quantita,
      this.date, this.status);

  /// A necessary factory constructor for creating a new Order instance
  /// from a map. Pass the map to the generated `_$OrderFromJson()` constructor.
  /// The constructor is named after the source class, in this case, Order.
  factory Order.fromJson(Map<String, dynamic> json) => _$OrderFromJson(json);

  /// `toJson` is the convention for a class to declare support for serialization
  /// to JSON. The implementation simply calls the private, generated
  /// helper method `_$OrderToJson`.
  Map<String, dynamic> toJson() => _$OrderToJson(this);
}

// Status of order
// Red: not yet accepted by the pharmacy
// Yellow: pending order (accepted, not yet picked up from pharmacy)
// Green: order completed
enum Status { red, yellow, green }
