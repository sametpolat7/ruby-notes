# RUBY

# Ruby, basitliği ve üretkenliği ile bilinen yüksek seviyeli, yorumlanmış bir programlama dilidir. Japonya'da Yukihiro "Matz" Matsumoto tarafından 1990'ların ortalarında tasarlanmış ve geliştirilmiştir. Ruby, insan dostu sözdizimini vurgulayarak okumayı ve yazmayı kolaylaştırır ve prosedürel (imperative), nesne yönelimli ve fonksiyonel programlama dahil olmak üzere çoklu programlama paradigmalarını destekler. En çok web geliştirmede, özellikle Ruby on Rails çerçevesi ile kullanımı ile bilinir.

# Ruby'nin bazı temel özellikleri şunlardır:
# Readable Syntax: Ruby'nin sözdizimi okunması ve yazılması kolay olacak şekilde tasarlanmıştır, bu da onu hem yeni başlayanlar hem de deneyimli geliştiriciler arasında popüler kılar.

# Object Oriented: Ruby'deki her şey bir nesnedir, sayılar, dizeler ve hatta sınıfların kendileri de dahil. Bu nesne yönelimli yaklaşım temiz, modüler kod sağlar.

# Dynamic Type: Ruby dinamik olarak yazılır, yani değişken tiplerini açıkça bildirmek zorunda değilsiniz. Bu, kodlamayı daha hızlı hale getirebilir, ancak aynı zamanda türle ilgili hataları yakalamak için dikkatli testler gerektirir.

# Duck Typing: Ruby, bir nesnenin türünün veya sınıfının, tanımladığı methodlardan ve nasıl davrandığından daha az önemli olduğu ördek yazımını kullanır. "Eğer ördek gibi yürüyor ve ördek gibi vaklıyorsa, o bir ördektir."

# Metaprogramming: Ruby, geliştiricilerin çalışma zamanında kendini değiştirebilen kod yazmalarına izin veren güçlü metaprogramlama yeteneklerine sahiptir. Bu, yeni metotlar tanımlamak veya var olanları anında değiştirmek gibi özellikleri mümkün kılar.

# Gems RubyGems, geliştiricilerin kütüphaneleri ve çerçeveleri kolayca dağıtmalarını ve kullanmalarını sağlayan Ruby için bir paket yöneticisidir. Bu gems ekosistemi Ruby'nin işlevselliğini çeşitli amaçlar için genişletmeyi kolaylaştırır.

# Rails: Ruby on Rails, genellikle kısaca Rails olarak adlandırılır, Ruby ile yazılmış popüler bir web uygulama çerçevesidir. Model-View-Controller (MVC) modelini takip eder ve yapılandırma yerine konvansiyonu vurgular, bu da onu web uygulamalarını hızlı ve verimli bir şekilde oluşturmak için çok uygun hale getirir.


# 1. Computer Science and Layer of Abstractions

# Programlama ve genel olarak bilgisayar biliminde soyutlama adı verilen bir kavram vardır. Soyutlama, kullanıcılar olarak "kaputun altında" neler olup bittiğinden çok uzakta olmamızı sağlar. Basit bir örnek bu kavramı açıklamaya yardımcı olacaktır:

# Kullanıcı veya istemci bilgisayarları müzik dinlemek, e-posta göndermek, oyun oynamak ve daha fazlası için kullanır. Düşük seviyeli detaylar hakkında herhangi bir bilgi sahibi olmadan bu görevleri mümkün kılan uygulamalarla etkileşime girerler. Programcılara Ruby gibi bir programlama dilini kullanarak bir soyutlama seviyesi de sunulur; bu dil C ile yazılır, Assembly diline çevrilir, bu da 0'ları ve 1'leri bilgisayarın anlayacağı bir şeye çevirmek için makine diline çevrilir. Yani her programlama dili, kullanımını kolaylaştıran diğer alt seviye kod katmanlarına dayanır. Başka bir soyutlama seviyesi ise Ruby programcılarının Ruby programlama dilini Rails ve Rspec gibi Alana Özel Diller ya da DSL'ler olarak adlandırılan daha yüksek seviyeli dilleri tasarlamak ve oluşturmak için nasıl kullandıklarıdır. Bu DSL'lerin nasıl uygulandığını bilmemiz gerekmez, ancak var olduklarını ve nasıl kullanılacaklarını biliriz.

