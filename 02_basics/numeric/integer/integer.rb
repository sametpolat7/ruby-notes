# INTEGER CLASS

# Bir Integer nesnesi bir tamsayı değerini temsil eder. Bu sınıfın bir örneğine bir singleton yöntemi ekleme girişimi bir istisnanın ortaya çıkmasına neden olur. (Çünkü immediate bir nesnedir!)

# Whats HERE!
# Inherit from : Numeric & Object  // Method: Integer.superclass
# Includes module : Comparable // Method: Integer.included_modules

# İşte, bazı Integer methodları:

# 1. QUERYING:
# allbits? : Belirli bir desene (maske olarak adlandırılır) dayalı olarak bir sayıdaki belirli bitlerin tümünün 1 olarak ayarlanıp ayarlanmadığını kontrol eder.
# 13 = 0b1101
puts 13.allbits?(0b0101)
puts 13.allbits?(0b1111) # false

# anybits? : Belirli bir desene (maske olarak adlandırılır) dayalı olarak bir sayıdaki belirli bitlerin bazılarının 1 olarak ayarlanıp ayarlanmadığını kontrol eder.
puts 13.anybits?(0b1111) # true

# nobits? : elirli bir desene (maske olarak adlandırılır) dayalı olarak bir sayıdaki belirli bitlerin hiçbirinin 1 olarak ayarlanıp ayarlanmadığını kontrol eder.
puts 13.nobits?(0b0011) #false
puts 13.nobits?(0b0010) #true


# 2. COMPARING
# < : self öğesinin verilen değerden küçük olup olmadığını döndürür.

# <= : self değerinin verilen değerden küçük veya eşit olup olmadığını döndürür.

# <=> : self öğesinin verilen değerden küçük, eşit veya büyük olduğunu belirten bir sayı döndürür.

# == : self öğesinin verilen değere eşit olup olmadığını döndürür.

# > : self değerinin verilen değerden büyük olup olmadığını döndürür.

# >= : self öğesinin verilen değerden büyük veya eşit olup olmadığını döndürür.


# 3. CONVERTING
# ::sqrt : Verilen değerin tamsayı karekökünü döndürür.
puts Integer.sqrt(10)
puts Integer.sqrt(16)
puts Integer.sqrt(25)

# ::try_convert : Verilen değeri bir Tamsayıya dönüştürülmüş olarak döndürür.
puts Integer.try_convert(1.25)

# % : Verilen değerin modulo değerini döndürür.
puts 10 % 2
puts 10 % 3
puts 10 % 4

puts 10 % -2
puts 10 % -3
puts 10 % -4

# & : self ve verilen değerin bitsel AND değerini döndürür.
a = 5   # Binary: 101
b = 3   # Binary: 011

result = a & b  # Result: 001 (binary) => 1 (decimal)

puts result  # => 1 result.to_s(2) = 001

# Not: Maskeleme: Bitsel AND genellikle bir değerdeki belirli bitleri maskelemek için kullanılır. Örneğin, son 4 bit hariç tüm bitleri temizlemek için "number & 0xF" kullanabilirsiniz. 0xFF = 11110000

number = 25     # Binary: 11001
masked = number & 0xF0   # Binary: 11000

puts masked.to_s(2)     # Output: 10000

# * : self ile verilen değerin çarpımını döndürür.

# ** : self değerinin verilen değerin kuvvetine yükseltilmiş halini verir.

# + : self ve verilen değerin toplamını verir.

# - : self ve verilen değerin farkını döndürür.

# / : self ve verilen değerin bölümünü döndürür.

# << : Sola doğru bit kaydırmadan sonra self değerini döndürür. (Sağdan sıfır ekler)
c = 5   # Binary: 101
d = c << 2

puts d   # Output: 20, Binary: 10100

# >> : Sağa doğru bit kaydırmadan sonra self değerini döndürür (Sağdan bitleri eksiltir)
e = 16   # Binary: 10000
f = e >> 2

