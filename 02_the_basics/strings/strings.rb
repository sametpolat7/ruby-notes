# Strings

# String, belirli bir sıradaki karakterlerin bir listesidir. Programlamada, genellikle isimler, mesajlar ve açıklamalar gibi metin verileriyle çalışmak zorunda kalırız. Ruby bu tür verileri temsil etmek için stringleri kullanır. String değişmezlerini metnin her iki tarafında tek tırnak ('merhaba') ya da çift tırnak ("merhaba") ile yazarsınız; tırnakların sözdizimsel bileşenler olduğuna, değerin bir parçası olmadığına dikkat edin. Hem tek hem de çift tırnak biçimleri bir string oluşturur. Ancak, bazı ince farklılıklar vardır.

puts "Hello World from 'Samet'"
puts 'Hello World from \'Samet\''

# Not: Ters eğik çizgi veya kaçış (\) karakteri, bilgisayara kendisini takip eden tırnak işaretlerinin Ruby sözdizimi olarak değil, sadece stringe dahil edilecek basit tırnak karakterleri olarak kullanılacağını söyler.

# Bir diğer husus ise çift tırnaklar ile oluşturulan stringler "enterpolasyona" izin verir.
name = "Samet"
puts "Hello World from #{name}"


# Bir string nesnesi bir bayt dizisini temsil eder. Bu baytlar, insan tarafından okunabilir bir formattaki(text, hexadecimal, ascii etc.) metin veya dosya işleme veya ağ iletişimi gibi çeşitli amaçlar için kullanılan ikili veri dahil olmak üzere çeşitli veri türlerini temsil edebilir.

# Temel fikir, bir dizenin herhangi bir bayt dizisini saklayabilmesidir; bu, herhangi bir karakter kodlamasında (örneğin, UTF-8, ASCII) metni veya herhangi bir türdeki ikili verileri temsil edebileceği anlamına gelir. Bu esneklik, dizeleri programlamada çok yönlü bir veri türü haline getirir ve veri manipülasyonu ve iletişimi içeren çok çeşitli görevleri yerine getirmek için uygundur.

text_string = "Hello World!"
puts "text_string: #{text_string}"

hexa_data = "\x48\x65\x6C\x6C\x6F\x2C\x20\x77\x6F\x72\x6C\x64\x21"
puts "hexa_data: #{hexa_data}"

first_byte = text_string[0].ord
puts "first_byte: #{first_byte}"


# Whats HERE!
# Class: String
# Inherit from class Object  // Method: String.superclasses
# Includes module Comparable // Method: String.included_modules

# İşte, bazı String methodları:

# 1. CREATING A STRING (with class method)
string = String.new("foo")
puts string


# 2. FROZEN/UNFROZEN STRING
# Ruby'de, dondurulmuş bir string, değişmez olarak işaretlenmiş bir string nesnesidir, yani içeriği oluşturulduktan sonra değiştirilemez. Tersine, dondurulmamış bir string değişebilirdir, içeriğinin değiştirilmesine izin verir.

# string1 = "Hello World!".freeze
# string2 = string1 << "from Samet"
# puts string2

# Hata fırlatır!


# 3. STRING QUERYING
string1 = "Hello World!"

# length & size : Karakter sayısını döndürür (bayt değil).
puts string1.length
puts string1.size

# empty? : self.length sıfır ise true, aksi takdirde false döndürür.
puts string1.empty?

# bytesize : Bayt sayısını(her bir karakter) döndürür.
puts string1.bytesize

# count : Verilen dizelerle eşleşen alt dizelerin(karakterlerin) sayısını döndürür.
puts string1.count("H")
puts string1.count("lo")
puts string1.count("a-z")
puts string1.count("^Hello World") # Belirtilen karakterler "dışında"

# =~ : Verilen regexp ile eşleşen ilk alt dizenin Integer indeksini veya eşleşme bulunamazsa nil döndürür.
puts string1 =~ /H/
puts string1 =~ /!/

