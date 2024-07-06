# What is ASCII, UTF-8 and UNICODE?

# 1. ASCII (American Standard Code for Information Interchange)
# ASCII, başlangıçta telekomünikasyon ekipmanı için geliştirilmiş bir karakter kodlama standardıdır. Her biri 7 bitlik bir ikili sayı ile temsil edilen harfler, rakamlar, noktalama işaretleri ve kontrol karakterleri dahil olmak üzere 128 karakterden oluşan bir dizi tanımlar.

# Özellikleri:
# ASCII sadece 128 karakter içeren basit bir kodlama şemasıdır.
# İngiliz alfabesini, rakamları, noktalama işaretlerini ve kontrol karakterlerini kapsar.
# Diğer dillerden karakterleri veya özel sembolleri desteklemez.

# Kullanımı:
# ASCII bilgisayar sistemlerinde, özellikle bilgi işlemin ilk günlerinde yaygın olarak kullanılmıştır.
# Temel metin verilerini kodlamak için birçok sistemde hala yaygındır, ancak uluslararasılaştırma desteği sınırlıdır.

# 2. Unicode
# Unicode, dünya genelinde kullanılan tüm karakterleri ve yazı tiplerini kapsamayı amaçlayan bir karakter kodlama standardıdır. Her karaktere benzersiz kod noktaları atayarak bilgisayarların herhangi bir dildeki metni temsil etmesine ve işlemesine olanak tanır.

# Özellikleri:
# Unicode, farklı dillerden karakterler, semboller, emojiler ve özel karakterler de dahil olmak üzere çok çeşitli karakterleri destekler.
# Her karakter için benzersiz bir kod noktası sağlayarak metin verilerinin evrensel olarak temsil edilmesine ve işlenmesine olanak tanır.
# Unicode, UTF-8, UTF-16 ve UTF-32 gibi farklı kodlama şemaları kullanılarak uygulanabilir.

# Kullanım şekli:
# Unicode, metin verilerini işlemek için modern bilgisayarlarda kullanılan baskın karakter kodlama standardıdır.
# Yazılım uygulamalarının uluslararasılaştırılmasını ve yerelleştirilmesini sağlayarak birden fazla dili ve komut dosyasını desteklemelerine olanak tanır.

# 3. UTF-8 (Unicode Transformation Format - 8 bit)
# UTF-8, Unicode için değişken genişlikli bir karakter kodlama şemasıdır. Her karakteri, karakterin kod noktasına bağlı olarak bir ila dört bayt kullanarak temsil eder ve hem ASCII hem de ASCII olmayan karakterlerin verimli bir şekilde kodlanmasına olanak tanır.

# Özellikleri:
# UTF-8, ASCII ile geriye dönük olarak uyumludur. ASCII karakterleri tek bir bayt kullanılarak gösterilir (ASCII ile aynı gösterim).
# Unicode karakterlerini temsil etmek için değişken sayıda bayt kullanır; ASCII karakterleri tek bir baytla, diğer karakterler ise birden fazla baytla temsil edilir.
# UTF-8, İngilizce metin için alan verimlidir ve internette ve yazılım uygulamalarında yaygın olarak kullanılır.

# Kullanım şekli:
# UTF-8, web'de ve yazılım geliştirmede en yaygın kullanılan kodlamadır.
# Ruby, Python ve JavaScript dahil olmak üzere birçok programlama dili için varsayılan kodlamadır.
# UTF-8, metin verilerinin birden fazla dilde temsil edilmesini ve iletişimini sağlayarak yazılım uygulamalarının uluslararasılaştırılması ve küreselleştirilmesi için gerekli hale getirir.

# Özetle:

# ASCII, öncelikle İngilizce metni temsil etmek için kullanılan basit bir karakter kodlama standardıdır.

# Unicode, tüm dillerden ve komut dosyalarından karakterleri destekleyen kapsamlı bir karakter kodlama standardıdır.

# UTF-8, Unicode için hem ASCII hem de ASCII olmayan karakterleri verimli bir şekilde temsil eden ve modern bilgisayarlarda yaygın olarak kullanılan değişken genişlikli bir kodlama şemasıdır.

# Özünde, ASCII temeldi, Unicode küresel olarak erişimini genişletti ve UTF-8, verimliliği ve ASCII ile uyumluluğu nedeniyle Unicode için baskın kodlama yöntemi haline geldi. Bu kodlar, bilgisayarların farklı dil ve yazılardaki metin verilerini işlemesini sağlayarak iletişim ve yazılım geliştirmeyi daha kapsayıcı ve çok yönlü hale getirmektedir.


