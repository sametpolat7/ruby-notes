# SYMBOLS

# Ruby'de bir sembol, bir Ruby programı içinde benzersiz bir tanımlayıcı olarak işlev değişmez bir değerdir. Belirli bir ad veya dize için, bu adın bağlamı veya anlamı ne olursa olsun, programın yürütülmesi süresince "aynı" Symbol nesnesi oluşturulacaktır.

# Değişmez: Dizelerin aksine, semboller değişmezdir, yani oluşturulduktan sonra değerleri değiştirilemez. Bu, onları sabit ve benzersiz bir tanımlayıcıya ihtiyaç duyduğunuz durumlar için ideal hale getirir.

# Bellek Verimliliği: Semboller bellekte benzersiz tanımlayıcılar olarak saklandıkları için string'lere göre bellek açısından daha verimlidirler. Kodunuzda bir sembolü birden çok kez kullandığınızda, Ruby'nin onun sadece bir kopyasını saklaması gerekir, oysa bir stringin her geçişi bellekte yeni bir nesne oluşturur.

# Performans: Değişmezlikleri ve bellek verimlilikleri nedeniyle, sembollerin karşılaştırılması ve işlenmesi genellikle dizelerden daha hızlıdır. Bu, büyük veri kümeleriyle çalışırken veya performansa duyarlı algoritmalarda olduğu gibi performansın kritik olduğu durumlarda onları tercih edilen bir seçenek haline getirir.

# Benzersizlik: Bir Ruby programındaki her sembol, o programın bağlamı içinde benzersizdir. Bu, aynı sembolü birden çok kez tanımlarsanız, Ruby'nin bellekte her zaman aynı nesneye başvuracağı anlamına gelir.

# Whats HERE!
# Class: Symbol
# Inherit from class Object  // Method: Symbol.superclass
# Includes module Comparable // Method: Symbol.included_modules

# İşte, bazı Symbol methodları:
sym = :foo

# 1. SYMBOL QUERYING

# ::all_symbols : Ruby'nin sembol tablosunda o anda bulunan tüm sembollerin bir dizisini döndürür.
puts Symbol.all_symbols.size

# =~ : Sembolde verilen bir Regexp veya başka bir nesneyle eşleşen ilk alt dizenin dizinini döndürür; eşleşme bulunamazsa nil döndürür.
puts sym =~ /o/

# [], slice :  Belirli bir dizin, başlangıç/uzunluk veya aralık ya da dize tarafından belirlenen sembolün alt dizesini döndürür.
puts sym[0]
puts sym[0..3]

# empty? self.length sıfır ise true döndürür; aksi takdirde false döndürür.
puts sym.empty?

# encoding : Sembolün kodlamasını temsil eden Encoding nesnesini döndürür.
puts sym.encoding

# start_with? : Sembol verilen dizelerden herhangi biriyle başlıyorsa true döndürür.
puts sym.start_with?("f")

# end_with? : Sembol verilen dizelerden herhangi biriyle bitiyorsa true döndürür.
puts sym.end_with?("o")

# match: Sembol verilen Regexp ile eşleşiyorsa bir MatchData nesnesi döndürür; aksi takdirde nil döndürür.
puts sym.match(/o/)
puts sym.match(/o/).begin(0)

# length & size : Sembol içindeki karakter sayısını döndürür.
puts sym.length

# 2. SYMBOL COMPARING
sym_2 = :bar

# <=> : Belirli bir sembol sembolden küçük, eşit veya büyük olduğu için -1, 0 veya 1 döndürür.
puts sym <=> sym_2

# ==, === : Verilen bir sembol aynı içeriğe ve kodlamaya sahipse true döndürür.
puts sym == sym_2

# casecmp : Case göz ardı edilerek, verilen sembol sembolden küçük, eşit veya büyük olduğu için -1, 0 veya 1 döndürür.
puts sym == sym_2

# 3. SYMBOL CONVERTING
sym_3 = :zoo

# capitalize : Sembolü ilk karakteri büyük, diğer tüm karakterleri küçük olacak şekilde döndürür.
puts sym_3.capitalize

# downcase : Sembolü tüm karakterleri küçültülmüş olarak döndürür.
puts :ZOO.downcase

# inspect : Self'in dize "gösterimini" bir sembol değişmez değeri olarak döndürür.
puts sym_3.inspect

# Not: to_s metodu ile karıştırılmamalıdır:

# Genellikle hata ayıklama amacıyla, baştaki iki nokta üst üste dahil olmak üzere bir sembolün dize gösterimine ihtiyaç duyduğunuzda inspect kullanın.

# Sembolün sadece düz bir dize olarak adına ihtiyacınız olduğunda to_s kullanın.

# name : Sembolün karşılık geldiği dondurulmuş dizeyi döndürür.
puts sym_3.name

# succ, next : Sembolün ardılı olan sembolü döndürür.
puts sym_3.succ
puts sym_3.next

# to_proc : İlk parametresi self olan yöntemi çağıran ve kalan parametreleri yönteme geçiren bir Proc nesnesi döndürür.
puts sym_3.to_proc
