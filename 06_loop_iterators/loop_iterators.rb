# Loops & Iterators

# Bilgisayar programlamasında bazı işlemler en iyi şekilde bir döngü ile gerçekleştirilir. Döngü, bir kod parçasının belirli bir tekrar miktarı boyunca veya belirli bir koşul karşılanana kadar tekrar tekrar yürütülmesidir. while döngüleri, do/while döngüleri ve for döngülerini ele alacağız.

# Simple Loop
# Ruby'de bir döngü oluşturmanın en basit yolu loop metodunu kullanmaktır. loop bir blok alır, bu blok { ... } ya da do ... end ile gösterilir. Bir döngü, siz Ctrl + c ile manuel olarak müdahale edene veya bloğun içine döngüyü durmaya zorlayacak ve yürütmenin döngüden sonra devam etmesine izin verecek bir break deyimi ekleyene kadar blok içindeki herhangi bir kodu yürütür (yine, bu sadece {} veya do ... end arasındadır).

# loop do
#   puts "This will keep printing until you press Ctrl + C."
# end

# Not: Gerçek bir programda böyle bir şey yapmazsınız, çünkü çok kullanışlı değildir ve sonsuz bir döngüye neden olur. Sonunda sisteminiz çökecektir.

# Controlling Loop Execution
# Şimdi break anahtar sözcüğü ile daha kullanışlı bir örneğe bakalım:

i = 0

loop do
  i += 1
  puts i
  break
end

# break anahtar sözcüğü bir döngüden herhangi bir noktada çıkmamızı sağlar, bu nedenle break'ten sonra herhangi bir kod çalıştırılmayacaktır. break'in programdan çıkmayacağını, yalnızca döngüden çıkacağını ve yürütmenin döngüden sonra devam edeceğini unutmayın. Şimdi, 0'dan 10'a kadar tüm çift sayıları yazdırarak bir döngü içine koşullar eklemeye bakalım.

k = 0

loop do
  k += 2
  puts k
  if k == 10
    break
  end
end

# Yukarıdan, döngü boyunca ilk 4 yineleme sırasında break'in çalıştırılmadığını görebilirsiniz, ancak 5. yinelemede, if deyimi true olarak değerlendirildi ve böylece if deyimi içindeki kod çalıştırıldı, bu sadece break'tir ve yürütme döngüden çıktı. Daha sonra bir döngü içinde koşullu kullanım hakkında açıkça konuşacağız. Bir döngüden çıkmak için break kullandığımıza benzer şekilde, mevcut yinelemenin geri kalanını atlamak ve bir sonraki yinelemeyi yürütmeye başlamak için next anahtar sözcüğünü kullanabiliriz. Göstermek için daha önce kullandığımız aynı örneği kullanacağız. Bu sefer 4'ü atlayacağız.

j = 0

loop do
  j += 2
  if j == 4
    next
  end
  puts j
  if j == 10
    break
  end
end

# Yukarıdaki kodun 4 çıktısı vermediğine dikkat edin, çünkü bu atlandı. Yürütme döngünün bir sonraki yinelemesine devam etti. break ve next, aşağıda tek tek ele alacağımız, Ruby'deki loop veya diğer döngü yapıları ile kullanılabilen önemli döngü kontrol kavramlarıdır. Koşullar ile birleştirildiğinde, ilginç davranışlara sahip basit programlar oluşturmaya başlayabilirsiniz. Ruby'deki diğer bloklarda olduğu gibi, loop'a geçirilen blok yeni bir kapsam sunar. Bloğun içinden, bloğun dışında ilklendirilmiş değişkenlere erişebilirsiniz. Ancak, bloğun dışından, bloğun içinde başlatılan hiçbir değişkene erişemezsiniz.

loop do
  x = 42
  break
end

begin
  puts x
rescue => e
  puts e.message
end

fourty_two = 42

loop do
  puts fourty_two
  fourty_two = 2
  break
end

puts fourty_two


# While Loops
# Bir while döngüsüne, doğru ya da yanlış olarak değerlendirilen bir parametre verilir. Bu ifade yanlış olduğunda, while döngüsü tekrar yürütülmez ve program while döngüsünden sonra devam eder. while döngüsü içindeki kod, gerçekleştirmek istediğiniz her türlü mantığı içerebilir.
print "Please enter a number: "
x = gets.chomp.to_i

while x >= 0
  x -= 1
  puts x if x >= 0
end

puts "Done"

# Ayrıca, x >= 0 ifadesini döngüyü yürütüp yürütmeyeceğimizi görmek için test olarak kullandığımızdan, döngü içindeki kodun x değişkenini bir şekilde değiştirmesi gerektiğinin farkında olmalısınız. Değiştirmezse, x >= 0 ifadesi her zaman true olarak değerlendirilecek ve sonsuz döngüye neden olacaktır. Programınızın yanıt vermediğini fark ederseniz, sonsuz bir döngüde sıkışmış olması mümkündür.

