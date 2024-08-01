# Method Nedir? Neden Kullanılır?
# Genellikle bir programda birçok kez çalıştırılması gereken bir kod parçasına sahip olursunuz. Bu kod parçasını tekrar tekrar yazmak yerine, çoğu programlama dilinde prosedür adı verilen ve ortak kodu tek bir yere çıkarmanızı sağlayan bir özellik vardır. Ruby'de biz buna metot diyoruz. Bir metodu kullanmadan önce, onu "def" ayrılmış kelimesi ile tanımlamalıyız. def'ten sonra metodumuza bir isim veririz. Metot tanımımızın sonunda, metodun tamamlandığını belirtmek için end ayrılmış sözcüğünü kullanırız. Bu, say adlı bir yöntem tanımının örneğidir:

def say(words)
  puts words
end

say("Hello")
say("How r u?")
say("Are u ok?")
say("Fine, good bye!")

# Yöntemin adını yazarak ve argümanları ileterek yöntemi çağırırız (veya çağırırız). Yöntem tanımında say'dan sonra bir (kelimeler) olduğunu fark edeceksiniz. Buna "parametre" denir. Parametreler, bir yöntem tanımının kapsamı dışında veriye sahip olduğunuzda, ancak yöntem tanımı içinde bu veriye erişmeniz gerektiğinde kullanılır. Yöntem tanımının dışarıdaki herhangi bir veriye erişmesi gerekmiyorsa, herhangi bir parametre tanımlamanız gerekmez.

# Argümanlar ise, değiştirilmek veya belirli bir sonucu döndürmek için kullanılmak üzere bir metot çağrısına gönderilen bilgi parçalarıdır. Bir yöntemi çağırdığımızda ona argüman "aktarırız". Burada, say yöntem tanımında kullanmak istediğimiz kelimeyi iletmek için bir argüman kullanıyoruz. Bu sözcükleri yöntem tanımına aktardığımızda, bunlar yerel değişken sözcüklere atanır ve bunları yöntem tanımı içinde istediğimiz gibi kullanabiliriz. Yerel değişken sözcüklerinin yöntem tanımı düzeyinde kapsamlandırıldığına dikkat edin; yani, bu yerel değişkene söz konusu yöntem tanımının dışında başvuramazsınız.


# Default Parameters
# Metotları tanımlarken, metot tanımınızı, argüman verilse de verilmese de her zaman çalışacak şekilde yapılandırmak isteyebilirsiniz. Say yöntem tanımımızı yeniden yapılandıralım, böylece çağıran kodun herhangi bir argüman göndermemesi durumunda varsayılan bir parametre atayabiliriz.

def say1(words = "Hello")
  puts words
end

say1()
say1("How r u?")

# say1() metodunun konsola hello. yazdırdığını fark edeceksiniz. Metodumuz herhangi bir argüman olmadan çağrıldığında kullanılan varsayılan bir parametre sağladık.

# NOT: Birçok Ruby'ci metotları çağırırken parantezleri bir stil seçimi olarak bırakacaktır. Örneğin, say() sadece say olarak yeniden yazılabilir. Argümanlarla birlikte, say("hi") yerine sadece say "hi" olabilir. Bu kodun daha akıcı okunmasını sağlar, ancak bazen kafa karıştırıcı olabilir. Ruby okurken bunu aklınızda bulundurun; yerel değişkenler ve metot isimleri arasında deşifre yapmak zor olabilir!


# Local Variable Scope
# Yöntemlerle ilgili bir sonraki konuya geçmeden önce, bir yöntem tanımı içindeki yerel değişken kapsamı kavramını tartışmak için bir dakikanızı ayıralım. Bir yöntem tanımı, normal yürütme akışının dışında kendi kapsamını oluşturur. Bir yöntem tanımı içindeki yerel değişkenlere yöntem tanımının dışından başvurulamamasının nedeni budur. Aynı zamanda bir yöntem tanımı içindeki yerel değişkenlerin yöntem tanımı dışındaki verilere erişememesinin nedeni de budur (veri bir argüman olarak aktarılmadığı sürece).


