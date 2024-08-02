# Flow Control

# Bir bilgisayar programı birçok yönden verileriniz için bir yolculuk gibidir. Bu yolculuk boyunca veri, üzerinde etkisi olan birçok şeyle karşılaşır ve sonsuza kadar değişir. Her yolculukta olduğu gibi, kişi belirli bir yolu kat etmelidir. Bu yolda pek çok yol vardır. Bazı yollar seçilir, bazıları ise seçilmez. Hangi yolların seçileceği nihai hedefe bağlıdır. Program yazarken, verilerinizin doğru kararlar vermesini istersiniz. Verilerinizin olması gerektiği zaman doğru şeyi yapmasını istersiniz. Bilgisayar programcılığında buna koşullu akış denir. Verilerin doğru şeyi yapmasını nasıl sağlarız? Koşulluları kullanırız.


# Conditionals
# Koşullar, yoldaki bir çataldır (veya birçok çataldır). Verileriniz bir koşula yaklaşır ve koşul daha sonra verilere tanımlanmış bazı parametrelere göre nereye gideceğini söyler. Koşullar, if deyimleri ile karşılaştırma ve mantıksal operatörlerin (<, >, <=, >=, ==, !=, &&, ||) bir kombinasyonu kullanılarak oluşturulur. Bunlar if, else, elsif ve end ayrılmış sözcükleriyle tanımlanan temel mantıksal yapılardır. Elsif'te bir "e" harfi eksik olduğuna dikkat edin. Bu kadar konuşma yeter, kodlama zamanı.

print "Give me a number: "
number = gets.chomp.to_i

if number == 3
  puts "Number is 3, right :)"
elsif number == 4
  puts "Number is 4, right :)"
else
  puts "Number is neither 3, nor 4. You smart ass."
end

# Burada kullanıcının bir sayı girmesine izin vermek için gets kullanıyoruz, chomp kullanıcı veriyi girdiğinde oluşan yeni satırdan kurtuluyor ve to_i bir dizeyi tamsayıya dönüştürmek için çağrılabilen bir yöntem. gets bize her zaman bir dize verdiği için girdiyi bir tamsayıya dönüştürmemiz gerekir.

# Şöyle bir koşul satırı da olabilir:
if number == 3 then puts "Your number is 3." end

# Son olarak, Ruby çok etkileyici bir dil olduğu için, if koşulunu en sona eklemenize de izin verir. Yukarıdaki Örnek 1 şu şekilde yeniden yazılabilir:
puts "Your number is still 3 :)" if number == 3

# Ruby'de ayrıca unless adında ayrılmış bir sözcük vardır. If'in tersi gibi davranır, bu yüzden şu şekilde kullanabilirsiniz:
puts "Your number isnt 3!" unless number == 3

# Ve else ile de kullanılabilir! Ancak elsif ile kullanılamaz :)


# Comparisons
# Daha karmaşık koşullu ifadeler oluşturabilmeniz için bu karşılaştırma operatörlerini biraz daha derinlemesine inceleyelim. Unutulmaması gereken bir şey, karşılaştırma operatörlerinin her zaman bir boolean değeri döndürdüğüdür. Bir boolean değeri ya doğrudur ya da yanlıştır, başka bir şey değildir. Nasıl çalıştıklarını görmek için bunları irb'de de deneyeceğiz.

# Karşılaştırılan değerlere "operand" adı verilir.

# 1. == : "Eşittir" operatörü. Sembolün solundaki herhangi bir şey sağındaki herhangi bir şeye tam olarak eşittir. Bu operatörden daha önce değişkenlerle ilgili bölümümüzde bahsetmiştik, bu yüzden tamamen yabancı gelmemelidir.

puts 5 == 5 # true
puts "abc" == "abc" # true
puts "abc" == "aBc" # false
puts "5" == 5 # false
puts 1 == 1.0000000000000001 # true // Float-Point Precision'dan dolayı

# Dizeleri eşitlik açısından karşılaştırabileceğimize dikkat edin. Eşit olmak için iki dizginin tam olarak aynı değere sahip olması gerekir. Belirli bir değer önemli değildir, sadece her iki dizginin de aynı değere sahip olması yeterlidir. Herhangi bir fark varsa, dizeler eşit değildir. Bu son örneği, iki değerin aynı türe sahip olması gerektiğini veya eşit olmadıklarını hatırlatmak için verdik. Dolayısıyla, '5' dizesi 5 sayısı ile aynı değildir. Bu nedenle karşılaştırma yanlıştır.

