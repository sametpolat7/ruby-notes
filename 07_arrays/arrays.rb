# Arrays
# Dizi, herhangi bir türde olabilen öğelerin sıralı bir listesidir. Parantezler arasına aşağıdaki gibi bir eleman listesi yerleştirerek bir dizi tanımlayabilirsiniz:

arr = [1, "Bob", 4.33, "another string"]

# Yukarıdaki dizide string, tamsayı ve float olduğunu fark edeceksiniz. Dizilerin içinde her şey olabilir (başka diziler bile!). Şimdi bu diziyi bir değişkene kaydetmemiz gerekiyor, böylece onunla oynayabiliriz.

# Dizinin ilk elemanını bulmak istiyoruz. Sadece "first" yöntemi kullanabiliriz.
puts arr.first

# Ve dizinin son elemanını. Sadece "last" yöntemi kullanabiliriz.
puts arr.last

# Peki ya üçüncü elemanı bulmak istiyorsak? Diziler, indeksli listeler (indexed list) olarak adlandırdığımız şeydir. Bu, bir dizideki her yuvanın numaralandırıldığı anlamına gelir. Herhangi bir elemana indeks numarasıyla başvurabilirsiniz. Bunu yapmak için sözdizimi, dizi adını parantez [] içinde indeksle birlikte doğrudan takip ederek yazmaktır. Hadi deneyelim.
puts arr[3]

# Yukarıdaki kodun ne döndürmesini beklersiniz? Şaşırdınız değil mi Muhtemelen 4.33 sayısını geri alacağınızı düşündünüz, ancak bunun yerine "another string" aldınız. Bunun nedeni tüm dizi indislerinin 0 sayısı ile başlamasıdır. Yani, 3.sıradaki elemanın indeksi aslında 2dir!



# 1. Modifying Arrays

# Diyelim ki bir diziye bir şey eklemek veya diziden bir şey çıkarmak istediniz. Bu işlemleri gerçekleştirmenize yardımcı olacak birkaç yöntem vardır. Bir dizinin son öğesini kalıcı olarak çıkarmak istiyorsanız, pop yöntemini kullanabilirsiniz.

array_pop = arr.pop

puts array_pop
puts arr.inspect

# Pop yöntemini çağırdığımızda, orijinal dizi değişkeninin değiştirildiğine (yani, bu çağıranı değiştiren bir yöntemdir), ancak döndürülen değerin yukarıdaki ilk satırda gösterildiği gibi poplanan öğe olduğuna dikkat edin. Bu, anlaşılması gereken kritik bir ayrımdır. Bir ifade tarafından döndürülen değer ile ifadenin gerçekte ne yaptığını birbirinden ayırdığınızdan emin olun.


# Diziyi değiştirerek bu öğeyi geri eklemek isterseniz, eklenecek öğe argüman olarak geçirilerek push yöntemini kullanabilirsiniz.
arr.push("Another String")
puts arr.inspect

# Yukarıdakileri yapmanın bir başka yolu da kürek(shovel) operatörü (<<) ile olacaktır.
arr.pop
arr << "Another String"
puts arr.inspect

# Hem push hem de << metotları çağıranı mutasyona uğratır, yani orijinal dizi değiştirilir. 


# Genellikle bir diziniz olur ve dizideki birçok eleman üzerinde aynı şekilde işlem yapmak istersiniz. Ruby bu tür işlemleri yapan birçok metoda sahiptir.

# map yöntemi, bir dizi üzerinde yineleme yaparak dizinin her bir elemanına bir blok uygular ve bu sonuçları içeren yeni bir dizi döndürür. collect yöntemi map için bir takma addır - aynı şeyi yaparlar.
a = [1, 2, 3, 4]

squared_numbers = a.map { |num| num ** 2 }
puts squared_numbers.inspect

cubed_numbers = a.collect { |num| num ** 3 }
puts cubed_numbers.inspect


# Bu yöntemleri uyguladıktan sonra başlangıç dizisinde herhangi bir değişiklik olmadığını fark edeceksiniz. Bu yöntemler yıkıcı değildir (yani, çağıranı değiştirmezler)(Farklı değişkenler kullandık ancak bu yıkıcı olmadıkları gerçeğini değiştirmez). Hangi yöntemlerin çağıranı mutasyona uğrattığını ve hangilerinin uğratmadığını nasıl anlarsınız? Yöntemleri kullanmanız ve irb'deki çıktıya dikkat etmeniz gerekir; yani ezberlemeniz veya kullanarak bilmeniz gerekir.


