# Ruby'deki semboller değişmezdir, yani oluşturulduktan sonra değerleri değiştirilemez. Bir sembol oluşturduğunuzda, Ruby aynı sembol nesnesinin program boyunca tekrar kullanılmasını sağlar. Bu, eğer bir sembol :my_symbol oluşturur ve onu birden çok kez kullanırsanız, Ruby'nin her seferinde bellekteki aynı nesneye başvuracağı anlamına gelir.

a = :my_symbol
b = :my_symbol

puts a.object_id == b.object_id

# Ruby'deki tamsayı değerleri değişmezdir ve her zaman aynı değer için aynı nesneye referans vermeleri bakımından sembollere benzer şekilde davranırlar. Bir tamsayı değişkenini diğerine atadığınızda, her iki değişken de aynı nesneye referans verir.

c = 10
d = c

puts c.object_id == d.object_id

# Öte yandan dizeler varsayılan olarak değiştirilebilirdir. Bu, bir string oluşturulduktan sonra içeriğini değiştirebileceğiniz anlamına gelir. Eğer bir string değişkenini diğerine atarsanız, başlangıçta aynı nesneyi referans alacaklardır, fakat Ruby değiştirilen string için yeni bir nesne yaratacağından birini değiştirmek diğerini etkilemeyecektir.

e = "Hello"
f = e

puts e.object_id == f.object_id

e = "World!"
puts e.object_id == f.object_id
