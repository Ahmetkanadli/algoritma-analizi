class SubArrayResult {
  final int startIndex;
  final int endIndex;
  final int sum;

  SubArrayResult(this.startIndex, this.endIndex, this.sum);
}

SubArrayResult findMaxSubArray(List<int> arr) {
  int maxSum = arr[0];
  int currentSum = arr[0];
  int startIndex = 0;
  int currentStartIndex = 0;
  int endIndex = 0;

  // Diziyi tek geçişte tara
  for (int i = 1; i < arr.length; i++) {
    // Mevcut elemanı mevcut toplama ekle
    currentSum += arr[i];

    // Eğer mevcut eleman, mevcut toplamdan büyükse
    // yeni bir alt dizi başlat
    if (arr[i] > currentSum) {
      currentSum = arr[i];
      currentStartIndex = i;
    }

    // Eğer mevcut toplam, maksimum toplamdan büyükse
    // maksimum toplamı ve indeksleri güncelle
    if (currentSum > maxSum) {
      maxSum = currentSum;
      startIndex = currentStartIndex;
      endIndex = i;
    }
  }

  return SubArrayResult(startIndex, endIndex, maxSum);
} 