# Yeni başlayan biri olarak, özellikle programlama ve bilgisayar bilimlerindeki bu soyutlamaların ve bunların programlamayı nasıl basitleştirdiğinin ve bilgisayarların kullanımını nasıl kolaylaştırdığının farkında olmanız gerekir. Örneğin, Ruby'yi anlamadan Rails veya Rspec kodunu okumak genellikle kafa karıştırıcıdır çünkü Rails ve Rspec daha yüksek bir soyutlama seviyesinde çalışan DSL'lerdir.


# 2. Stylish Ruby

# Ruby dili, Ruby kodunu okumayı ve yazmayı herkes için kolaylaştıran belirli stilistik kurallara sahiptir. Bunlar mümkün olduğunca çabuk benimsemeniz gereken şeylerdir, aksi takdirde kodunuz bir başparmak gibi göze çarpacaktır:

# 2.1 Bir methodu, değişkeni veya dosyayı tanımlarken veya başlatırken, her zaman snake_case biçimlendirmesini kullanmalısınız. snake_case biçimlendirmesi, tüm küçük harfler kullanılarak ve sözcükler alt çizgi karakteriyle ayrılarak oluşturulur.

# this_is_file_name.rb

happy_people = []

def this_is_method
  puts 5
end

# 2.2 Ruby programınızda değişmeyecek bir değeri temsil etmek istediğinizde, genellikle sabit olarak adlandırılan bir sabit değişken tanımlarsınız. Ruby'de, sabitler tüm büyük harflerle gösterilir.

FOUR = 4
FIVE = "five"

# 2.3 Do/end blokları ile çalışırken, tüm kod ifadesi tek bir satıra sığdığında { } tercih edin.
[1, 2, 3].each do |i|
  puts i
end

[1, 2, 3].each { |i| puts i }


# 2.4 Bu noktada öğrenmeniz gereken son stil kuralı, bir sınıf adının nasıl bildirileceğidir. Sınıflarınızı adlandırırken, Pascal programlama dilinde kullanılan adlandırma stilini temel alan PascalCase biçimlendirmesini kullanacaksınız (camelCase'den ayırt etmek için sözcük büyük harfle yazılır). PascalCase boşluk kullanmaz ve her kelimeyi büyük harfle yazar. Pascal ortaya çıktığında, şu anda PascalCase olarak bilinen şey daha önce CamelCase veya üst CamelCase olarak biliniyordu, bu nedenle bazı materyallerde bu şekilde adlandırıldığını görebileceğinizi unutmayın.

class PascalCase
  def im_method
    puts "So"
  end
end


# 3. Dokümantasyon Okuma
# Bir programcı olma yolculuğunuza başlarken, geliştirmeniz gereken en önemli alışkanlıklardan biri belgeleri nasıl okuyacağınızı öğrenmektir. Ruby, tüm popüler programlama dilleri gibi, kutudan çıktığı gibi kullanabileceğiniz zengin bir standart kütüphaneler seti ile birlikte gelir. Ancak, kullanabileceğiniz farklı sınıf ve metotlara aşinalık kazanmak için Ruby dokümantasyonunu - ya da Ruby dokümanlarını - incelemeniz gerekecektir. Bazı geliştiricilerin dokümantasyonu API olarak da adlandırdıklarını unutmayın. API, uygulama programlama arayüzünün kısaltmasıdır ve hem uygulamaların birbirleriyle nasıl konuştuğunu hem de dokümantasyonu ifade edebilen biraz fazla yüklenmiş bir terimdir. Unutmayın, eğer birisi "Array API'sine baktınız mı?" derse, Array sınıfı için Ruby dokümantasyonundan bahsediyordur. Ama eğer birisi "FaceBook API nedir?" derse, Facebook'un servislerine programatik arayüzden bahsediyordur.