# index : Verilen bir alt dizenin ilk oluşumunun dizinini döndürür; hiçbiri bulunamazsa nil döndürür.
puts string1.index("H")
puts string1.index("!")

# rindex : Verilen bir alt dizenin son oluşumunun dizinini döndürür; hiçbiri bulunamazsa nil döndürür.
puts string1.rindex("o")

# include? : Dize verilen bir alt dizeyi içeriyorsa true, aksi takdirde false döndürür.
puts string1.include?("!")

# match? : Dize verilen bir Regexp ile eşleşiyorsa true, aksi takdirde false döndürür.
puts string1.match?(/o/)
puts string1.match?("H", 0)

# start_with? : Dize, verilen alt dizelerden herhangi biriyle başlıyorsa true döndürür.
puts string1.start_with?("Hell")
puts string1.start_with?(/h/i)
puts string1.start_with?("Heaven", "Hell")

# end_with? : Dize, verilen alt dizelerden herhangi biriyle bitiyorsa true döndürür.
puts string1.end_with?("d")
puts string1.end_with?("?", "!")

# encoding : Dizenin kodlamasını temsil eden Encoding nesnesini döndürür.
puts string1.encoding
puts "\x57".encoding

# ascii_only? : self yalnızca ASCII karakterleri içeriyorsa true, aksi takdirde false döndürür.
puts "x".ascii_only?
puts "ğ".ascii_only?

# sum : Dize için temel bir sağlama toplamı döndürür: her baytın ascii numarası toplamı.
puts string1.sum

# hash : Bu nesne için bir Integer hash değeri üretir. Bu fonksiyon, a.eql?(b) a.hash == b.hash anlamına gelir özelliğine sahip olmalıdır. Hash değeri, iki nesnenin aynı hash anahtarına başvurup başvurmadığını belirlemek için Hash sınıfı tarafından eql? ile birlikte kullanılır.
puts string1.hash
puts "5".hash == "5".hash
puts "5".hash == 5.hash

# ==, === : Verilen başka bir string, self ile aynı içeriğe sahipse true döndürür.
puts "hello" == "hello"
puts "5" == 5 # false

# Not: Ruby'de, == operatörü tip zorlaması yapmaz, yani karşılaştırmadan önce bir operandın tipini otomatik olarak diğeriyle eşleşecek şekilde dönüştürmez. Bunun yerine, doğrudan iki değer arasındaki eşitliği oldukları gibi kontrol eder.

# eql? : İçerik verilen diğer dizeyle aynıysa(değer ve tip) true döndürür.
puts "5".eql?("5")
puts "5".eql?(5)

# <=> : self ve other_string'i karşılaştırır. (self: soldaki, other_string: sağdaki)
# self daha büyükse 1.
# İkisi eşitse 0.
# other_string daha büyükse -1.
# ikisi karşılaştırılamazsa nil.
puts "b" <=> "a"
puts "a" <=> "a"
puts "a" <=> "b"

# casecmp : Case durumu göz ardı edilerek, verilen başka bir string self'den küçük, eşit veya büyükse -1, 0 veya 1 döndürür.
puts "A".casecmp("a")
puts "B".casecmp("c")
puts "C".casecmp("b")

# casecmp? : Unicode büyük/küçük harf katlamasından sonra self ve other_string eşitse true, değilse false döndürür.
puts "A".casecmp?("a")
puts "ABC".casecmp?("abc")
puts "ABC".casecmp?("abcdef")


# 4. MODIFYING A STRING
# Bu yöntemlerin her biri self'i değiştirir.
string2 = "I am the first form of this string"

# insert : Belirli bir ofsete eklenen belirli bir dize ile self döndürür.
puts string2.insert(-1, "!")

# << : Nesneyi self ile birleştirir ve self döndürür.
puts string2 << ". Whats going on?"