# Örneğin, dizinizden belirli bir indeksteki değeri silmek istiyorsanız "delete_at" yöntemi yararlı olabilir. Dizinizi yıkıcı bir şekilde değiştirdiği için bu konuda dikkatli olmak isteyeceksiniz. Bu metodu çağırdığınızda, dizinizi kalıcı olarak değiştirmiş olursunuz.
a.delete_at(0)
puts a.inspect

# Bir yan not olarak, bazen silmek istediğiniz değeri bilirsiniz, ancak dizini bilmezsiniz. Bu gibi durumlarda "delete" yöntemini kullanmak isteyebilirsiniz. delete yöntemi, sağlanan değerin tüm örneklerini diziden kalıcı olarak siler.
s1  = "snake"
animals = ["dog", "cat", "snake", "rabbit", "mouse", s1]
animals.delete("snake")

puts animals.inspect

# Bir başka kullanışlı yöntem de "uniq" yöntemidir. Bu yöntem bir dizi içinde yineleme yapar, var olan yinelenen değerleri siler ve sonucu yeni bir dizi olarak döndürür.
numbers = [1, 2, 2, 3, 3, 3, 4, 4, 4, 4, 5, 5, 5, 5, 5]

puts numbers.uniq.inspect
puts numbers.inspect

# Bir kez daha, uniq yönteminin orijinal numbers dizisini değiştirmediğine dikkat edin; yinelenenleri kaldırılmış yeni bir dizi döndürür. Bu yönteme bang suffix (sonekini) (!) eklerseniz, uniq yöntemini yıkıcı olarak gerçekleştirebilirsiniz. Tıpkı delete yönteminin çalışması gibi.
numbers.uniq!
puts numbers.inspect

# Not: uniq ve uniq! Ruby Dizileri için iki farklı metottur. Herhangi bir metodun üzerine basitçe bir ! ekleyip yıkıcı bir işlem elde edemezsiniz! 

# Yöntem adının sonundaki patlama eki (!) genellikle yöntemin çağıran kişiyi kalıcı olarak değiştireceğini (veya mutasyona uğratacağını) gösterir. Ne yazık ki bu durum her zaman geçerli değildir. Bang son ekine sahip herhangi bir metoda karşı dikkatli olmak ve yıkıcı davranıp davranmayacağını görmek için Ruby dokümantasyonunu kontrol ettiğinizden emin olmak iyi bir kuraldır (burada "yıkıcı" kelimesi sadece çağıranı mutasyona uğratmak anlamına gelir). Ayrıca, pop ve push gibi yıkıcı olan ancak sonunda ! olmayan metotlar olduğunu da lütfen unutmayın. Başlangıçta biraz kafa karıştırıcıdır, ancak Ruby'de daha fazla program yazdıkça, hangi metotların yıkıcı olup hangilerinin olmadığını anlamaya başlayacaksınız.



# 2. Iterating Over an Array

# Döngü bölümünde bir dizi üzerinde yineleme yapmak için each'i kullanmaktan bahsetmiştik. Ruby standart kütüphanesi birçok benzer metoda sahiptir. Şimdi select metoduna bir göz atalım. Bu yöntem bir dizi üzerinde yineleme yapar ve sağlanan ifadeye true değerini döndüren tüm öğeleri içeren yeni bir dizi döndürür. Bu bir ağız dolusu laf. Her zaman olduğu gibi, koda bakmak bir sürü kelime kullanmaktan daha faydalıdır.
bigger_than_three = numbers.select { |num| num > 3}
puts bigger_than_three.inspect

# select yöntemi, 3'ten büyük olan tüm sayıları seçer ve bunları bir dizi halinde döndürür. Çağıranı değiştirmez (orijinal sayılar dizisi değiştirilmez).



# 3. Mutating the Caller and Arguments

# Daha önce çağıranın mutasyona uğratılması ve argümanların mutasyona uğratılması hakkında konuştuk ve bununla birlikte örnekler gösterdik. Bu kavram o kadar önemlidir ki daha da derinlemesine ele almak istedik. Bir metodun çağıran veya argüman olarak kullanılan bir nesneyi beklenmedik bir şekilde değiştirmesi mümkün olduğundan bu kavramı akılda tutmak önemlidir. Bu büyük bir kafa karışıklığı kaynağı olabilir, bu nedenle bir yöntemin argümanlarına ve çağıran nesneye ne yaptığını ve bu yöntemin ne döndürdüğünü bilmek önemlidir. Ayrıca bir yöntem kullanma bağlamında yıkıcı yöntemleri tekrar gözden geçirmek istedik. Aşağıdaki iki metoda bakın ve neden ilk metodun argümanı mutasyona uğrattığını ancak ikincisinin uğratmadığını çözüp çözemeyeceğinizi görün.
def mutate(arr)
  arr.pop