# Bu bölümde Ruby belgelerinin nasıl okunacağını anlamakla ilgileniyoruz, bu yüzden bir örneğe göz atalım. Aşağıdaki görüntü String sınıfı için resmi Ruby dokümantasyon kaynağından alınmış bir ekran görüntüsüdür.

# https://launchschool.com/books/ruby/read/preparations#readingdocumentation

# Öncelikle sınıf ve modül kavramlarını bir inceleyelim:

# Sınıf: Sınıf, nesneler (instances) oluşturmak için bir plandır. Sınıftan oluşturulan nesnelerin sahip olacağı özellikleri ve davranışları (methodları) tanımlar. Örneğin, String sınıfı string nesneleri için methodlar ve özellikler tanımlar.

# Modül: Modül, method ve sabitlerden oluşan bir koleksiyondur. Yeniden kullanılabilir kodu birden fazla sınıf arasında paylaşmak için kullanılabilir. Modüller sınıflar gibi örnekler oluşturamaz, ancak işlevsellik eklemek için sınıflara karıştırılabilirler. Örneğin, Enumerable modülü, Enumerable içeren herhangi bir sınıfta kullanılabilecek map ve select gibi methodlar sağlar.

# 3.1 Namespacing
# Ruby'deki :: sembolü, öncelikle isim aralığı ve sınıf metotlarını tanımlamak için farklı amaçlara hizmet eder:

# 3.1.1 Namespacing:
# Namespacing, isim çakışmalarını önlemek için sınıfları ve modülleri düzenlemeye ve gruplandırmaya yardımcı olur.

# Örneğin, Encoding::Converter, Encoding modülü içindeki Converter sınıfını ifade eder. Bu farklılaştırma, birden fazla sınıfın aynı ada sahip olabileceği ancak farklı bağlamlarda var olabileceği durumlarda kullanışlıdır.

module MyModule
  class MyClass
    puts "So"
  end
end

# MyModule::MyClass => MyModule modülünde bulunan MyClass sınıfı.

# 3.1.2 Class Methods
# Methodlar bağlamında bir method adının ardından :: sembolünü gördüğünüzde, bu bir sınıf methodunu belirtir. Sınıf methodlari, sınıfın örnekleri yerine "sınıfın kendisi üzerinde çağrılan methodlardır".

class MyClass2
  def self.class_method
    puts "So"
  end
end

# ::class_method => MyClass2 sınıfının class methodu.

# Instance Methods
# Instance Methods, bir sınıf içinde tanımlanan ve o sınıfın örnekleri (nesneleri) üzerinde çağrılabilen methodlardir. Bu methodlar, çağrıldıkları belirli örnek üzerinde çalışır ve instance değişkenlerine ve nesnenin diğer instance methodlarına erişebilir.

class MyClass3
  def self.class_method
    puts "Im class method of MyClass3"
  end
  def instance_method
    puts "Im instance method of MyClass3"
  end
end

a = MyClass3.new

# puts a.class_method  Hata fırlatır. Çünkü class_method'a sadece MyClass3 den erişilebilir. Örneklerinden değil!
puts a.instance_method

# Not: Ruby dokümantasyonuna baktığınızda, instance methodlar genellikle isimlerinin önüne # sembolü eklenerek listelenir. Yani: #something gibi şey görürseniz, bu muhtemelen # sembolünden önce belirtilen sınıfın yada modülün bir "instance methodudur". Bununla birlikte, sınıfın miras aldığı veya içerdiği bir modülün veya üst sınıfın bir instance methodu olabileceğini de belirtmek gerekir.

module MyModule2
  def my_method
    puts "I belong to MyModule2"
  end
  def my_method2
    puts "I belong to MyModule2"
  end
