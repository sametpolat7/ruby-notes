# FLOAT CLASS

# Ruby'deki Float sınıfı, çift hassasiyetli kayan nokta aritmetiği kullanarak gerçek sayıları temsil eder, yani ondalık noktalı çok büyük veya çok küçük sayıları saklayabilirler. Float'lar, tamsayı olmayan sayıları temsil etmek için, özellikle bilimsel hesaplamalar veya finansal hesaplamalar gibi hassasiyet gerektiren hesaplamalar için gereklidir.

# Kayan noktalı sayılar her zaman "tam olarak" doğru sonuçlar vermez. Bunun sebebi IEEE 754 standardına göre yuvarlama hatalarından kaynaklanmaktadır. (Tam olarak hata değil!) Ayrıntılı bilgi için 04_extra / extra.rb Line: 69

# Whats HERE!
# Inherit from : Numeric & Object  // Method: Float.superclass
# Includes module : Comparable // Method: Float.included_modules

# 1. QUERYING:
# finite? : self'in sonlu olup olmadığını döndürür.
puts 0.1.finite?

# infinite? : self'in sonsuz olup olmadığını döndürür. 1, eğer self Sonsuz ise. -1, eğer self -Sonsuz ise. nil, aksi halde.
puts (1.0 / 0.0).infinite?
puts -(1.0 / 0.0).infinite?
puts (0.0 / 0.0).infinite? # NaN, Yani nil

# nan? self öğesinin bir NaN (sayı değil) olup olmadığını döndürür.
puts (0.0 / 0.0).nan? # NaN

# hash: Self öğesinin tamsayı hash kodunu döndürür.
puts 1.0.hash
puts 1.hash
puts -1.0.hash

# Not: Ruby'de, her nesnenin nesne için bir tamsayı hash kodu döndüren hash adında bir metodu vardır. Bu hash kodu nesnenin sayısal bir gösterimidir ve öncelikle hash tablolarındaki gibi hash fonksiyonlarında kullanılır (örneğin, Ruby'nin Hash sınıfı).

# Bir tamsayı hash kodu, nesnenin verilerinden hesaplanan sayısal bir değerdir. Nesneleri hızlı bir şekilde karşılaştırmak için bir yol sağlar ve verileri verimli bir şekilde düzenlemek için hash algoritmalarında kullanılır. Hash kodları şu amaçlarla kullanılır:

# 1. Nesneleri hızlı bir şekilde karşılaştırmak: Karmaşık veri yapılarını doğrudan karşılaştırmak yerine, hash kodları karşılaştırılabilir.

# 2. Verileri hash tablolarında düzenlemek: Hash kodları, nesnelerin bir hash tablosunda nerede saklanacağını belirler ve verimli erişim sağlar.


# 2. COMPARING
# < : self öğesinin verilen değerden küçük olup olmadığını döndürür.

# <= : self öğesinin verilen değerden küçük veya eşit olup olmadığını döndürür.

# <=> : self öğesinin verilen değerden küçük, eşit veya büyük olduğunu belirten bir sayı döndürür.

# == : self öğesinin verilen değere eşit olup olmadığını döndürür.

# > : self değerinin verilen değerden büyük olup olmadığını döndürür.

# >= : self öğesinin verilen değerden büyük veya eşit olup olmadığını döndürür.


# 3. CONVERTING
# % : (modulo olarak takılır): Verilen değerin self modülünü döndürür.
puts 3.4 % 0.2
puts 3.4 % 1.7

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

# coerce : Verilen değerin Float'a dönüştürülmüş halini ve self değerini içeren 2 elemanlı bir dizi döndürür.
puts 1.0.coerce(4).inspect
puts Rational(5, 2).coerce(4.0).inspect

# divmod : Kendini verilen değere bölmenin bölüm ve kalan sonuçlarını içeren 2 elemanlı bir dizi döndürür.
puts (11.3).divmod(0.7).inspect
puts Rational(113, 10).divmod(Rational(7, 10)).inspect

# === NOT ===: Kolay yoldan kesir çevirme yolu (to_r tam olarak doğru sonuçlar vermeyebilir!) rationalize metodudur.
puts (11.3).to_r # 3180667236830413 / 281474976710656
puts (11.3).rationalize # 113 / 10
puts (11.3).rationalize(0.1) # 34 / 3


# fdiv : Kendini verilen değere bölmenin Float sonucunu döndürür.
puts 0.9.fdiv(0.4)
puts Rational(9, 10).fdiv(Rational(4, 10))

# next_float : Bir sonraki daha büyük temsil edilebilir Float döndürür.
puts (0.0).next_float
puts (0.1).next_float

