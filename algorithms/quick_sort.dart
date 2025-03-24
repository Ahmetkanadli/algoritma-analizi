void quickSort(List<int> arr) {
  _quickSortHelper(arr, 0, arr.length - 1);
}

void _quickSortHelper(List<int> arr, int low, int high) {
  if (low < high) {
    // Pivot elemanının doğru pozisyonunu bul
    int pivotIndex = _partition(arr, low, high);
    
    // Sol ve sağ alt dizileri özyinelemeli olarak sırala
    _quickSortHelper(arr, low, pivotIndex - 1);
    _quickSortHelper(arr, pivotIndex + 1, high);
  }
}

int _partition(List<int> arr, int low, int high) {
  // Son elemanı pivot olarak seç
  int pivot = arr[high];
  int i = low - 1;
  
  // Pivot'tan küçük elemanları sola taşı
  for (int j = low; j < high; j++) {
    if (arr[j] <= pivot) {
      i++;
      // Elemanları değiştir
      int temp = arr[i];
      arr[i] = arr[j];
      arr[j] = temp;
    }
  }
  
  // Pivot'u doğru pozisyonuna yerleştir
  int temp = arr[i + 1];
  arr[i + 1] = arr[high];
  arr[high] = temp;
  
  return i + 1;
} 