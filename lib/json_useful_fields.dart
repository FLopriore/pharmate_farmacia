/// This class contains several methods which modify responseJson coming from
/// server, converting wrong attributes into the desired ones.
class JsonUsefulFields {
  
  // users/me
  static Map<String, dynamic> getPharmaFields(json) {
    var data = {
      "cf": json["cf"],
      "fullname": json["fullname"],
      "citta": json["citta"],
      "worksIn": json["worksIn"],
    };
    return data;
  }

  // ordine/farmacia
  static List<Map<String, dynamic>> getPharmaOrders(List? jsonList) {
    List<Map<String, dynamic>> result = [];
    if (jsonList != null) {
      for (var json in jsonList) {
        var prodotto = {
          "codice_aic": json["prodotto"]["aic"],
          "nome": json["prodotto"]["nome"],
          "prezzo": json["prodotto"]["prezzo"]
        };
        var data = {
          "uuid": json["uuid"],
          "prodotto": prodotto,
          "quantita": json["quantita"],
          "date": json["date"],
          "status": json["status"],
        };
        result.add(data);
      }
    }
    return result;
  }

  // farmacie/giacenza
  static List<Map<String, dynamic>> getWarehouseItems(List? jsonList) {
    List<Map<String, dynamic>> result = [];
    if (jsonList != null) {
      for (var json in jsonList) {
        var prodotto = {
          "codice_aic": json["prodotto"]["aic"],
          "nome": json["prodotto"]["nome"],
          "prezzo": json["prodotto"]["prezzo"]
        };
        var data = {
          "prodotto": prodotto,
          "quantita": json["quantita"],
        };
        result.add(data);
      }
    }
    return result;
  }
}