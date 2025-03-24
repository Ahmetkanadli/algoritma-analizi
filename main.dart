import 'dart:io';
import 'algorithms/bubble_sort.dart';
import 'algorithms/insertion_sort.dart';
import 'algorithms/max_sub_array.dart';
import 'algorithms/power.dart';
import 'algorithms/quick_sort.dart';
import 'algorithms/merge_sort.dart';
import 'algorithms/search.dart';

void main() {
  // Test dizisi
  List<int> numbers = [64, 34, 25, 12, 22, 11, 90];
  List<int> sortedNumbers = [];
  int? target;
  
  while (true) {
    print("\nAlgoritma Menüsü:");
    print("1. Bubble Sort");
    print("2. Insertion Sort");
    print("3. Quick Sort");
    print("4. Merge Sort");
    print("5. Maximum Subarray");
    print("6. Üs Alma");
    print("7. Doğrusal Arama");
    print("8. İkili Arama");
    print("9. Çıkış");
    
    stdout.write("Lütfen bir seçenek seçin (1-9): ");
    String? choice = stdin.readLineSync();
    
    if (choice == null) continue;
    
    switch (choice) {
      case '1':
        print("\nBubble Sort:");
        print("Sıralanmamış dizi: $numbers");
        sortedNumbers = List.from(numbers);
        bubbleSort(sortedNumbers);
        print("Sıralanmış dizi: $sortedNumbers");
        break;
        
      case '2':
        print("\nInsertion Sort:");
        print("Sıralanmamış dizi: $numbers");
        sortedNumbers = List.from(numbers);
        insertionSort(sortedNumbers);
        print("Sıralanmış dizi: $sortedNumbers");
        break;
        
      case '3':
        print("\nQuick Sort:");
        print("Sıralanmamış dizi: $numbers");
        sortedNumbers = List.from(numbers);
        quickSort(sortedNumbers);
        print("Sıralanmış dizi: $sortedNumbers");
        break;
        
      case '4':
        print("\nMerge Sort:");
        print("Sıralanmamış dizi: $numbers");
        sortedNumbers = List.from(numbers);
        mergeSort(sortedNumbers);
        print("Sıralanmış dizi: $sortedNumbers");
        break;
        
      case '5':
        print("\nMaximum Subarray:");
        print("Dizi: $numbers");
        SubArrayResult result = findMaxSubArray(List.from(numbers));
        print("Maksimum alt dizi: ${numbers.sublist(result.startIndex, result.endIndex + 1)}");
        print("Başlangıç indeksi: ${result.startIndex}");
        print("Bitiş indeksi: ${result.endIndex}");
        print("Toplam: ${result.sum}");
        break;
        
      case '6':
        print("\nÜs Alma:");
        stdout.write("Taban sayısını girin: ");
        int? base = int.tryParse(stdin.readLineSync() ?? '');
        stdout.write("Üs değerini girin: ");
        int? exponent = int.tryParse(stdin.readLineSync() ?? '');
        
        if (base == null || exponent == null) {
          print("Geçersiz giriş! Lütfen sayı girin.");
          break;
        }
        
        try {
          print("\nİteratif Yöntem:");
          print("$base^$exponent = ${powerIterative(base, exponent)}");
          
          print("\nÖzyinelemeli Yöntem:");
          print("$base^$exponent = ${powerRecursive(base, exponent)}");
          
          print("\nVerimli Özyinelemeli Yöntem:");
          print("$base^$exponent = ${powerEfficient(base, exponent)}");
        } catch (e) {
          print("Hata: ${e.toString()}");
        }
        break;
        
      case '7':
        print("\nDoğrusal Arama:");
        stdout.write("Aranacak sayıyı girin: ");
        target = int.tryParse(stdin.readLineSync() ?? '');
        
        if (target == null) {
          print("Geçersiz giriş! Lütfen sayı girin.");
          break;
        }
        
        int linearResult = linearSearch(numbers, target);
        if (linearResult != -1) {
          print("$target sayısı dizinin ${linearResult}. indeksinde bulundu.");
        } else {
          print("$target sayısı dizide bulunamadı.");
        }
        break;
        
      case '8':
        print("\nİkili Arama:");
        stdout.write("Aranacak sayıyı girin: ");
        target = int.tryParse(stdin.readLineSync() ?? '');
        
        if (target == null) {
          print("Geçersiz giriş! Lütfen sayı girin.");
          break;
        }
        
        // İkili arama için diziyi sırala
        sortedNumbers = List.from(numbers)..sort();
        int binaryResult = binarySearch(sortedNumbers, target);
        
        if (binaryResult != -1) {
          print("$target sayısı sıralı dizinin ${binaryResult}. indeksinde bulundu.");
        } else {
          print("$target sayısı dizide bulunamadı.");
        }
        break;
        
      case '9':
        print("Program sonlandırılıyor...");
        return;
        
      default:
        print("Geçersiz seçenek! Lütfen 1-9 arasında bir sayı girin.");
    }
  }
} 