# **Son bir NOT: loop yönteminin aksine, while bir yöntem olarak uygulanmaz. Bu farklılığın bir sonucu, döngünün aksine while döngüsünün kendi kapsamına sahip olmamasıdır - döngünün tüm gövdesi while döngüsünü içeren kodla aynı kapsamdadır:

z = 0

while z < 5
  y = z * z
  z += 1
end

puts y # Output: 16

# Gördüğünüz gibi, y while döngüsünün gövdesinde başlatılmış olsa da, döngü çalışmayı bitirdikten sonra hala kapsam dahilindedir.


# Until Loop
# Giriş paragrafında until döngüsünden bahsetmedik. Ancak, bilmeniz için kısaca bahsetmemiz gerekiyor. Until döngüsü while döngüsünün basitçe tersidir.

# While döngüsü, koşul "true" olduğu sürece yürütülürken,
# Until döngüsü, koşul "true" OLANA KADAR yürütülür. Yani "false" sonuçlu durumları yürütüyor olur.

number = 0

while number <= 5
  puts number
  number += 1
end

puts "---"

number1 = 0
until number1 > 5 do
  puts number1
  number1 += 1
end


# Do/While Loops
# Bir do/while döngüsü while döngüsüne benzer şekilde çalışır; önemli bir fark, kodun çalıştırılıp çalıştırılmayacağını görmek için koşullu kontrolden önce döngü içindeki kodun bir kez çalıştırılmasıdır. Bir "do/while" döngüsünde, koşullu kontrol döngünün başına değil sonuna yerleştirilir. Ne yazık ki, Ruby'nin yerleşik bir "do/while" döngüsü yoktur - "do/while" döngüsünün davranışını taklit etmek için loop ve break kullanmak zorundayız.

# loop do
#   puts "Do you want to do that again?"
#   answer = gets.chomp
#   if answer != 'Y'
#     break
#   end
# end


# For Loops
# Ruby'de for döngüleri bir eleman koleksiyonu üzerinde döngü yapmak için kullanılır. Dikkatli olmazsak sonsuz bir döngüye neden olabileceğimiz while döngüsünün aksine, for döngüsü sonlu sayıda eleman üzerinde döndüğü için kesin bir sona sahiptir. for ayrılmış sözcüğü ile başlar, ardından bir değişken, sonra in ayrılmış sözcüğü ve ardından bir öğe koleksiyonu gelir. Bunu bir dizi ve bir aralık kullanarak göstereceğiz. Aralık Ruby'de bir eleman aralığını yakalayan özel bir tiptir. Örneğin 1..3, 1, 2 ve 3 tamsayılarını yakalayan bir aralıktır.

for i in 1..10 do
  puts i
end

# for döngüsüyle ilgili tuhaf olan şey, daha önceki while döngüsü örnekleri nil döndürürken, döngünün yürütüldükten sonra öğe koleksiyonunu döndürmesidir. Aralık yerine dizi kullanan başka bir örneğe bakalım.

number_array = [1, 2, 3, 4, 5]

for numb in number_array.reverse do
  puts numb
end

# Yine de çoğu Rubyci for döngülerinden vazgeçer ve bunun yerine yineleyicileri kullanmayı tercih eder. Yineleyicileri daha sonra ele alacağız. while ve until döngülerinde olduğu gibi, for bir metot olarak uygulanmaz. Bu nedenle, bir for döngüsünün kendi kapsamı yoktur - döngünün tüm gövdesi for döngüsünü içeren kodla aynı kapsamdadır.

puts "==="

# Conditionals Within Loops
# Döngüleri daha etkili ve hassas hale getirmek için, davranışlarını değiştirmek üzere içlerine koşullu akış kontrolü ekleyebiliriz. Bunu göstermek için bir while döngüsü içinde bir if deyimi kullanalım.

x = 0

while x <= 10
  if x.odd?
    puts x
  end
  x += 1
end

# Bu döngü, döngüdeki geçerli değişkenin tek olup olmadığına karar vermek için odd? yöntemini kullanır. Eğer öyleyse, ekrana yazdırır. Next,x bir artar ve sonra döngü bir sonraki yinelemeye geçer. next ve break ayrılmış sözcükleri de döngü oluştururken yararlı olabilir. next ayrılmış sözcüğünü bir döngüye yerleştirirseniz, altındaki kodu çalıştırmadan o satırdan bir sonraki döngü yinelemesine atlar. break ayrılmış sözcüğünü bir döngüye yerleştirirseniz, döngüde daha fazla kod çalıştırmadan hemen döngüden çıkar.

x = 0

while x <= 10
  if x == 3
    x += 1
    next
  elsif x.odd?
    puts x
  end
  x += 1
end

# Döngümüzde 3 sayısını yazdırmaktan kaçınmak için burada sonraki ayrılmış kelimeyi kullanıyoruz. break'i de deneyelim.


x = 0

while x <= 10
  if x == 7
    break
  elsif x.odd?
    puts x
  end
  x += 1
end

