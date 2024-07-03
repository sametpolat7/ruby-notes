# NUMERIC CLASS

# Ruby'deki Numeric sınıfı tüm sayısal tipler için bir üst sınıf olarak hizmet eder. Daha yüksek seviyeli sayısal sınıflar oluşturmak için bir temel sağlar.

# Numeric, tüm üst düzey sayısal sınıfların miras alması gereken sınıftır. Numeric, heap-allocated nesnelerin örneklenmesine izin verir. Integer gibi diğer temel sayısal sınıflar "immediate" olarak uygulanır; bu da her Integer'ın her zaman değerle aktarılan tek bir değişmez nesne olduğu anlamına gelir.

# Heap Allocation: Numeric, heap üzerinde tahsis edilen nesnelerin yaratılmasına izin verir. Bu, Numeric'ten miras kalan sınıfların örneklerinin dinamik olarak oluşturulabileceği ve Ruby'nin çöp toplayıcısı tarafından yönetilebileceği anlamına gelir.

# Immediate Nesneler: Integer gibi temel sayısal sınıflar immediate değerler olarak gerçeklenir. Bu, değişmez oldukları ve her değerin benzersiz olduğu anlamına gelir.

a = 10
b = 10
puts a.equal?(b) # => true (10 immediate bir nesnedir, Ruby aynı nesneyi tekrar kullanır)

# Ayrıntılı bilgi için : 04_extra / extra.rb line: 60

a = 1
puts 1.object_id == a.object_id

# Integer "immediate values" olduğundan, bunların yeni örneklerini oluşturamazsınız. Bir Integer'ı çoğaltmaya yönelik herhangi bir girişim aynı nesneyi döndürür.

begin
Integer.new(1) # Hata yükseltir.
rescue NoMethodError => e
  puts e.message
end

# Numeric Alt Sınıfı: Özel numerik sınıflar oluştururken, Ruby'nin Numeric çerçevesi ile tutarlılık ve uyumluluk sağlamak için Numeric'ten miras almak çok önemlidir. Alt sınıflar doğru çalışmak için belirli yöntemleri uygulamalıdır.

# Whats HERE!
# Class: Numeric
# Inherit from : class Object  // Method: Numeric.superclass
# Subclasses : [Integer, Float, Date::Infinity, Complex, Rational] // Method: Numeric.subclasses
# Includes module : Comparable // Method: Numeric.included_modules

# İşte, bazı Numeric methodları:

# 1. QUERYING:
# finite? : Sayı sonlu ise true, aksi takdirde false döndürür.
puts 10.finite?
puts Float::INFINITY.finite?

# infinite? : Sayısal bir değerin sonsuz olup olmadığını belirlemek için kullanılır ve sonsuzluk türüne göre -1, nil veya +1 döndürür:
puts Float::INFINITY.infinite?
puts (-Float::INFINITY).infinite?
puts 10.infinite?  # nil

# integer? : self öğesinin bir tamsayı olup olmadığını döndürür.
puts 10.integer?
puts 1.0.integer?

# negative? self'in negatif olup olmadığını döndürür.
puts 10.negative?
puts -10.negative?

# zero? self'in sıfır olup olmadığını döndürür.
puts 0.zero?
puts 10.zero?

# nonzero? Eğer self sıfır değilse değilse self döndürür, aksi takdirde nil döndürür
puts 10.nonzero?
puts 0.nonzero?

# positive? self değerinin pozitif olup olmadığını döndürür.
puts 10.positive?
puts -10.positive?

# real? self'in gerçek bir değer olup olmadığını döndürür.
puts 10.real?
puts 1.0.real?
puts Complex(1, 2).real?


# 2. COMPARING
# <=> : Self verilen değerden küçükse -1. Self verilen değere eşitse 0. Self verilen değerden büyükse 1. self ve verilen değer karşılaştırılabilir değilse nil.
puts 0 <=> 1
puts 1 <=> 0
puts 0 <=> 0
puts 0 <=> "a"

# eql? : self ve verilen değerin aynı değer ve türe sahip olup olmadığını döndürür.
puts 10 == 10.0
puts 10.eql?(10.0)
puts 10.equal?(10.0)

# == : Sadece değer kontrolü,
# eql? : Değer ve tür kontrolü,
# equal? : Referans kontrolü.


# 3. CONVERTING
# -@ : Negatiflenmiş olarak self değerini döndürür.
numb = 10
puts -numb

# abs : self öğesinin mutlak değerini döndürür.
puts (-numb).abs