end

def not_mutate(arr)
  arr.select { |i| i > 3 }
end

a = [1, 2, 3, 4, 5, 6]
mutate(a)
not_mutate(a)

puts a.inspect

# Son satır 1, 2, 3, 4 ve 5 çıktılarını verecektir. Mutate yöntemi, argümanı üzerinde yıkıcı bir eylem (yani pop) gerçekleştirerek, a yöntemin dışında başlatılmış olsa da a dizisini değiştirir. Bu nedenle, "6" öğesi orijinal diziden çıkarılmıştır. not_mutate yöntemi yıkıcı olmayan bir eylem (yani, select) gerçekleştirmiştir ve bu nedenle orijinal değişken değiştirilmemiştir. mutate içinde, arr.pop öğesinin çağırıcısını mutasyona uğrattığını belirtmek gerekir. Bu da mutate'e aktarılan argümanı mutasyona uğratır. Ancak, not_mutate içinde, arr.select çağırıcısını mutasyona uğratmaz, bu nedenle not_mutate de argümanını mutasyona uğratmaz.



# 4. Nested Array
# Daha önce dizilerin her şeyi içerebileceğinden bahsetmiştik. Ayrıca içinde diziler olan diziler de oluşturabilirsiniz. Diyelim ki bir kum voleybolu turnuvası düzenliyorsunuz ve oynayan tüm takımların kaydını tutmak istiyorsunuz. Bunun gibi bir dizi oluşturabilirsiniz.
teams = [["Selma", "Hüso"], ["Fikret", "Nejla"], ["Göksel", "Tarkan"]]
puts teams[1].inspect



# 5. Comparing Arrays
# == operatörünü kullanarak dizileri değer eşitlik açısından karşılaştırabilirsiniz.
c = [1, 2, 3]
d = [2, 3, 4]

puts c == d # false

d.pop
d.unshift(1)

puts c == d # true

# Ancak unutmamalıdır ki bu sadece değerler açısından bir eşitliktir. İki dizi aynı değildir!
puts c.equal?(d)

# equal? yöntemi, iki nesnenin bellekte tam olarak aynı nesne olup olmadığını kontrol eder. Başka bir deyişle, her iki değişkenin de aynı nesneye başvurup başvurmadığını kontrol eder. c ve d aynı değerlere sahip olsalar bile, farklı bellek konumlarında depolanan farklı nesnelerdir.



# 6. to_s
# to_s metodu bir dizinin string gösterimini oluşturmak için kullanılır. Ancak bir diziyi ekrana yazdırmak için string interpolation kullandığınızda Ruby bunu sahne arkasında yapabilir.
puts "This is array c: #{c}"

# Dizimizi düzgün bir şekilde yazdırmak için Ruby dizimiz üzerinde to_s metodunu çağırıyor ve dizinin içine ekliyor.



# 7. Common Array Methods
# Bu bölüm size Ruby'nin Array sınıfında yerleşik olarak bulunan bazı yaygın metotları tanıtacaktır. Bu örnekleri farklı bir dosyada çoğaltacağız.

# 7.1 include? : include? metodu, verilen argümanın diziye dahil edilip edilmediğini kontrol eder. Sonunda bir soru işareti vardır, bu da genellikle true veya false bir boolean değeri döndürmesini beklemeniz gerektiği anlamına gelir. (Bu tür metotlar "predicates" olarak adlandırılır.) Tıpkı "!" ile biten metotlar gibi, bu da dilin bir özelliği değil, sadece konvansiyonel bir durumdur.
f = [1, 2, 3, 4, 5]
puts f.include?(3)
puts f.include?(6)

# 7.2 flatten : Flatten yöntemi, iç içe diziler içeren bir diziyi alıp tek boyutlu bir dizi oluşturmak için kullanılabilir.
g = [[1, 2], [3, 4], [5, 6]]

puts g.flatten.inspect
puts g.inspect

# flatten metodunun birde "!" suffix'li destructive formu mevcuttur.