# 2. != : "eşit değil" operatorü. Sembolün solundaki herhangi bir şey sağındaki herhangi bir şeye eşit değildir.

puts 4 != 5 # true
puts 4 != 4 # false
puts "4" != 4 # true

# 3. < : "Daha az" sembolü. Sembolün solundaki herhangi bir şey, sembolün sağındaki herhangi bir şeyden daha düşük bir değere sahiptir.

# 4. > : "Daha fazla" sembolü. Sembolün solundaki herhangi bir şey, sembolün sağındaki herhangi bir şeyden daha yüksek bir değere sahiptir.

puts 4 > 3 # true
puts 4 > 5 #f alse
# puts "4" > 5 // `>': comparison of String with 5 failed (ArgumentError)
puts "4" > "5" # false
puts "abc" < "abd" # true

# Ruby'de, >, <, ==, vb. gibi karşılaştırma operatörlerini kullanarak iki dizgiyi karşılaştırdığınızda, karşılaştırma, dizgilerdeki karakterlerin ASCII değerleri tarafından belirlenen leksikografik (sözlük) sıralamaya dayanır.

# İlk karakter karşılaştırması: "abc" 'a' ile başlar "abd" de 'a' ile başlar Her ikisi de aynı karakterle başladığı için karşılaştırma bir sonraki karaktere geçer.

# İkinci karakter karşılaştırması: "abc" 'b' ile başlar "abd" de 'b' ile başlar Bunlar da aynı olduğu için karşılaştırma bir sonraki karaktere geçer.

# Üçüncü karakter karşılaştırması: "abc" 'c' ile başlar "abd" 'd' ile başlar 'c'nin ASCII değeri (99) 'd'nin ASCII değerinden (100) küçüktür.


# Combining Expressions
# Tamam, koşullu akışı iyi bir şekilde kavramaya başladınız. Daha spesifik bir senaryo oluşturmak için birden fazla koşullu ifadeyi bir araya getirmek de mümkündür. Bunu && ve || operatörlerini kullanarak yapabiliriz. Ne anlama geldiklerini görelim.

# 1. && : "and" operatörü. Tüm ifadenin doğru olarak değerlendirilmesi için bu operatörün solundaki ve sağındaki ifadelerin her ikisinin de doğru olması gerekir.

puts (4 == 4) && (5 == 5) # true
puts (4 == 5) && (5 == 5) # false

# 2. || : "or" operatörü. Tüm ifadenin doğru olarak değerlendirilebilmesi için ya soldaki ifadenin doğru olması ya da sağdaki ifadenin doğru olması gerekir.

puts (4 == 4) || (5 == 5) # true
puts (4 == 5) || (5 == 5) # true
puts (4 == 5) || (5 == 6) # false

# ! : "değil" operatörüdür. Bunu bir boolean ifadenin önüne eklediğinizde, o boolean değeri zıttına dönüştürecektir.

puts !(4 == 4)

# Not: Yukarıda olduğu gibi ifadeleri birleştirirken, ifadeleri birlikte gruplamak için parantez kullanmak yararlıdır. Bu, okunabilirlik açısından yararlıdır ve ayrıca bilgisayarın niyetinizi daha doğru anlamasına yardımcı olur. Bilgisayar parantezleri normal cebirsel sırayla değerlendirecektir.

# Ruby birden fazla ifadenin nasıl değerlendirileceğine karar verirken bir öncelik sırası izler. Aşağıda, en yüksek öncelik sırasından (üst) en düşüğe (alt) doğru işlemlerin bir listesi verilmiştir.

# <=, <, >, >= : Karşılaştırma
# ==, != : Eşitlik
# && : Mantıksal AND
# || : Mantıksal OR

x = true
y = true

if x && y || z
  # do something
end

# Önce x && y deyimi çalıştırılacaktır. Bu deyim doğruysa, program bir sonraki satırdaki # do something kodunu çalıştıracaktır. (Çünkü true || whatever = true) x && y deyimi yanlışsa, z değerlendirilecektir. Eğer z doğru ise, bir sonraki satırdaki kod değerlendirilir. Eğer z yanlışsa, kod if deyiminden çıkacaktır.


# Ternary Operators
# Ruby kısa ve öz koşullu if ifadeleri için güzel bir seçeneğe sahiptir. Üçlü operatör, hızlı bir if/else ifadesini kolaylaştıran ve hepsini tek bir satırda tutan yaygın bir Ruby deyimidir.

