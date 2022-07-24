class Routes {
  var host = "http://192.168.43.94:8000";
  // var host = "https://drcare-53.herokuapp.com";
  getroutes() {
    List<Map<String, String>> routes = [
      {
        "BasicInfo": "$host/mainmodels/basicinfo/",
        "OCRClassify": "$host/mainmodels/classifymodels/ocr/",
        "EnteredValuesClassify":
            "$host/mainmodels/classifymodels/enteredvalues/",
        "CallLeukemia": "$host/mainmodels/leukemiaclassify/"
      },
      {"OCR": "$host/ocr/result/"}
    ];
    return routes;
  }
}