end

class MyClass4
  include MyModule2

  def my_method
    puts "I belong to MyClass4"
  end
end

# Bu durumda, MyClass#my_method doğrudan MyClass içinde tanımlanan bir instance methodu gösterirken, MyModule#my_method MyClass'a dahil olan MyModule modülünde tanımlanan bir instance methodu gösterir.

# Ve şimdi "derin dalış" yapmanın tam zamanı!

# Düşünelim. Yukarıdaki örnekte aynı ada sahip iki method var, my_method. Ancak ben şöyle bir şey yaparsam

variable = MyClass4.new

puts variable.my_method
puts variable.my_method2

# Neden MyModule#my_method çağırılmadı da MyClass4#my_method çağırıldı sizce?

# Çünkü bir nesne üzerinde bir örnek metot çağırdığınızda, Ruby hangi metot uygulamasının çağrılacağını belirlemek için bir method arama yolu (Method Lookup Path) izler.

# İşte method arama yolunun genel sırası:
# 1. Sınıfın kendisi: Ruby ilk olarak nesnenin kendi sınıfı içinde method tanımını arar.

# 2. Dahil edilen modüller: Eğer metot sınıfta bulunamazsa, Ruby daha sonra dahil edilen modüllere bakar. Modüller işlevsellik eklemek için sınıflara dahil edilebilir.

# 3. Üst sınıflar (Kalıtım): Eğer metot hala bulunamazsa, Ruby metodu bulana veya hiyerarşinin tepesine ulaşana kadar üst sınıfları kontrol ederek kalıtım hiyerarşisinde yukarı doğru devam eder.


# Not: MyModule2, MyClass4'a dahil edilmiş olsa da MyModule2'de tanımlanan my_method instance methodu, MyClass4 örnekleri tarafından "otomatik" olarak miras alınmaz. Modüllerdeki methodların bir sınıfın örnekleri tarafından kullanılabilmesi için, modülün methodlarının "açıkça dahil edilmesi"(include) veya "mixin" gerekir.

# Peki modül methodları sınıflara miras bırakabilir dedik. Ancak modüller kalıtıma sahip miydi ki methodlarını miras bırakabilsin?

# Aslında ikisi aynı şeyler değil. Açıklayalım:

# Ruby'de sınıflar tekli kalıtımı (birazdan açıklayacağım) destekler, yani bir sınıf sadece bir üst sınıftan davranış ve nitelikleri kalıtabilir. Bu, sınıf tanımlarında < sembolü kullanılarak elde edilir.

class Vehicle
  def engine
    puts "I have engine!"
  end
end

module VehicleSound
  def sound
    puts "Vroooom Vrooooom!"
  end
end

class Motorcycle < Vehicle
  include VehicleSound
end

suzuki = Motorcycle.new
puts suzuki.engine

# Bu örnekte, Motorcycle sınıfı engine methodunu Vehicle sınıfından miras alır.

# Modüllerde ise kalıtım yoktur ancak "mixin" ya da "module inclusion" adı verilen bir özelliği desteklerler. Bu, bir modülün methodlarının bir sınıfa dahil edilmesine ve bu sınıfa etkili bir şekilde işlevsellik eklenmesine olanak tanır.
puts suzuki.sound

# Inheritance ve Module Inclusion Arasındaki Farklar

# Inheritance, sınıflar arasında bir ebeveyn-çocuk ilişkisi kurarak alt sınıfların üst sınıflarından davranış ve nitelikleri miras almasına olanak tanır.

# Module inclusion, sınıfların modüllerde tanımlanan methodlara erişmesini sağlar, ancak ebeveyn-çocuk ilişkisi kurmaz.
# Modüller birden fazla sınıfa dahil edilebilir, bu da uygulamanızın farklı bölümlerinde kodun yeniden kullanılmasına olanak tanır.

