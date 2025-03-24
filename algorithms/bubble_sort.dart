void bubbleSort(List<int> arr) {
  int n = arr.length;
  // Dış döngü - her geçişte en büyük elemanı sona taşır
  for (int i = 0; i < n - 1; i++) {
    // İç döngü - komşu elemanları karşılaştırır ve gerekirse yer değiştirir
    for (int j = 0; j < n - i - 1; j++) {
      // Eğer mevcut eleman bir sonraki elemandan büyükse yer değiştir
      if (arr[j] > arr[j + 1]) {
        // Yer değiştirme işlemi
        int temp = arr[j];
        arr[j] = arr[j + 1];
        arr[j + 1] = temp;
      }
    }
  }
} 