# Bu programı çalıştırdığınızda, x değeri döngü içinde 7'ye ulaştığında tüm döngünün çıktığını görebilirsiniz. Bu yüzden çıktı sadece 5'e gider. Döngüler herhangi bir programlama dilinde temel yapılardır, ancak çoğu Ruby'ci, mümkün olduğunda, döngüler yerine "yineleyicileri" tercih eder.


# Iterators
# Yineleyiciler, belirli bir veri kümesi üzerinde doğal olarak döngü oluşturan ve koleksiyondaki her bir öğe üzerinde işlem yapmanıza olanak tanıyan yöntemlerdir. Daha önce dizilerin sıralı listeler olduğunu söylemiştik. Diyelim ki elinizde bir isim dizisi var ve bunları ekrana yazdırmak istiyorsunuz. Bunu nasıl yapabilirdiniz? Diziler için each yöntemini kullanabilirsiniz, bunun gibi:

film_list = ["Octopus", "Yeager", "King Ragnar", "Palacios"]

for film in film_list
  puts film
end

# Ya da daha basiti:

film_list.each { |film| puts film }

# Ne kadar kısa değil mi! Bununla ilgili açıklamamız gereken çok şey var. Dizimizde nokta operatörünü (.) kullanarak each metodunu çağırdık. Bu metodun yaptığı şey, dizimizdeki her bir elemanı 'Bob'dan başlayarak sırayla döngüye sokmaktır. Daha sonra blok içindeki kodu çalıştırmaya başlar. Bloğun başlangıç ve bitiş noktaları küme parantezleri {} ile tanımlanır. Dizi üzerinde her yineleme yaptığımızda, elemanın değerini bir değişkene atamamız gerekir. Bu örnekte değişkenin adını verdik ve iki boru | arasına yerleştirdik. Bundan sonra, mevcut dizi elemanını temsil eden değişken üzerinde işlem yapmak için kullanmak istediğimiz mantığı yazıyoruz. Bu durumda basitçe puts kullanarak ekrana yazdırıyoruz.

# Bir blok, yürütülmeye hazır bazı kod satırlarından ibarettir. Bloklarla çalışırken dikkat etmeniz gereken iki stil vardır. Geleneksel olarak, her şey tek bir satıra sığdırılabildiğinde küme parantezlerini ({}) kullanırız. Çok satırlı işlemler gerçekleştirirken do ve end kelimelerini kullanırız. Bu do/end olayını denemek için önceki programımıza bazı işlevler ekleyelim.

film_list.each_with_index do |film, index|
  puts "#{index + 1} #{film}"
end

# Her ismin önüne bir sayı eklemek için x sayacını ekledik ve numaralandırılmış bir liste çıktısı oluşturduk. Her yinelemede x sayısı artar. Sözdizimindeki bu küçük farklılıkları ezberlemek, bir Ruby programcısının geçmesi gereken gerekli görevlerden biridir. Ruby çok etkileyici bir dildir. Bunu mümkün kılan şeylerden biri de işleri birden fazla şekilde yapabilme yeteneğidir. Ruby'de başka birçok yineleyici metodu vardır ve zamanla bunların çoğunu kullanacaksınız. Şimdilik, çoğu Ruby'cinin bir eleman koleksiyonu üzerinde döngü yapmak için each metodu gibi yineleyicileri kullanmayı tercih ettiğini bilin.


# Recursion
# Özyineleme Ruby'de döngü oluşturmanın başka bir yoludur. Özyineleme, bir metodu kendi içinde çağırma eylemidir. Bu muhtemelen kafa karıştırıcı geliyor, bu yüzden daha iyi bir fikir edinmek için bazı gerçek kodlara bakalım.

# Diyelim ki bir sayının iki katının ne olduğunu bilmek istediniz, sonra bu sayının iki katını, vb. Diyelim ki önceden iki katına çıkarılmış sayı 10 veya daha büyük olana kadar sayıyı iki katına çıkarmak istediniz. Aşağıdaki yöntemi oluşturabilirsiniz:

def doubler(start)
  puts start
  if start < 10
    doubler(start * 2)
  end
end

doubler(2)

# Another Example
# Fibonacci dizisindeki n'inci sayıyı hesaplamak için özyinelemeyi kullanan bir yöntem kullanıyoruz. Fibonacci dizisi hakkında daha fazla bilgiyi buradan edinebilirsiniz. Temel olarak, her bir sayının dizideki önceki iki sayının toplamı olduğu bir sayı dizisidir.

def fibonacci(n)
  return n if n <= 1
  fibonacci(n - 1) + fibonacci(n - 2)
end

def generate_fibonacci_series(length)
  series = []
  (0...length).each do |i|
    series << fibonacci(i)
  end
  series
end

puts generate_fibonacci_series(10).inspect


# NOTLAR: each yineleyicisi aksi belirtilmediği müddetçe self dizisini döndürür1

arr = [1, 2, 3, 4, 5]

each_return = arr.each do |i|
  i + 1
end

puts each_return.inspect

# Bir mutasyona ihtiyacınız varsa:

map_return = arr.map do |i|
  i + 1
end

puts map_return.inspect