# What is First-Class Object?

# Değişkenlerde ve veri yapılarında saklanabilir.
# Fonksiyonlara veya yöntemlere argüman olarak aktarılır.
# Bir fonksiyon veya metodun sonucu olarak döndürülür.

# Esasen bu, dilin varlığa (bir fonksiyon, nesne veya veri yapısı gibi) diğer herhangi bir değer gibi davrandığı anlamına gelir. Diğer veri türleriyle aynı şekilde manipüle edilebilir ve kullanılabilir.


# What is Heap Allocation and Immediate Values in Ruby?

# Ruby'de çoğu nesne heap üzerinde saklanır, bu da dinamik bellek yönetimine ve çöp toplamaya izin verir. Ancak, özellikle Integer gibi bazı temel sayısal sınıflar için istisnalar vardır. Bu istisnalar "anlık değerler" olarak bilinir.

# Immediate Values : Küçük tamsayılar (eski Ruby sürümlerinde Fixnum örnekleri, şimdi Integer altında birleştirildi), semboller ve true, false ve nil gibi bazı nesneler "anlık değerler" olarak saklanır. Bu anlık değerler heap üzerinde saklanmaz. Bunun yerine, doğrudan bir değişken referansının tipik olarak işaret edeceği bellek alanında temsil edilirler.

# Heap Allocation for Other Objects : Diğer nesneler için (ara olmayan sayısal nesneler dahil): Yığın üzerinde tahsis edilirler. Yığın, çoğu nesnenin depolandığı dinamik bellek tahsisi için kullanılan bir bellek bölgesidir. Yığın tahsisi, Ruby'nin çöp toplayıcısı tarafından yönetilen karmaşık ve büyük nesnelerin oluşturulmasına izin verir.


# Why Float Number Returns Wrong Answers Sometimes?
# Kayan noktalı sayılar her zaman tam olarak doğru sonuçlar döndürmez. Ve bu davranış sadece Ruby'de değil, kayan noktalı aritmetik kullanan neredeyse tüm programlama dillerinde iyi bilinen bir sorundur. Bu sorun, kayan noktalı sayıların bilgisayar belleğinde nasıl temsil edildiğinden kaynaklanır.

# Kayan Noktalı Gösterim
# Kayan noktalı sayılar, sayıyı temsil etmek için sabit sayıda ikili basamak kullanan IEEE 754 standardı tarafından belirtilen bir format kullanılarak temsil edilir. Bu format şunları içerir:

# Bir işaret biti
# 8-11 üs biti (32 veya 64)
# 11-53 kesir biti (veya mantissa) (32 veya 64)

# Bu sabit hassasiyet nedeniyle, bazı sayılar tam olarak kayan nokta değerleri olarak gösterilemez. Bu da aritmetik işlemlerde küçük yuvarlama hatalarına yol açar.

a = 0.1
b = 0.2
c = a + b
puts c # 0.30000000000000004

# Kayan Nokta Hatalarının Azaltılması

# 1. Yuvarlama
# Kayan nokta hatalarını azaltmanın yaygın bir yolu, sonucu sabit sayıda ondalık basamağa yuvarlamaktır.
puts c.round(2) # 0.3

# Not: Ancak, özellikle çok sayıda işlem veya çok hassas hesaplamalar söz konusu olduğunda yuvarlama her zaman uygun olmayabilir.

# 2. Tam Aritmetik için Rasyonel Kullanımı
# Ruby ayrıca kesirleri tam olarak temsil etmek için Rational sınıfını sağlar.
d = Rational(1, 10)
e = Rational(2, 10)
f = d + e
puts f.to_f

# Another Explanatation:
# Ruby de dahil olmak üzere çoğu programlama dilinde, kayan noktalı sayılar IEEE 754 standardı kullanılarak temsil edilir. Bu standart gerçek sayıları temsil etmek için sonlu sayıda ikili basamak kullanır, bu da hassasiyet sınırlamaları getirir. 0.1'in İkili Gösterimi 0.1 ondalık sayısının tam bir ikili gösterimi yoktur. İkiliye dönüştürüldüğünde, tekrar eden bir ikili kesir haline gelir:

# 0.1 ≈ 0.0001100110011001100110011001100110011001100110011001101... (ikili)

# Temsil, çift hassasiyetli kayan noktalı sayının (64 bit) mevcut hassasiyetine sığacak şekilde kesildiğinden, küçük bir hataya neden olur. Bu hata, 0,1'in bellekte tam olarak 0,1 olarak değil, ancak yakın bir yaklaşım olarak saklanmasının nedenidir.