puts f   # Output: 4, Binary: 100

# [] : self öğesinden bir bit dilimi döndürür.
g = 0b10

puts g[0]
puts g[1]

# ^ : İki tamsayı arasında bitsel özel VEYA (XOR) işlemi gerçekleştirir. Bu işlem iki tamsayının her bitini karşılaştırır ve işlenenlerin karşılık gelen bitleri farklıysa her bitin 1'e ve aynıysa 0'a ayarlandığı yeni bir tamsayı döndürür.
a = 5   # Binary: 101
b = 3   # Binary: 011

result = a ^ b

puts result # Result: 6, Binary: 110

# round: Belirli bir hassasiyette self'i en yakın tamsayıya yuvarlar.
puts (10.4).round
puts (10.5).round
puts (10.6).round

puts Math::PI.round(2)

# floor: Belirli bir hassasiyette self'i en yakın alt tamsayıya yuvarlar.
puts (10.4).floor
puts (10.5).floor
puts (10.6).floor

puts Math::PI.floor(2)

# ceil: Belirli bir hassasiyette self'i en yakın üst tamsayıya yuvarlar.
puts (10.4).ceil
puts (10.5).ceil
puts (10.6).ceil

puts Math::PI.ceil(2)

# chr :self değerinin temsil ettiği karakteri içeren 1 karakterlik bir dize döndürür.
puts 65.chr
puts 97.chr

# Tersi:
puts "A".ord
puts "a".ord

# digits : self öğesinin taban-radiks basamaklarını temsil eden bir tamsayı dizisi döndürür; dizinin ilk öğesi en düşük değerli basamağını temsil eder.
puts 145.digits.inspect
puts 8.digits(2).inspect

# div: self değerini verilen değere böler ve bir tamsayıya dönüştürür.
puts 10.div(6)

# divmod: Kendini verilen bölene bölerek elde edilen diziyi [bölüm, modül] döndürür.
puts 10.divmod(6).inspect

# fdiv: Kendini verilen bölene göre bölmenin Float sonucunu döndürür.
puts 10.fdiv(6).inspect # 1.666666667

# truncate : Self'i belirli bir hassasiyete kadar "kesilmiş" olarak döndürür.
puts Math::PI.truncate(2)

puts 10.446.round(2)
puts 10.446.truncate(2)

# pow: self öğesinin modüler üstel değerini döndürür.
puts 3.pow(4) # 3^4: 81
puts 3.pow(4, 5) # (3^4) % 5: 1

# pred: self öğesinin tamsayı öncülünü döndürür.
puts 0.pred
puts -10.pred

# succ (next): self öğesinin tamsayı ardılını döndürür.
puts 0.succ
puts -10.succ

# remainder: Kendini verilen değere böldükten sonra kalanı döndürür.
puts 11.remainder(4)
puts 11 % 4

# downto : Belirtilen bir sayıdan başlayarak belirtilen başka bir sayıya kadar (azalan) bir tamsayı aralığı üzerinde yineleme yapmak için kullanılır ve aralıktaki her tamsayı için bir blok çağırır.
5.downto(1) { |i| puts "Countdown: #{i}" }

# upto : Belirtilen bir sayıdan başlayarak belirtilen başka bir sayıya kadar (artab) bir tamsayı aralığı üzerinde yineleme yapmak için kullanılır ve aralıktaki her tamsayı için bir blok çağırır.
0.upto(10) { |i| puts "Seconds: #{i}" }

# times : Her iterasyon için bir kod bloğu çalıştırarak belirli sayıda iterasyon yapmak için kullanılır. Özellikle bir indeks değişkenini açıkça yönetmeden bir görevi sabit sayıda gerçekleştirmeniz gerektiğinde kullanışlıdır.
3.times { |index| puts "#{index + 1}. I Love You!" }