# sub! : Verilen bir kalıpla eşleşen "ilk" alt dizeyi verilen bir değiştirme dizesiyle değiştirir; herhangi bir değişiklik varsa self döndürür, aksi takdirde nil döndürür.
puts string2.sub!(/string/, "text")
puts string2.sub!(/string/, "none")

# gsub! : Verilen bir kalıpla eşleşen "her alt stringi" verilen bir değiştirme dizgesiyle değiştirir; herhangi bir değişiklik varsa self, aksi takdirde nil döndürür.
puts string2.gsub!(/o/, "x")
puts string2.gsub!(/i/i, "i")

# succ! & next! : Kendi ardılı olacak şekilde değiştirilmiş self döndürür. Sondaki karakteri bir sonraki değerli karaktere değiştirir. Son karakterin değeri olabilecek son değerse, basamak sağdan içeriye doğru sırayla kayar.
puts "abc".succ!
puts "azz".next!

# replace : Tüm içeriği verilen bir dizeyle değiştirilmiş self döndürür.
puts string2.replace("stressed")

# reverse! : self öğesini karakterleriyle birlikte ters sırada döndürür.
puts string2.reverse! # desserts

# setbyte : Belirli bir tamsayı ofsetindeki baytı belirli bir değere ayarlar; bağımsız değişkeni döndürür.
puts string2.setbyte(0, 98) # 98
puts string2 #besserts

# tr! : Bir stringde karakter karakter yer değiştirme yapmak için kullanılır.
puts string2.tr!("s", "z") # bezzertz

# tr_s! : tr'ye benzer. Ancak aynı değiştirme karakterine eşlenen karakterlerin ardışık oluşumlarını tek bir karaktere sıkıştırır.
puts string2.tr_s!("z", "v") # bevertv
puts string2.tr_s!("a-g", "x-z")

# capitalize! : İlk karakteri büyük harfle, diğerlerini küçük harfle yazar; değişiklik varsa self, yoksa nil döndürür.
puts string2.capitalize!

# downcase! Tüm karakterleri küçültür; herhangi bir değişiklik varsa self, aksi takdirde nil döndürür.
puts string2.downcase!

# upcase! Tüm karakterleri yukarı harfler; herhangi bir değişiklik varsa self, aksi takdirde nil döndürür.
puts string2.upcase!

# swapcase! Her küçük harf karakterini büyütür ve her büyük harf karakterini küçültür; herhangi bir değişiklik varsa self döndürür, aksi takdirde nil döndürür.
puts string2.swapcase!

# scrub! : Her geçersiz baytı verilen bir karakterle değiştirir; self döndürür.
puts "Whats up? \x81".scrub!("'emoji'")

# force_encoding : Kodlamayı verilen bir kodlamaya değiştirir; self döndürür.
puts string2.encoding # UTF-8
puts string2.force_encoding("ascii")
puts string2.encoding # US-ASCII

# clear : Tüm içeriği kaldırır, böylece self boş olur; self döndürür.
puts string2
puts string2.clear

# slice! : Belirli bir dizin, başlangıç/uzunluk, aralık, regexp veya alt dize tarafından belirlenen bir alt dizeyi kaldırır.
string3 = "Hello World!"

puts string3.slice!(0)
puts string3

puts string3.slice!(0..5)
puts string3

puts string3.insert(0, "Hello W")
puts string3[0]

puts string3.slice!(/H.*d/)
puts string3

# squeeze! : Bitişik yinelenen karakterleri kaldırır; self döndürür.
puts "Goooooooaaaaaaaaallll!".squeeze!
puts "Nooo. Its meeee.".squeeze!("e")
puts "Why               i               have             a lot of         space?".squeeze!(" ")

# delete! : Alt dize bağımsız değişkenlerinin kesişimi tarafından belirlenen karakterleri kaldırır.
puts "Hello World".delete!("l")
puts "Hello World".delete!("lo")
puts "Hello World".delete!("l", "lo")
puts "Hello World".delete!("aeiuo", "^e")

# lstrip! : Baştaki boşlukları kaldırır; değişiklik varsa self, yoksa nil döndürür.
puts "    Hello!".lstrip!