# Mutating Arguments
# Bazen bir metodu çağırırken, bir veya daha fazla argüman kalıcı olarak değiştirilebilir; yani argümanları mutasyona uğratırız.

# Argümanların değiştirilmesi konusuna daha fazla girmeden önce, daha önce metot parametrelerinin metot tanımı düzeyinde kapsamlandırıldığını ve metot tanımı dışında kullanılamadığını belirttiğimizi hatırlayın.

# Akılda tutulması gereken bir şey de nesneleri mutasyona uğratabileceğimizdir. Ruby'de, nesne mutasyonu, nesnenin kimliğini değiştirmeden bir nesnenin durumunun veya içeriğinin değiştirilmesini ifade eder. Bu kavram, diziler, hashler ve belirli stringler gibi mutasyona uğrayabilen nesnelerle yakından ilişkilidir. Bir nesne mutasyona uğradığında, iç durumu değişir, ancak nesnenin kendisi (referansı) aynı kalır.

# Aradaki farkı görmek zor olsa da, bu değişkeni değiştirmekle aynı şey değildir. Ruby'de, bir nesnenin kendisini değiştirmek ile bir referansı yeni bir nesneye yeniden atamak arasındaki farkı anlamak, özellikle metot argümanları ile uğraşırken çok önemlidir. Bu kavram değişebilirlik ve Ruby'nin nesneleri ve referansları nasıl ele aldığı etrafında döner.

# Immutable Nesneler: Sayılar, semboller ve stringler gibi nesneler (açıkça değiştirilmediği sürece) değişmezdir. Bu, bir nesne oluşturulduktan sonra değiştirilemeyeceği anlamına gelir. Eğer değişmez bir nesneyi değiştirmeye çalışırsanız, Ruby onun yerine yeni bir nesne yaratacaktır.

# Mutable Nesneler: Arrayler ve hashler gibi nesneler değişebilirdir, yani oluşturulduktan sonra değiştirilebilirler. Bu nesneleri değiştiren işlemler, değişikliğin gerçekleştiği yöntemin kapsamı dışında görülebilen yan etkilere sahip olabilir.

a = 5

def some_method(number)
  number = 7
end

some_method(a)
puts a  # Output: 5

# Burada, a'ya 5 değeri atanmıştır. some_method(a) çağrıldığında, a'nın değeri yönteme aktarılır ve yöntemin içindeki number, 5 değerinin bir kopyasını alır. number öğesinin 7 olarak yeniden atanması, yöntemin dışındaki a öğesini etkilemez çünkü number, yöntem içinde kapsamı belirlenmiş yeni bir yerel değişkendir.


b = [1, 2, 3]

def mutate(array)
  array.pop
end

p "Before mutate method: #{b}"  # Output: [1, 2, 3]
mutate(b)
p "After mutate method: #{b}"   # Output: [1, 2]

# Burada, b bir arraydir, [1, 2, 3]. mutate(b) çağrıldığında, yöntemin içindeki dizi, b'nin işaret ettiği aynı dizi nesnesine bir referanstır. Pop yöntemi, son öğeyi kaldırarak orijinal diziyi değiştirir. Bu değişiklik yöntemin dışına yansıtılır, çünkü dizi ve b aynı nesneyi referans alır.

# Özetle:

# Argüman Geçirme: Bir yönteme bir argüman aktarırken, nesnenin kendisini değil, nesneye bir referans aktarırsınız. Nesne değiştirilebilir ise yöntem nesneyi değiştirebilir, ancak yöntemin içindeki referansı yeniden atamak yöntemin dışındaki orijinal referansı değiştirmez. (Local değişkenin yeniden atanması...)

# Mutasyon Yöntemleri: Pop, push, << (diziler için), << (dizeler için), replace ve diğerleri gibi yöntemler çağrıldıkları nesneyi değiştirebilir. Nesnenin kendisi değişir ve bu değişiklikler nesneye başvurulan her yerde görülebilir.

# Mutasyona Uğramayan Yöntemler: Orijinal nesneyi değiştirmeyen yöntemler (örneğin, dizeler için +, yeniden atama ile concat) orijinal nesneyi değiştirmeden yeni nesneler döndürür.