# prev_float : Bir sonraki daha küçük temsil edilebilir Float döndürür.
puts (0.0).prev_float
puts (0.1).prev_float

# quo : Self öğesinin verilen değere bölünmesiyle elde edilen bölümü döndürür.
puts 3.14.quo(2)
puts 3.14 / 2.0


# FLOAT CONSTANTS
# Ruby'deki Float sınıfı, kayan noktalı sayılarla ilgili özel değerleri ve sınırları temsil eden birkaç sabit sağlar. Bu sabitler, bu değerlere kolay erişim sağlamak ve kayan noktalı aritmetiğin sınırlamalarını ve davranışlarını yönetmeye yardımcı olmak için tanımlanmıştır.

# Float::RADIX : Kayan noktalı sayı sisteminin tabanı (genellikle 2).Bu sabit bize Ruby'deki kayan noktalı sayıların ikili (taban 2) olarak temsil edildiğini söyler. Taban veya radix, kayan nokta gösteriminin temel yapı taşıdır ve sayıların nasıl kodlanacağını belirler.
puts Float::RADIX

# Float::MANT_DIG : Mantissa (anlamlı) içindeki base-Float::RADIX basamaklarının sayısı. Bu sabit, kayan noktalı sayıdaki anlamlı değeri (mantissa) temsil etmek için kullanılan 53 bit olduğunu gösterir. Anlamlı sayı, kayan noktalı bir sayının anlamlı rakamlarını içeren kısmıdır.
puts Float::MANT_DIG

# Float::DIG : Hassasiyetin ondalık basamak sayısı. Bu sabit, Ruby'deki bir Float'ın yaklaşık 15 ondalık basamağı tam olarak temsil edebileceğini gösterir. Bu, kayan noktalı sayılarla çalışırken hassasiyet sınırlamalarını anlamak için önemlidir.
puts Float::DIG  # => 15

# Float::MIN_EXP : Minimum üs değeri. Bu sabit, normalleştirilmiş bir kayan noktalı sayı için en küçük üssü temsil eder. Normalleştirilmeden temsil edilebilecek değer aralığının anlaşılmasına yardımcı olur.
puts Float::MIN_EXP

# Float::MAX_EXP : Maksimum üs değeri. Bu sabit, normalleştirilmiş bir kayan noktalı sayı için en büyük üssü temsil eder. Normalleştirilmeden temsil edilebilecek değer aralığının anlaşılmasına yardımcı olur.
puts Float::MAX_EXP

# Float::MIN : En küçük pozitif normalleştirilmiş sayı. Bu sabit, normalleştirilmiş bir float olarak temsil edilebilecek en küçük pozitif sayıyı gösterir. Bundan daha küçük değerler normalize edilmeyecek veya sıfıra taşacaktır.
puts Float::MIN

puts Float::EPSILON <=> Float::MIN # 1, yani self daha büyük
puts (Float::EPSILON - Float::MIN) # 2.220446049250313e-16

minus = Float::EPSILON - Float::MIN
puts sprintf("%.53f", minus)

puts "Float::EPSILON: #{sprintf("%.53f", Float::EPSILON)}"
puts "Float::MIN: #{sprintf("%.950f", Float::MIN)}"

puts sprintf("%.53f", minus) == sprintf("%.53f", Float::EPSILON)

# Float::MAX : En büyük sonlu sayı. Bu sabit, en büyük sonlu float değerini gösterir. Bundan daha büyük değerlerle sonuçlanan işlemler sonsuza taşar.
puts Float::MAX
puts sprintf("%.f", Float::MAX)

puts Float::MAX * 2

# Float::EPSILON : 1 ile 1'den büyük en küçük float arasındaki fark. Bu sabit, 1 ile bir sonraki temsil edilebilir float arasındaki en küçük farkı temsil eder. Kayan nokta aritmetiğinin hassasiyetinin bir ölçüsüdür.
a = 1.0
b = a + Float::EPSILON

puts a == b

# Float::INFINITY : Pozitif sonsuzluğu temsil eder. Bu sabit, maksimum sonlu değeri aşan değerleri temsil etmek için kullanılır. Kayan nokta aritmetiğindeki taşmaları işlemek için kullanışlıdır.
puts Float::INFINITY

# Float::NAN : "Sayı olmayan" bir değeri temsil eder.Bu sabit, sıfıra bölme gibi tanımlanmamış veya temsil edilemeyen matematiksel işlemlerin sonucunu temsil etmek için kullanılır.
puts Float::NAN  # => NaN

x = 0.0 / 0.0
puts x.nan?  # => true
