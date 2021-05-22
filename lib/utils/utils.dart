import 'dart:math';


String processNumber(String value){
  int intValue;
  intValue = int.tryParse(value)!;
  String message = "Number $value is";
  bool okSquare = isSquare(intValue);
  bool okTriangular = isTriangular(intValue);
  if(okSquare == true){
    message += " SQUARE";
  }
  if(okTriangular == true){
    if(okSquare == true)
      message += " and";
    message += " TRIANGULAR";
  }

  if(!(okSquare || okTriangular))
    message += " neither SQUARE or TRIANGULAR";

  return message;
}

bool isSquare(int num){
  int sq = sqrt(num).floor();
  print(sq);
  if(sq * sq == num)
      return true;
  return false;
}

bool isTriangular(int num){
  if (num < 0)
    return false;

  // Considering the equation n*(n+1)/2 = num
  // The equation is  : a(n^2) + bn + c = 0";
  int c = (-2 * num);
  int b = 1, a = 1;
  int d = (b * b) - (4 * a * c);

  if (d < 0)
    return false;

  // Find roots of equation
  double root1 = ( -b + sqrt(d)) / (2 * a);
  double root2 = ( -b - sqrt(d)) / (2 * a);

  print(root1);
  print(root2);

  // checking if root1 is natural
  if (root1 > 0 && root1.floor() == root1)
    return true;

  // checking if root2 is natural
  if (root2 > 0 && root2.floor() == root2)
    return true;

  return false;
}