# 7.3 each_index : each_index yöntemi, each yöntemine benzer şekilde dizi boyunca yineleme yapar, ancak değişken her bir indeksteki değer yerine indeks numarasını temsil eder. Elemanın indeksini bloğa aktarır ve bununla istediğiniz işlemi yapabilirsiniz. Orijinal dizi döndürülür.
f.each_index { |index| puts "Index #{index}" }

# 7.4 each_with_index : each_index'e benzer şekilde çalışan bir başka kullanışlı yöntem de each_with_index'tir.
f.each_with_index { |value, index| puts "Index: #{index}, Value: #{value}" }

# each_with_index, kod bloğuna iki parametre aktararak hem değeri hem de indeksi manipüle etmemizi sağlar. Bunlardan ilki değer, ikincisi ise indekstir. Daha sonra bunları blok içinde kullanabilirsiniz.

# 7.5 sort : sort yöntemi bir diziyi sıralamak için kullanışlı bir yoldur. Sıralanmış bir dizi döndürür.
h = [9, 6, 1, 2, 7, 6, 3, 5, 8]
puts h.sort.inspect
puts h.inspect

# 7.6 product : İki diziyi ilginç bir şekilde birleştirmek için çarpım yöntemi kullanılabilir. Tüm dizilerdeki tüm öğelerin birleşimi olan bir dizi döndürür.
puts [1, 2, 3].product([4, 5]).inspect

# Kapsamak için çok fazla ilginç yöntem var, ancak size Ruby dizilerinin gücünü ve Ruby ile yerleşik olarak gelen birçok kullanışlı yöntemi tattırmak istedik. Eğer "Dizimin ... yapmasını istiyorum" diye düşünürseniz, muhtemelen bunu zaten yapan bir yöntem vardır. İlk olarak, dokümantasyonu kontrol edin.



# 8. each vs map

# 8.1 each
# each, Ruby'de bir koleksiyon üzerinde yinelemenin basit bir yolunu sağlar ve for döngüsünü kullanmaya tercih edilir. each metodu yinelemeye izin veren nesneler üzerinde çalışır ve genellikle bir blok ile birlikte kullanılır. Bir blok verilirse, each, koleksiyondaki her öğe için bloktaki kodu bir kez çalıştırır ve çağrıldığı koleksiyonu döndürür. Herhangi bir blok verilmezse, bir Enumerator döndürür. Şimdi bazı basit örneklere bakalım:
irb :001 > a = [1, 2, 3]
irb :002 > a.each { |e| puts e }
1
2
3
=> [1, 2, 3]

# Yukarıdaki, her birini kullanmanın en yaygın yolunu göstermektedir. a dizisindeki her bir eleman üzerinde yineleme yapıyor ve yazdırıyoruz. Son olarak [1, 2, 3] döndürür. a'daki elemanları değiştirebilir ve bunları yazdırabiliriz:
irb :003 > a = [1, 2, 3]
irb :004 > a.each { |e| puts e + 2 }
3
4
5
=> [1, 2, 3]

# İşte blok içermeyen son bir örnek; bir Enumerator döndürülür:
irb :009 > a = [1, 2, 3]
irb :010 > a.each
=> #<Enumerator: ...>


# 8.2 map
# map ayrıca yinelemeye izin veren nesneler üzerinde de çalışır. Each gibi, bir blok verildiğinde, koleksiyondaki her öğe için verilen bloğu bir kez çağırır. each'den gerçekten farklı olduğu nokta, "döndürülen değerdir". map, blok tarafından döndürülen değerleri içeren yeni bir dizi oluşturur ve döndürür. Şimdi bunu çalışırken görelim:
irb :011 > a = [1, 2, 3]
irb :012 > a.map { |x| x**2 }
=> [1, 4, 9]

# Bloktaki her bir elemanın karesini alıyoruz ve blok tarafından döndürülen değerleri içeren yeni bir dizi oluşturuyoruz. Son olarak yeni dizi döndürülür. map'in bloğun döndürdüğü değerlerden oluşan yeni bir dizi oluşturduğunu gerçekten incelemek için map ve puts ile bir örnek görelim:
irb :013 > a = [1, 2, 3]
irb :014 > a.map { |x| puts x**2 }
1
4
9
=> [nil, nil, nil]

# puts, blok her çağrıldığında nil döndürdüğünden, yeni oluşturulan döndürülen dizideki değerleri oluşturan nil döndürülür. 

# Son olarak, herhangi bir blok verilmezse, map bir Enumerator döndürür:
irb :015 > a = [1, 2, 3]
irb :016 > a.map
=> #<Enumerator: ...>