# Özetle:
# Sınıflar tekli kalıtımı destekler ve alt sınıfların üst sınıflarından davranış ve nitelikleri miras almasına izin verir.
# Modüller kalıtımı desteklemez ancak sınıfların modüllerde tanımlanan methodlara erişmesini sağlayan modül dahil etmeye izin verir.
# Kalıtım, sınıflar arasında bir ebeveyn-çocuk ilişkisi kurarken modül dahil etme, kalıtım hiyerarşisi olmadan kodun yeniden kullanılmasına olanak tanır.
# Kalıtım ve modül dahil etme arasındaki farkları anlamak, esnek ve sürdürülebilir Ruby kodu tasarlamak için önemlidir.


# Son olarak "tekli kalıtımı" açıklamaya çalışalım.

=begin

Club
^
|
FootballClub
/         \
GS         FB
|           |
Player      Player

=end

# Ruby'nin tekli kalıtımı desteklediğini söylediğimizde, Ruby'deki her sınıfın sadece bir doğrudan üst sınıfa sahip olabileceğini kastediyoruz. Bu, bir sınıfın birden fazla üst sınıftan miras alabildiği çoklu kalıtımı destekleyen C++ veya Python gibi dillerin tersidir.

# Ruby'nin tek kalıtım modelinde:
# Her sınıfın bir ve yalnızca bir doğrudan üst sınıfı olabilir.
# Bu üst sınıf ilişkisi, daha önce verilen diyagramda gösterildiği gibi doğrusal bir kalıtım zinciri oluşturur.
# Alt sınıflar davranış ve nitelikleri doğrudan üst sınıflarından ve daha sonra miras zincirindeki tüm üst sınıflardan miras alır.

# Özetle GS sadece FootballClup üst sınıfına sahip olabilir. Ayrıca BasketballClup üst sınıfına sahip olamaz.


# 3.2 Methods
# Bir dokümantasyon kuralı olarak, methodlar iki farklı türde genel erişilebilir methodu belirtmek için ya :: ya da # ile listelenir. :: ile gösterilen methodlar sınıf methodları olarak kabul edilirken, # ile gösterilen methodlar örnek methodları olarak kabul edilir.

# Dokümantasyonun ötesinde, bu sembollere takılmayın çünkü Ruby kodunda çalıştırıldıklarında tamamen farklı anlamlara sahiptirler. Örneğin, :: sembolü gerçek Ruby kodunda bir isim alanı olarak kullanılırken, # bir yorum olarak kullanılır. Burada Ruby dokümantasyonundaki kullanımları gerçek koddaki kullanımlarından tamamen farklıdır.

# String sınıfı için Ruby dokümantasyonunun büyük kısmı String'in "Genel Class Metotlarını" ve "Genel Instance Metotlarını" açıklar. Bu metotlardan birine tıkladığınızda, parametrelerini, dönüş değerlerini ve kopyalayıp yapıştırabileceğiniz bazı örnek kodları gösteren sayfadaki kendi bölümüne bağlantı verilecektir.

# Bu dokümantasyondan çıkarılacak en önemli sonuç, Instance Metotlarının "sınıfın herhangi bir örneğine" uygulanabileceğidir. "World wide web" stringine bakabilir ve instance metotları doğrudan ona uygulayabiliriz. Örneğin, method listesi kenar çubuğundan, dizeler için bir #split methodu olduğunu görüyoruz, bu da split'in bir intance method olduğu ve bu methodu herhangi bir dizede doğrudan çağırabileceğimiz anlamına geliyor:

string_var = "Hello World!"
puts string_var.split


# Ruby'de her sınıf bir "ebeveyn"den alt sınıflar oluşturur. Anlaşılması gereken şey, baktığınız sınıfın aynı zamanda üst sınıfta belgelenmiş metotlara -! hem örnek hem de sınıf !- erişimi olduğudur.

# Yani, String sınıfının ebeveyni Object'tir. Bu, bu belgede açıklanan methodlere ek olarak Object'in methodlerinin de string'ler için kullanılabilir olduğu anlamına gelir.