# abs2 : self'in karesini döndürür.
puts numb.abs2

# angle : Self pozitif ise 0, aksi takdirde Math::PI döndürür.
puts (-numb).angle

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

# coerce : Ruby'deki coerce metodu belirli sınıflar (Integer, Rational, ve Complex gibi) tarafından farklı sınıfların örnekleri arasında aritmetik işlemleri sağlamak için kullanılan bir mekanizmadır. Amacı, farklı tiplerdeki işlenenlerin uyumlu tiplere zorlanabilmesini (dönüştürülebilmesini) sağlamaktır, böylece toplama, çıkarma, çarpma ve bölme gibi işlemler sorunsuz bir şekilde gerçekleştirilebilir.

i = 2
puts i.coerce(3).inspect
puts i.coerce(3.0).inspect
puts i.coerce(Rational(5, 2)).inspect

begin
  puts i.coerce(Complex(5, 2)).inspect
rescue RangeError => e
  puts e
end

j = Rational(5, 2)
puts j.coerce(2).inspect
puts j.coerce(2.0).inspect
puts j.coerce(Complex(5, 2)).inspect

# conj : self öğesinin karmaşık eşleniğini döndürür.
puts Complex(5, 2).conj # 5-2i

# numerator : self'in Rasyonel temsilinin payını döndürür; self ile aynı işarete sahiptir.
puts Rational(5, 2).numerator

# denominator : self'in Rasyonel temsilinin paydasını (her zaman pozitif) döndürür.
puts Rational(5, 2).denominator

# div: self değerini verilen değere böler ve bir tamsayıya dönüştürür.
puts 10.div(6)

# divmod: Kendini verilen bölene bölerek elde edilen diziyi [bölüm, modül] döndürür.
puts 10.divmod(6).inspect

# fdiv: Kendini verilen bölene göre bölmenin Float sonucunu döndürür.
puts 10.fdiv(6).inspect # 1.666666667

# Not: puts 10.fdiv(6).round(2).inspect // 1.67

# truncate : Self'i belirli bir hassasiyete kadar "kesilmiş" olarak döndürür.
puts Math::PI.truncate(2)

puts 10.446.round(2)
puts 10.446.truncate(2)


# 4. Others
# clone & dup : Bir nesnenin kopyasını oluşturmak için kullanırlar. Ancak bazı farklılıkları vardır:

# dub : Nesnenin yüzeysel bir kopyasını oluşturur. Kopyalanan nesne, orijinal nesnenin singleton yöntemlerini korumaz. Nesnenin örnek değişkenlerini kopyalar, ancak donmuş durumunu veya ona bağlı herhangi bir singleton sınıfını kopyalamaz.

class DupClass
  def initialize(name)
    @name = name
  end

  def show
    puts @name
  end
end

dup_obj = DupClass.new("Dup Method!")

def dup_obj.singleton
  puts "Im Singleton Method of dup_obj!"
end

puts dup_obj.singleton_methods

dup_obj.freeze
puts dup_obj.frozen?

dup_obj_copy = dup_obj.dup

puts dup_obj_copy.show
puts dup_obj_copy.singleton_methods
puts dup_obj_copy.frozen?


# clone : Nesnenin dup'dan daha kapsamlı bir kopyasını oluşturur. Kopyalanan nesne, orijinal nesnenin singleton yöntemlerini korur. Ayrıca orijinal nesnenin dondurulmuş durumunu da kopyalar. Örnek değişkenleri, singleton yöntemleri ve dondurulmuş durumu miras alır.

class CloneClass
  def initialize(name)
    @name = name
  end

  def show
    puts @name
  end
end

clone_obj = CloneClass.new("Clone Method!")

def clone_obj.singleton
  puts "Im Singleton Method of clone_obj!"
end

puts clone_obj.singleton_methods

clone_obj.freeze
puts clone_obj.frozen?

clone_obj_copy = clone_obj.clone

puts clone_obj_copy.show
puts clone_obj_copy.singleton_methods
puts clone_obj_copy.frozen?

# step : belirli bir adımla (artırma veya azaltma) bir dizi sayı üzerinde yineleme yapmak ve dizideki her değer için bir kod bloğu çağırmak için kullanılır. Özellikle bir sayı aralığını kontrollü bir artış veya azalış ile yinelemek istediğinizde kullanışlıdır.

1.step(10, 2) { |i| puts i }
0.step(100, 4) { |i| puts i }

square = []
1.step(10, 1) { |i| square.push(i*i) }
puts square.inspect