# rstrip! : Sondaki boşlukları kaldırır; değişiklik varsa self, yoksa nil döndürür.
puts "Hello     ".rstrip!

# strip! : Baştaki ve sondaki boşlukları kaldırır; değişiklik varsa self, yoksa nil döndürür.
puts "     Hello     ".strip!

# chomp! : Bulunursa, sondaki kayıt ayırıcısını kaldırır; herhangi bir değişiklik varsa self, aksi takdirde nil döndürür.
puts "Hello".chomp
puts "Hello\n".chomp!

# chop! : Bulunursa sondaki satırsonu karakterlerini kaldırır; aksi takdirde son karakteri kaldırır; herhangi bir değişiklik varsa self, aksi takdirde nil döndürür.
puts "Hello".chop
# puts "Hello\n".chop("\n") Hata fırlatır!


# 5. CONVERTING TO NEW STRING
# Bu yöntemlerin her biri, genellikle self'in değiştirilmiş bir kopyası olan self tabanlı yeni bir String döndürür.
string4 = "Hello"
puts string4.object_id

# * : self öğesinin birden çok kopyasının birleştirilmesini döndürür.
puts "Ho! " * 3

# + : self ve verilen başka bir dizgenin birleşimini döndürür.
puts self # main
puts string4 + self.to_s #Hellomain

# center : Pad alt dizesi arasında ortalanmış bir self kopyası döndürür.
puts string4.center(10)
puts string4.center(11, "-")
puts string4.center(1) # Sadece bir kopya döndürür!

# concat : Self ile verilen diğer dizgelerin birleşimini döndürür.
puts "Hello".concat("foo", "bar", "baz")
puts "Hello".concat(2, "foo", 1, "bar")

# Not: Tamsayı olan her nesne için, değer bir kod noktası olarak kabul edilir ve birleştirme işleminden önce bir karaktere dönüştürülür.

# prepend : Verilen başka bir stringin self ile birleştirilmesini döndürür.
puts "Hello".prepend("prepend ")

# NOT : concat ve prepend Ruby de yıkıcı(destructive) methodlardan birkaçıdır ( <<, replace vb. ). Bu methodlar orjinal stringin değerini de değiştirler!

# ljust : Self stringinin verilen uzunluktaki bir kopyasını, verilen başka bir string ile sağa doldurulmuş olarak döndürür.
puts string4.ljust(20)
puts string4.ljust(20, "ab")

# rjust : Self stringinin verilen uzunluktaki bir kopyasını, verilen başka bir string ile sola doldurulmuş olarak döndürür.
puts string4.rjust(20)
puts string4.rjust(20, "ab")

# b : self öğesinin ASCII-8BIT kodlamasıyla bir kopyasını döndürür.
puts string4.encoding
puts string4.b.encoding

# scrub : Her geçersiz bayt verilen bir karakterle değiştirilmiş self kopyasını döndürür.
puts string4 + "\x81".scrub("?")

# unicode_normalize : Her karakter Unicode normalleştirmesi yapılmış bir self kopyası döndürür.
puts "a\u0300".unicode_normalize

# sub : Belirli bir desenle eşleşen ilk alt dizenin belirli bir değiştirme dizesiyle değiştirildiği self kopyasını döndürür.
puts "Fuzzy Wuzzy was a bear.".sub(/uzzy/, "endhi")

# gsub : Belirli bir kalıpla eşleşen her alt dizgenin belirli bir değiştirme dizgesiyle değiştirildiği self kopyasını döndürür.
puts "Fuzzy Wuzzy was a bear.".gsub(/uzzy/, "endhi")

# succ & next : self öğesinin ardılı olan dizgeyi döndürür.
puts "alice".succ
puts "aliz".next

# reverse : Karakterleri ters sırada olan bir self kopyası döndürür.
puts "arabam".reverse