# NOT: Eğer diğer dillerde programlama deneyiminiz varsa ve Ruby'nin pass-by-value mu yoksa pass-by-reference bir dil mi olduğunu merak ediyorsanız, cevap sizi hayal kırıklığına uğratabilir. Bir bakıma, Ruby her ikisidir!

# Ruby'de bir metoda bir argüman aktardığınızda, aktarılan şey gerçek nesnenin kendisi değil, nesneye bir referanstır. Bu referans aslında nesneyi işaret eden bir değerdir, nesnenin bellek adresi olarak düşünülebilir. Metot bu referansı nesneyi değiştirmek için kullanabilirken (örneğin, bir dizinin içeriğini değiştirmek), orijinal nesne ile bağlantıyı kesmeden değişkeni yeni bir nesneyi işaret edecek şekilde yeniden atayamaz.

def modify_string(str)
  str << "World!"
end

s = "Hello "
modify_string(s)

puts s # "Hello World!"

# Bu örnekte, str, dizeye " world" ekleyen modify_string'e aktarılır. Değişiklik yöntemin dışına yansıtılır, çünkü yöntemin referans aracılığıyla aynı nesneye erişimi vardır.

def reasign_string(str)
  str = "New"
end

s1 = "Old"
reasign_string(s1)

puts s1 # "Old"

# Bu durumda, reassign_string str referansını yeni bir "New" dizesine işaret edecek şekilde değiştirir, ancak bu yöntemin dışındaki s1'i etkilemez.


# puts vs return
# Artık bir metodun ne olduğunu ve nasıl çalıştığını bildiğinize göre, puts ve return arasındaki farkı tartışabiliriz. Return ile tam olarak tanışmadınız ama bunun nedeni Ruby'de her metodun çalıştırılan son satırın değerlendirilmiş sonucunu döndürmesidir.

def add_three(num)
  result = num + 3
end

returned_value = add_three(4)
puts returned_value

# Burada returned_value değerini add_three metodu tarafından döndürülen değere atıyoruz. Sonra içinde ne olduğunu görmek için returned_value değerini çıktıya yazdırıyoruz. Çıktınız 7 yazdırmalıdır çünkü yöntem çağrısının döndürdüğü değer budur.

# NOT: Ruby metotları, kendisinden önce açık bir return gelmediği sürece HER ZAMAN ifadenin son satırının değerlendirilmiş sonucunu döndürür.

# Bunu test etmek istersek:

def add_four(num)
  return result = num + 4
  puts "Will I be seen?"
end

puts add_four(3)


# Chaining Methods
# Her yöntem çağrısının bir şey döndürdüğünü kesin olarak bildiğimiz için, yöntemleri birbirine zincirleyebiliriz, bu da bize son derece etkileyici ve özlü kod yazma yeteneği verir.

def return_eight(num)
  num + 3
end

return_eight(5).times { puts "I will be written 8 times." }

# Output:
# I will be written 8 times.
# I will be written 8 times.
# I will be written 8 times.
# I will be written 8 times.
# I will be written 8 times.
# I will be written 8 times.
# I will be written 8 times.
# I will be written 8 times.
# => 8

# times yöntemi, çağrıldığı orijinal sayıyı döndürür; bu durumda bu sayı 8'dir. return_eight(5).times { ifadesi "8 kez yazılacağım." } ifadesi 8 olarak değerlendirilir, bu nedenle çıktının son satırında => 8 gösterilir.

# Tamam, orijinal add_three yöntem tanımımıza geri dönelim. Küçük bir değişiklik yapalım:

def return_nil(num)
  puts num + 3
end

# return_nil(5).times { puts "I will be" } // Method (puts'dan dolayı) nil döndüreceği için bu satır hata fırlatır.

# Bunun nedeni, Ruby'de puts metodu konsola metin çıktısı vermek için kullanılır. Açılımı "put string "dir ve genellikle dizeleri, sayıları veya diğer veri tiplerini görüntülemek için kullanılır. puts metodunun her zaman nil döndürmesinin nedeni, birincil amacının içeriği yazdırmak olmasıdır, daha sonra kullanmak için bir değer döndürmek değil. Ruby'de, yan etkiler için tasarlanmış birçok metot (konsola yazdırma gibi) anlamlı bir değer üretmediklerini belirtmek için nil döndürür.