# Ternary, ? ve : işaretlerinin bir kombinasyonunu kullanır.

puts true ? "True" : "False"
puts false ? "True" : "False"

# Üçlü İfadeyi Ne Zaman Kullanmalıyım?
# Üçlü ifadeler genellikle iki eylem arasında seçim yapmak için değil, 2 değer arasında seçim yapmak için kullanılmalıdır. (Eylem, bir değer yazdırmak veya bir değişkeni yeni bir değere ayarlamak gibi bir şey olabilir). Üçlü ifadenin sonucu neredeyse her zaman bir değişkene atanmalı, bir yönteme argüman olarak aktarılmalı veya bir yöntem tarafından döndürülmelidir. Bunlardan birini yapmıyorsanız, if/else ifadesi daha iyi bir seçimdir.

# Aşağıdaki örnekler bu bağlam için iyi uygulamalar olarak kabul edilir.
begin
foo = hitchhiker ? 42 : 3.1415    # Sonucu bir değişkene ata.
puts(hitchhiker ? 42 : 3.1415)    # Sonucu bir argüman olarak geç.
rescue => e
  puts "Hata verecek, ama önemli değil. Önemli olan örneği görmeniz."
end

# Bunlar ise "bad practice" kabul edilir.
begin
hitchhiker ? (foo = 42) : (bar = 3.1415) # Değişkeni ayarla
hitchhiker ? puts(42) : puts(3.1415)      # Çıktıla
rescue => e
  puts "Hata verecek, ama önemli değil. Önemli olan örneği görmeniz."
end


# Case Statement
# Bahsetmek istediğimiz son koşullu akış yapısı case deyimi olarak adlandırılır. Bir case deyimi if deyimine benzer bir işlevselliğe sahiptir ancak biraz farklı bir arayüze sahiptir. case deyimleri case, when, else ve end ayrılmış sözcüklerini kullanır. Önce bir case tanımlayarak ve ardından case'in değerini ve bu case doğruysa hangi işlemin tamamlanacağını değerlendirerek bir case deyimi oluşturursunuz.

username = "admin"

case username
when "admin"
  puts "welcome Boss!"
when "guest"
  puts "Welcome Guest."
else
  puts "Who are you?"
end

# Bir case deyiminin sonucunu bir değişkene de kaydedebilirsiniz (Ayrıca bir if-else deyimininde!). Yukarıdaki kodu tam da bunu yapacak şekilde yeniden düzenleyelim. Bu şekilde birçok kez puts yazmak zorunda kalmayız.

identity = case username
when "admin"
  "Welcome Boss!"
when "guest"
  "Welcome Guest."
else
  "Who are u?"
end

puts identity


# True-False
#  Ruby'de, false ve nil hariç, akış kontrolünde kullanıldığında her ifade true olarak değerlendirilir.

expressions = [5, 0, "false", nil]

expressions.each do |exp|
  if exp
    puts "#{exp.inspect} is true."
  else
    puts "#{exp.inspect} is false."
  end
end


# Short Curcuit Evaluation
# Kısa devre değerlendirmesi olarak bilinir. Mantıksal && (AND) ve || (OR) operatörlerinin Ruby'de (ve diğer birçok programlama dilinde) nasıl çalıştığının önemli bir yönüdür. Hadi bunu açıklayalım.

# || (Mantıksal VEYA) || işleci:
# Karşılaştığı ilk true değeri döndürür.
# İşlenenlerden hiçbiri true değilse, son işleneni döndürür.
# İlk işlenen trueysa, || ikinci işleneni değerlendirmeden hemen döndürür.
# İlk işlenen false'sa, || ikinci işleneni değerlendirir ve döndürür.

# 3 || "foo" // Return: 3
# "foo" || 3 // Return: "foo"
# nil || "foo" // Return: "foo"

# && (Mantıksal AND) && işleci:
# Karşılaştığı ilk false değeri döndürür.
# Tüm işlenenler trueysa, son işleneni döndürür.
# İlk işlenen false'sa, && ikinci işleneni değerlendirmeden hemen döndürür.
# İlk işlenen trueysa, && ikinci işleneni değerlendirir ve döndürür.

# 3 || "foo" // Return: "foo"
# "foo" || 3 // Return: "3"
# nil || "foo" // Return: nil