# tr: Belirtilen karakterlerin belirtilen değiştirme karakterleriyle değiştirildiği bir self kopyası döndürür.
puts "Fuzzy Wuzzy was a bear".tr("aeiou", "*")

# Not: tr, gsub ve replace methodlarının birbirlerine benzediğini düşünmüş olabilirsin. Ancak önemli farklılıkları da vardır. Şöyle ki;

# tr vs. gsub:
# tr öncelikle "karakter" düzeyinde çeviri için kullanılır.
# gsub, "düzenli ifadeleri destekleyen(regex)" kalıp tabanlı global ikame için kullanılır.

# gsub vs. replace:
# gsub, bir kalıba dayalı olarak global yer değiştirme gerçekleştirirken replace, dizenin tüm içeriğini başka bir dizenin içeriğiyle değiştirir.
# gsub yıkıcı değildir ve yeni bir dize döndürürken, replace "orijinal dize nesnesini yıkıcı" olarak değiştirir.

# Özetle: tr karakter düzeyinde çeviri için, gsub kalıp tabanlı global ikame için ve replace bir dizenin tüm içeriğini başka bir dizeyle değiştirmek içindir. Her yöntem farklı bir amaca hizmet eder ve eldeki görevin özel gereksinimlerine göre seçilmelidir.

# tr_s: Değiştirilen alt dizelerdeki yinelemeleri kaldırarak, belirtilen karakterleri belirtilen değiştirme karakterleriyle değiştirilmiş bir self kopyası döndürür.
puts "Fuzzy Wuzzy was a bear".tr_s("z", "t")

# %: Verilen bir nesnenin self biçimine dönüştürülmesinden elde edilen dizeyi döndürür. Ruby'de, "yüzde işareti" veya "yüzde değişmezi" olarak da bilinen % operatörü, belirli tanımlayıcılar veya sınırlayıcılarla birlikte kullanıldığında % operatörü, geleneksel tırnak işaretlerini kullanmadan farklı biçimlerde dizeler oluşturmanıza olanak tanır. Dinamik içerik için yer tutucular içeren dizeleri temsil etmek için kısa ve öz bir yol sağlar.
name = "Alice"
age = 25
puts "Name: %s, Age: %d" % [name, age]
puts "%05d" % 123 # 00123
puts "%-05s: %016x" % ["ID", self.object_id] #sola yaslı 5 karakter id stringi ve 16 karakter 16lık format object_id

# capitalize: self öğesinin ilk karakteri büyük, diğer tüm karakterleri küçük olacak şekilde bir kopyasını döndürür.
puts "hello World!".capitalize

# downcase: Tüm karakterleri küçültülmüş bir self kopyası döndürür.
puts "Hello World!".downcase

# upcase: self öğesinin tüm karakterleri üst üste getirilmiş bir kopyasını döndürür.
puts "Hello World!".upcase

# swapcase: Tüm büyük harf karakterleri küçültülmüş ve tüm küçük harf karakterleri büyütülmüş bir self kopyası döndürür.
puts "Hello World!".swapcase

# delete : Self öğesinin seçiciler tarafından belirtilen karakterleri kaldırılmış bir kopyasını döndürür (bkz. Çoklu Karakter Seçiciler):
puts "Hello".delete("aeiou", "^e")
puts "Hello".delete("a-f")

# delete_prefix : self öğesinin, baştaki alt dize öneki kaldırılmış bir kopyasını döndürür:
puts "Hello".delete_prefix("Hel")

# delete_suffix : self öğesinin sondaki alt dize eki kaldırılmış bir kopyasını döndürür:
puts "Hello".delete_suffix("lo")

# lstrip : self öğesinin baştaki boşlukları kaldırılmış bir kopyasını döndürür;
whitespace = "\x00\t\n\f\v\r"
puts (whitespace + "Hello").lstrip

# rstrip : self öğesinin sonundaki boşlukları kaldırılmış bir kopyasını döndürür;
puts ("Hello" + whitespace).rstrip

