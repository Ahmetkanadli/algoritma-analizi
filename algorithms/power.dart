// İteratif yöntem ile üs alma
int powerIterative(int base, int exponent) {
  if (exponent < 0) {
    throw ArgumentError('Üs negatif olamaz');
  }
  
  int result = 1;
  for (int i = 0; i < exponent; i++) {
    result *= base;
  }
  return result;
}

// Özyinelemeli yöntem ile üs alma
int powerRecursive(int base, int exponent) {
  if (exponent < 0) {
    throw ArgumentError('Üs negatif olamaz');
  }
  
  // Temel durumlar
  if (exponent == 0) return 1;
  if (exponent == 1) return base;
  
  // Özyinelemeli durum
  return base * powerRecursive(base, exponent - 1);
}

// Daha verimli özyinelemeli yöntem (O(log n))
int powerEfficient(int base, int exponent) {
  if (exponent < 0) {
    throw ArgumentError('Üs negatif olamaz');
  }
  
  // Temel durumlar
  if (exponent == 0) return 1;
  if (exponent == 1) return base;
  
  // Çift üs için optimizasyon
  if (exponent % 2 == 0) {
    int half = powerEfficient(base, exponent ~/ 2);
    return half * half;
  }
  
  // Tek üs için
  return base * powerEfficient(base, exponent - 1);
} 