# Method Calls as Arguments
def add(num1, num2)
  num1 + num2
end

def subtract(num1, num2)
  (num1 - num2).abs
end

def multiply(num1, num2)
  result = num1 * num2
end

puts multiply(add(5, 10), subtract(5, 10))

# İç içe metot çağrılarını kullanırken dikkat edilmesi gereken çok önemli bir husus, her türlü karışıklığı önlemek için parantez kullanımıdır. Metot çağrılarının her zaman bir değer döndürdüğünü ve bu metot çağrısını döndürülen değere dayalı olarak başka bir metot çağrısına argüman olarak aktarabileceğimizi gördük. Bu nedenle, tanımlı yöntemlerimizin ne döndürdüğünü bilmek hayati önem taşır, çünkü son tahlilde, aslında diğer yöntem çağrılarına argüman olarak aktarılan şey budur.


# ** CALL STACK
# Tüm programcıların anlaması gereken metotların önemli bir yönü "çağrı yığını" ya da daha sıradan bir deyişle "yığın" kavramıdır. Çağrı yığını Ruby'nin hangi metodun yürütüldüğünü ve geri döndüğünde yürütmenin nerede devam etmesi gerektiğini takip etmesine yardımcı olur. Bunu yapmak için, bir kitap yığını gibi çalışır: eğer bir kitap yığınınız varsa, en üste yeni bir kitap koyabilir veya en üstteki kitabı yığından kaldırabilirsiniz. (Last in, First Out) Aynı şekilde, çağrı yığını da geçerli yöntem hakkındaki bilgileri yığının en üstüne koyar, ardından yöntem geri döndüğünde bu bilgileri kaldırır.

# Not: Ruby'de, metotlar çağrı yığınını kullanan tek şey değildir. Bloklar, proc'lar ve lambda'lar da çağrı yığınını kullanır; aslında, hepsi Ruby'nin metotlar için kullandığı aynı çağrı yığınını kullanır. Basitlik için, çağrı yığınını tartışırken genellikle sadece metotlardan bahsedeceğiz. Ancak, bloklar, proc'lar ve lambda'ların da bu sürecin bir parçası olduğunu her zaman hatırlamalısınız.

def first
  puts "Im First!"
end

def second
  first
  puts "Im Second!"
end

second

# Bu program çalışmaya başladığında, çağrı yığınında başlangıçta programın genel (üst düzey) bölümünü temsil eden bir öğe (yığın çerçevesi (Stack Frame) olarak adlandırılır) bulunur. İlk yığın çerçevesi bazen main (ana) metot olarak adlandırılır. Ruby bu çerçeveyi ana programın o anda hangi kısmı üzerinde çalıştığını takip etmek için kullanır.

# Call Stack
# -
# -
# -
# main

# Program yürütmesi 199. satırdaki metot çağrısına ulaştığında, ilk olarak ana yığın çerçevesini mevcut program konumu ile günceller. Ruby bu konumu daha sonra ikinci metot çalışmayı bitirdiğinde "yürütmenin nerede devam edeceğini belirlemek" için kullanacaktır. Geçerli yığın çerçevesindeki konumu ayarladıktan sonra, Ruby ikinci metot için yeni bir yığın çerçevesi oluşturur ve bunu çağrı yığınının en üstüne yerleştirir: yeni çerçevenin yığına itildiğini (pushed) söyleriz. Çağrı yığınımız şimdi şöyle görünür:

# Call Stack
# -
# -
# second
# main: line 199

# İkinci yöntemin çerçevesinin artık ana çerçevenin üzerine yığıldığına dikkat edin. İkinci çerçeve hala yığının üzerindeyken, main onun altında sıkışmış ve erişilemez durumda kalır. Aynı zamanda, main metodu hareketsiz hale gelir ve ikinci metot aktif hale gelir. İkinci metot 195. satırda birinci metodu çağırır. Bu eylem Ruby'nin ikinci çerçeveyi güncellemesine neden olur, böylece Ruby daha sonra yürütmeyi nerede devam ettireceğini bilir. Daha sonra ilk metot için yeni bir yığın çerçevesi oluşturur ve onu çağrı yığınına iter.