# strip : self öğesinin başındaki ve sonundaki boşlukları kaldırılmış bir kopyasını döndürür:
puts (whitespace + "Hello" + whitespace).strip

# squeeze : Seçiciler tarafından belirtilen karakterleri "sıkıştırılmış" bir self kopyası döndürür (bkz. Çoklu Karakter Seçiciler). "Sıkıştırılmış", seçilen bir karakterin her çok karakterli çalışmasının tek bir karaktere sıkıştırıldığı anlamına gelir; hiçbir argüman verilmediğinde, tüm karakterleri sıkıştırır:
puts "Fuzzy Wuzzy was a bear".squeeze
puts "Hello       World!".squeeze(" ")

# Not: Eğer tüm boşlukları (squeeze tüm boşlukları değil tekrar edenleri kaldırır!) kaldırmak istiyorsanız:
puts "        H   e   l   l   o     !     ".delete(" ")

# chomp: Bulunursa, self öğesinin sondaki kayıt ayırıcısı kaldırılmış bir kopyasını döndürür.
puts "Hello\n".chomp
puts "Hello\r".chomp
puts "Hello\n\r".chomp # "Hello\n" actually
puts "Hello\r\n".chomp

# chop : Son satır karakterleri veya son karakter kaldırılmış self kopyasını döndürür.
puts "abcd".chop
puts "abcd\n".chop

# [] : self öğesinin içeriğinin tamamını, bir kısmını veya hiçbirini değiştirir; new_string döndürür. String Dilimleri bölümüne bakınız.
s = "foo"
s[2] = "rtune"
puts s
s[1,5] = "init"
puts s
s[3..4] = "al"
puts s
s[/e$/] = "ly" # ya da s[4, s.length - 1] = "ly"
puts s
s["lly"] = "ncial"
puts s

# slice : Bağımsız değişkenler tarafından belirtilen self alt dizesini kaldırır ve döndürür.
s1 = "Hi guys bro!"
puts s1.slice(0)
puts s1.slice(0..2)
puts s1.slice(/g.*s/)
puts s1.slice("bro!")

# byteslice : Belirli bir dizin, başlangıç/uzunluk veya aralık tarafından belirlenen bir alt dizeyi döndürür.
puts "\x68\x65\x6C\x6C\x6F".byteslice(1, 3)

# chr : self dizesinin İlk karakterini döndürür.
puts "Hello".chr


# 6. CONVERTING TO NON-STRING
# Bu yöntemlerin her biri self öğesinin içeriğini String olmayan bir öğeye dönüştürür.
string5 = "Hello World"

# bytes: self içindeki bayt dizisini döndürür. (utf-8)
puts string5.bytes

# chars : self içindeki karakterlerin bir dizisini döndürür.
puts string5.chars

# codepoints : self içindeki tamsayı sıradanlarının bir dizisini döndürür. (unicode)
puts string5.codepoints

# getbyte : Belirli bir dizin tarafından belirlenen bir tamsayı bayt döndürür.
puts string5.getbyte(1)

# partition: Verilen bir alt dize veya regexp ile eşleşen ilk alt dize tarafından belirlenen 3 öğeli bir dizi döndürür.
puts string5.delete(" ").partition("W")
puts string5.delete(" ").partition(/w/i)
puts string5.delete(" ").partition(/l+/)

# rpartition : Verilen bir substring veya regexp ile eşleşen son substring tarafından belirlenen 3 elemanlı bir dizi döndürür.
puts string5.delete(" ").partition("W")
puts string5.delete(" ").partition(/w/i)
puts string5.delete(" ").partition(/l+/)

# split : Ruby'deki split metodu, bir dizgeyi belirtilen bir sınırlayıcı veya kalıba göre bir dizi alt dizgeye bölmek için kullanılır. Oldukça çok yönlüdür ve çeşitli bölme seçeneklerine izin verir.
puts "apple,banana,orange".split(",")
puts "apple banana orange".split(" ")
puts "twitter1instagram2facebook3".split(/\d/)