# each ve map bilinmesi gereken önemli yöntemlerdir ancak başlangıçta oldukça kafa karıştırıcı olabilir. Bu yöntemleri hatırlamanın başka bir yolu: yineleme için each ve dönüştürme için map kullanın.


# Enumerator Nedir?
# Ruby'de, bir Enumerator, bir koleksiyon üzerinde tembelce yineleme yapmanızı sağlayan bir nesnedir, yani tüm yinelemenin bir kerede gerçekleşmesini gerektirmeden, öğeleri gerektiği gibi teker teker işleyebilirsiniz. Bir blok sağlamadan map gibi bir metodu çağırdığınızda, Ruby işlemi hemen gerçekleştirmek yerine bir Enumerator döndürür.


# Enumerator Nesnesi: Enumerator, bir koleksiyon üzerinde yineleme mantığını kapsülleyen özel bir nesnedir. Yinelemeyi doğrudan yürütmek yerine, Enumerator daha sonra işlemleri gerçekleştirmek veya diğer yöntemleri zincirlemek için kullanılabilir.

# Lazy Iteration: Bu tembel değerlendirme, siz açıkça talep edene kadar bir işlemin yürütülmesini ertelemenize olanak tanır. Bu, büyük veri kümeleriyle uğraşırken veya birden fazla işlemi birbirine zincirlemek istediğinizde yararlı olabilir.


# Bir Enumerator Nesnesi Döndürmenin Amacı Nedir?

# Ertelenmiş Yürütme: Ruby, bir Enumerator döndürerek, uygulanması gereken mantığı (bloğu) sağlamaya hazır olana kadar iterasyonun yürütülmesini ertelemenize izin verir. 

# Metot Zincirleme: Yinelemeyi gerçekten çalıştırmadan önce birden fazla metodu birbirine zincirleyebilirsiniz. Örneğin, önce belirli öğeleri seçebilir ve ardından kalanları eşleyebilirsiniz. 

# Yeniden Kullanılabilirlik: Bir Enumerator birden çok kez yeniden kullanılabilir. Her seferinde farklı bloklar uygulayarak üzerinde istediğiniz kadar yineleme yapabilirsiniz.


# Peki, Ruby bu yeteneği nasıl kazanıyor?
# Ruby'nin bir Enumerator oluşturma yeteneği, yineleme mantığı da dahil olmak üzere her şeyi bir nesne olarak ele alma tasarımının bir sonucudur. Bir Enumerator'ın oluşturulması Ruby tarafından Enumerable modülü ve Enumerator sınıfı aracılığıyla dahili olarak gerçekleştirilir. İşte Ruby'nin bunu nasıl yaptığına daha yakından bir bakış:

# Enumerable Modülü: Enumerable modülü, diziler ve hash'ler gibi koleksiyonları çaprazlama, arama, sıralama ve manipüle etmeye izin veren bir dizi metot sağlar. map, select, each ve diğerleri gibi bu metotların çoğu, herhangi bir blok sağlanmamışsa bir Enumerator döndürebilir. 

# Enumerator Sınıfı: Ruby'deki Enumerator sınıfı, Enumerator nesnelerini oluşturmaktan sorumludur. map gibi bir metodu blok olmadan çağırdığınızda, Ruby dahili olarak Enumerator sınıfını kullanarak yineleme mantığını kapsayan bir Enumerator nesnesi oluşturur.


# Enumerator Oluşturma Süreci Map gibi bir metodu blok olmadan çağırdığınızda, Ruby aşağıdakileri yapar:

# Bloğu Kontrol Eder: Ruby ilk olarak metod çağrısı ile bir blok verilip verilmediğini kontrol eder.

# Eğer bir blok verilmişse, Ruby koleksiyonun her bir elemanı ile bloğu çalıştırır.

# Blok Yoksa Enumerator Oluşturur: Eğer blok verilmemişse, Ruby bir Enumerator nesnesi oluşturmak için Enumerator.new metodunu kullanır. Bu Enumerator nesnesi koleksiyonu ve çağrılan metodu (map gibi) sararak yinelemeyi gerçekleştirmek için gereken mantığı saklar.

# Enumerator'ı döndürür: Yeni oluşturulan Enumerator döndürülür, böylece bloğu daha sonra uygulayabilir veya yinelemeyi gerçekleştirmeden önce diğer metotları zincirleyebilirsiniz.s
