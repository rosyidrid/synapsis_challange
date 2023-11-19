String getToken(cookie) {
  String startText = "";
  String endText = ";";
  String token = '';
  int startIndex = cookie.indexOf(startText);
  if (startIndex != -1) {
    int endIndex = cookie.indexOf(endText, startIndex + startText.length);
    if (endIndex != -1) {
      token = cookie.substring(startIndex + startText.length, endIndex);
      return token;
    } else {
      return token;
    }
  } else {
    return token;
  }
}