puts "one, two, three, four".split(", ", 2)
puts "one, two, three, four".split(", ", 3)
puts "a,,b,c".split(",")
puts "abracadabra".split("ab")

# scan : Bir düzenli ifade (veya bir string) kullanarak bir string içinde arama yapmak ve bulunan tüm eşleşmelerin bir array'ini döndürmek için kullanılır.
puts "Fuzzy Wuzzy was a bear".scan(/\w+/)

# Not : /\w+/ Düzenli ifadenin bu kısmı, bir veya daha fazla sözcük karakterinden oluşan bir diziyle eşleşir.

puts "There are 123 apples and 456 oranges.".scan(/\d+/)
p "Name: Samet, Age: 26; Name: Mauro, Age: 30".scan(/Name: (\w+), Age: (\d+)/)

"Name: Samet, Age: 26; Name: Mauro, Age: 30".scan(/Name: (\w+), Age: (\d+)/) do |name, age|
  puts "Name: #{name}, Age: #{age}"
end

# hex : Onaltılık sayıyı temsil eden bir dizeyi tam sayıya dönüştürmek için kullanılır.
puts "1a".hex
puts "0x1a".hex
puts "A1".hex # same puts "a1".hex
puts "1aZ".hex

# Not: Decimalden Hexadecimale çevirimlerde ise:
puts 255.to_s(16)

# oct : Baştaki karakterlerin sekizli rakamlar olarak yorumlanan tamsayı değerini döndürür.
puts "10".oct
puts "010".oct

# ord : Ruby'deki ord metodu string içindeki bir karakterin tamsayı sıralamasını almak için kullanılır. Çağrıldığı karakterin Unicode kod noktasını döndürür.
puts "h".ord
puts "hello".ord
"Hello World!".each_char { |char| puts char.ord.to_s(2) }

# inspect: Özel karakterler kaçırılarak çift tırnak içine alınmış self kopyasını döndürür.
str = "Hello\nWorld"
puts str
puts str.inspect

# each_byte: self içinde birbirini izleyen her bayt ile verilen bloğu çağırır. Self döndürür.
string6 = "Galatasarayğ"
puts string6.each_byte { |char| puts char }

# each_char : self içinde birbirini izleyen her karakterle birlikte verilen bloğu çağırır.
puts string6.each_char { |char| puts char }

# each_codepoint : self içinde birbirini izleyen her tamsayı kod noktası ile verilen bloğu çağırır.
puts string6.each_codepoint { |char| puts char }

# What is difference between each_byte and each_codepoint
# each_byte yöntemi bir dizenin baytları üzerinde yineleme yapar. Dizeyi bir bayt dizisi olarak ele alır ve her baytı bir tamsayı olarak verir. Bu yöntem, kodlamasından bağımsız olarak bir dizenin ham bayt gösterimiyle çalışmak istediğinizde kullanışlıdır.

# Öte yandan each_codepoint yöntemi, bir dizenin Unicode kod noktaları üzerinde yineleme yapar. Dizenin kodlamasını dikkate alır ve her kod noktasını bir tamsayı olarak verir. Bu yöntem, UTF-8 veya diğer Unicode kodlamalarındaki çok baytlı karakterleri işlemek için gerekli olan Unicode temsillerine dayalı olarak bir dizenin karakterleriyle çalışmak istediğinizde kullanışlıdır.

# each_line : Bir string veya bir IO nesnesindeki her satır üzerinde yineleme yapmak için kullanılır. Girdiyi yeni satır karakterine (\n) göre ayrı satırlara böler ve her satırı işlenmek üzere bloğa verir.
text = "Line 1\nLine 2\nLine 3"
text.each_line { |line| puts line }

# upto : succ'ye yapılan ardışık çağrılar tarafından döndürülen her dize değeriyle birlikte verilen bloğu çağırır.
"a8".upto("b6") { |char| puts char }
"a8".upto("b6", true) { |char| puts char } # Son değeri eklemez.