# Call Stack
# -
# first
# second: line 195
# main: line 199

# İlk metot çalışmaya başladığında puts metodunu çağırır. puts gibi yerleşik olanlar da dahil olmak üzere tüm Ruby metotları aynı çağrı yığınını paylaşırlar. Bu nedenle, mevcut konumumuzu kaydetmemiz ve sonra yığına yeni bir çerçeve itmemiz gerekir:

# Call Stack
# puts
# first: line 191
# second: line 195
# main: line 199

# Muhtemelen puts'un da birkaç dahili yöntem çağrısı vardır. Ancak, biz bunları görmezden geleceğiz ve puts'un tüm işini herhangi bir ek metot çağrısı olmadan yaptığını varsayacağız. Bunun yerine, sadece ilk metodun mesajını konsola kaydeder, sonra hemen geri döner. puts geri döndüğünde, Ruby çağrı yığınından en üst çerçeveyi kaldırır -- pops --. Bu örnekte puts için olan çerçeve budur. Bu önceki yığın çerçevesini açıkta bırakır. Ruby, yürütmenin nerede devam edeceğini belirlemek için bu çerçeveyi kullanır. Bu durumda, yürütme 191. satırdan hemen sonra devam eder.

# Call Stack
# -
# first: line 191
# second: line 195
# main: line 199

# Sonunda, ilk yöntem geri dönecektir. Bu olduğunda, ilk çerçeve yığından atılır. Bu, ikinci çerçeve için yığıt çerçevesini açığa çıkarır ve bu da Ruby'ye 195. satırda yürütmeye devam etmesi gerektiğini söyler.

# Call Stack
# -
# -
# second: line 195
# main: line 199

# Ardından, yürütme 196. satırdaki puts çağrısına atlar. Daha önce olduğu gibi, geçerli konum kaydedilir ve yığına yeni bir çerçeve itilir:

# Call Stack
# -
# puts
# second: line 196
# main: line 199

# Bu puts çağrısı geri döndüğünde, yığın çerçevesi açılır ve yürütme ikinci aşamaya döner.

# Call Stack
# -
# -
# second: line 196
# main: line 199

# Second yürütmeyi bitirdiğinde, second için yığın çerçevesi çağrı yığınından çıkarılır ve main için yığın çerçevesi açığa çıkar. main çerçevesi Ruby'ye 199. satırda yürütmeye devam etmesini söyler.

# Sonunda, main yönteminin çalıştıracak başka kodu kalmaz. Bu gerçekleştiğinde, ana çerçeve yığından çıkarılır ve program sona erer.

# NOT: Çağrı yığınının Ruby gerçeklemesine göre değişen sınırlı bir boyutu vardır. Bu boyut genellikle 10000'den fazla yığın girdisi için yeterlidir. Yığında yer kalmazsa, bir SystemStackError istisnası görürsünüz.

# NOT 2: puts nil döndürürken p yazdırdığı değeri geri döndürür. p ve puts arasındaki dönüş değerleri farkı, bu metodların Ruby'de nasıl davranmak üzere tasarlandığından kaynaklanır.

# puts: puts yöntemi konsola veri çıktısı vermek için kullanılır. Değeri ve ardından bir satırsonu yazdırır. Ancak, ne yazdırırsa yazdırsın puts'un geri dönüş değeri her zaman nil'dir. Bunun nedeni puts'un anlamlı bir değer döndürmek için değil, öncelikle yan etkisi (konsola çıktı vermek) için kullanılmasıdır.

puts "Hello" # Output: "Hello", => nil

# p: p yöntemi puts yöntemine benzer, ancak bazı önemli farklılıkları vardır. Hata ayıklama amacıyla kullanılır, çünkü yazdırdığı nesne üzerinde inspect yöntemini çağırarak daha ayrıntılı ve geliştirici dostu bir çıktı sağlar. Ayrıca puts'tan farklı olarak p, yazdırdığı değeri geri döndürür.

p "Hello" # Output: "Hello", => "Hello"
