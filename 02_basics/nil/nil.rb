# NilClass

# Ruby'de NilClass, nil özel nesnesinin sınıfıdır. nil nesnesi "hiçbir şey" veya "değer yok "u temsil etmek için kullanılır. Bu bir singleton'dur, yani Ruby dilinde nil'in sadece bir örneği vardır.

# Bir singleton örneği, yalnızca bir nesnenin oluşturulmasına izin veren bir sınıfın örneğidir. NilClass durumunda, nil bu sınıfın var olabilecek tek örneğidir. Bu, bir Ruby programı boyunca "hiçbir şey "in tek ve tutarlı bir temsili olmasını sağlar.

# METHODS:

# nil? : Boolean döndürür. Diğer tüm nesneler için nil? yöntemi false döndürür.
puts nil.nil?
puts String.new.nil?

# & : Ruby'de, & operatörü tamsayılarla kullanıldığında operandları arasında bitsel AND işlemi gerçekleştirir. Ancak, boolean değerler (doğru ve yanlış) veya diğer tamsayı olmayan nesneler ile kullanıldığında, doğruluklarına göre çalışır.
puts false & true
puts false & Object.new

# | : Nesne nil veya false ise false, değilse true döndürür:
puts false | true
puts false | nil

# =~ : Bir düzenli ifadeyi (Regexp) bir string ile eşleştirmek için kullanılır ve ilk eşleşmenin başlangıç indeksini veya eşleşme bulunamazsa nil döndürür.
# while gets =~ /Samet/
#   puts "You are welcome boss!"
# end

# Bu örnekte,
# gets standart girdiden bir satır okur.
# =~ /re/ satırın "re" alt dizesini içerip içermediğini kontrol eder.
# Satır eşleşirse (=~ doğru bir değer döndürür, tipik olarak eşleşmenin indeksi), döngü yürütülür.
# Satır eşleşmezse (=~ nil döndürür), döngü sonlanır.

puts "Write something... (if you write exit panel will close.)"

# while line = gets
#   if line =~ /exit/
#     puts "Exiting..."
#     break
#   else
#     puts "Echo: #{line}"
#   end
# end

# Diğerleri dönüştürücü olarak hareket ederek "hükümsüzlük (nullity)" kavramını diğer sınıflara taşır:

# "Nullity" kavramı, null olarak kabul edilebilecek veya bazı anlamlı verilerden yoksun bir nesne veya değeri, bir programlama bağlamında daha spesifik veya kullanılabilir bir forma dönüştürme veya temsil etme fikrini ifade eder. Ruby gibi dillerde, bu dönüştürme yöntemleri (rationalize, to_a, to_c, to_h, to_r, to_s, vb.), özellikle null veya boş değerlerle uğraşırken, bir nesnenin yorumlanması veya başka bir türe veya biçime dönüştürülmesi gerekebilecek durumları ele almak için tasarlanmıştır.

# rationalize
puts nil.rationalize

# to_a
puts nil.to_a.inspect

# to_c
puts nil.to_c

# to_h
puts nil.to_h

# to_r
puts nil.to_r

# to_s
puts nil.to_s.inspect
