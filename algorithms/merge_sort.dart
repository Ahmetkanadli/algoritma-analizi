void mergeSort(List<int> arr) {
  if (arr.length <= 1) return;
  
  // Diziyi ortadan ikiye böl
  int mid = arr.length ~/ 2;
  List<int> left = arr.sublist(0, mid);
  List<int> right = arr.sublist(mid);
  
  // Alt dizileri özyinelemeli olarak sırala
  mergeSort(left);
  mergeSort(right);
  
  // Sıralı alt dizileri birleştir
  _merge(arr, left, right);
}

void _merge(List<int> arr, List<int> left, List<int> right) {
  int i = 0, j = 0, k = 0;
  
  // İki sıralı diziyi birleştir
  while (i < left.length && j < right.length) {
    if (left[i] <= right[j]) {
      arr[k] = left[i];
      i++;
    } else {
      arr[k] = right[j];
      j++;
    }
    k++;
  }
  
  // Sol dizide kalan elemanları ekle
  while (i < left.length) {
    arr[k] = left[i];
    i++;
    k++;
  }
  
  // Sağ dizide kalan elemanları ekle
  while (j < right.length) {
    arr[k] = right[j];
    j++;
    k++;
  }
} 