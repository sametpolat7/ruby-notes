# VARIABLES

# Değişkenler, bir bilgisayar programında başvurulacak ve manipüle edilecek bilgileri saklamak için kullanılır. Ayrıca verileri açıklayıcı bir isimle etiketlemenin bir yolunu sağlarlar, böylece programlarımız okuyucu ve kendimiz tarafından daha net anlaşılabilir. Değişkenleri bilgi tutan kaplar olarak düşünmek faydalı olacaktır. Tek amaçları verileri etiketlemek ve bellekte saklamaktır. Bu veriler daha sonra programınız boyunca kullanılabilir.

# 1. Değişkenlere Değer Atama
# Değişkenlere isim vermek, bilgisayar programcılığındaki en zor işlerden biri olarak bilinir. Değişkenlere isim verirken, isimler hakkında çok düşünün. Değişkeninize verdiğiniz ismin doğru bir şekilde açıklayıcı ve başka bir okuyucu için anlaşılabilir olduğundan emin olmak için elinizden gelenin en iyisini yapın. Bazen aylar hatta yıllar önce yazdığınız bir programı tekrar gözden geçirdiğinizde bu diğer okuyucu kendiniz olursunuz. Bir değişken atadığınızda = sembolünü kullanırsınız. Değişkenin adı solda, değişkende saklamak istediğiniz değer ise sağda yer alır.

name = "Samet"
puts name

# Şimdi küçük bir şey deneyelim:

# Aşağıdaki irb oturumuna bakın.

# irb :001 > a = 4 => 4
# irb :002 > b = a => 4
# irb :003 > a = 7 => 7

# Bu noktada b'nin değeri nedir? En iyi tahmininizi yapın ve sonra öğrenmek için bu oturumu irb'ye yazın. b'nin değerinin 4 olarak kaldığını, a'nın ise 7 olarak yeniden atandığını fark edeceksiniz. Bu, değişkenlerin bellekteki değerlere işaret ettiğini ve birbirlerine derinlemesine bağlı olmadıklarını gösterir.

# Ruby'de değişkenler nesnelere referanslardır, nesnelerin kendilerine değil. Bir değişken atadığınızda, aslında bellekteki bir nesneye bir referans atamış olursunuz.

a = 10
b = a

a = 20

puts a
puts b

# a = 10 : a değişkenine, 10 nesnesine ait bir referans atanır.
# b = a : b değişkenine, 10 nesnesini işaret eden a ile aynı referans atanır.
# a = 20 : Şimdi, a yeni bir 20 nesnesine yeniden atanır. b hala 10'u referans alır.

# Ancak, Array veya Hash gibi mutable(değiştirilebilir) nesnelerle uğraşırken, nesneyi bir referans aracılığıyla değiştirmek tüm referansları etkiler.

# Ruby'de numbers ve strings immutable(değişmezdir) nesnelerdir. Bir string ya da sayıyı değiştirdiğinizde, mevcut nesneyi değiştirmek yerine yeni bir nesne oluşturulur.

# Ruby'deki array'ler ve hash'ler değişebilirdir, yani içerikleri yeni bir nesne yaratmadan değiştirilebilir. Böylece, bir referans üzerinden yapılan değişiklikler aynı nesneye olan tüm referansları etkiler.

c = [0, 1, 2]
d = c

c << 3
puts d.inspect


# 2. Getting Data from Users
# Kullanıcıdan bilgi almanın bir yolu "gets" yöntemini çağırmaktır. gets "get string" anlamına gelir. Ruby'deki gets metodu standart girdiden (tipik olarak klavye) girdi almak için kullanılır. gets çağrıldığında, kullanıcının bir şey yazmasını ve Enter tuşuna basmasını bekler, sonra bu girdiyi bir string olarak döndürür.

# Basic Usage
# print "Please enter your name: "
# name = gets

# puts "Welcome #{name}!" # "Samet/n"

# Chomping
# print "Please enter your hometown: "
# hometown = gets.chomp

# puts "Really? Im in #{hometown} right now haha."

# Not: gets her zaman bir string döndürür. Başka bir veri türüne ihtiyacınız varsa, bunu dönüştürmeniz gerekir.

# print "Give me a number and i will double it. So what is the number?: "
# number = gets.chomp.to_i

# puts "Number: #{number} & Double: #{number * 2}"


# 3. Variable Scope
# Bir değişkenin kapsamı, bir değişkenin programın neresinde kullanılabileceğini belirler. Bir değişkenin kapsamı, değişkenin ilklendirildiği veya yaratıldığı yer tarafından tanımlanır. Ruby'de, değişken kapsamı bir metot tanımı ya da bir blok tarafından tanımlanır. Değişken kapsamı söz konusu olduğunda farklı davranışlara sahiptirler.

# Method Kapsamı
text = "Hello World!"

def text_creater(new_text)
  text = new_text
  puts text
end

text_creater("Gollllaazooo!")
puts text

# Değişken kapsamı açısından, yöntemler kendi kendine yeten kapsama sahiptir. Bu, yalnızca yöntemin gövdesi içinde ilklendirilen değişkenlere yöntemin gövdesi içinden başvurulabileceği veya bu değişkenlerin değiştirilebileceği anlamına gelir. Ayrıca, bir yöntemin gövdesi içinde başlatılan değişkenler yöntemin gövdesi dışında kullanılamaz.

# Blok Kapsamı
total = 0

[1, 2, 3].each do |number|
  total += number
end

puts total

# Blok kapsamında, bloğun dışında tanımlanan değişkenlere erişilebilir ve bunlar değiştirilebilir. Ancak, blok içinde başlatılan herhangi bir değişkene (number gibi) dış kod tarafından erişilemez.

# Bloklarla ilgili olarak vurgulamak istediğimiz tek kural şudur: İç kapsam, bir dış kapsamda başlatılan değişkenlere erişebilir, ancak bunun tersi geçerli değildir.

# Bu kodu inceleyelim:
j = 5

3.times do |n|
  j = 3
  puts j
end

# Output : 3, 3, 3

# Bunun nedeni, a'nın 3.times do ... end tarafından oluşturulan iç kapsam için kullanılabilir olmasıdır, bu da kodun a'nın değerini yeniden atamasına izin verir. Aslında, onu üç kez 3'e yeniden atamıştır.

# Ancak:

i = 5

3.times do |n|
  i = 3
  k = 7
  puts "i = #{i} & k = #{k}"
end

# puts k Hata verir! Bunun nedeni, k değişkeninin ilklendirildiği bir blok ile yöntem çağrısının dışında kullanılamamasıdır. puts k dediğimizde, bu dış kapsam içinde kullanılamaz.

# NOT: Tüm do...end çiftlerinin bir blok anlamına gelmediğini unutmayın. Özellikle, bir for veya while döngüsündeki do...end bir blok değildir.

# Başka bir deyişle, {} veya do/end ile sınırlandırılmış kodun bir blok olarak kabul edilip edilmediğine (ve dolayısıyla değişkenler için yeni bir kapsam oluşturup oluşturmadığına) karar vermek için temel ayırt edici faktör, {} veya do/end'in hemen bir yöntem çağrısını takip edip etmediğine bakmaktır. Örneğin:


# Types of Variables

# 1. Global Variables
# Global değişkenlere programın herhangi bir yerinden erişilebilir.
$global_variable = "Im accessible from anywhere!"

def a_method
  puts $global_variable
end

a_method

# 2. Instance Variables
# Örnek değişkenler bir sınıfın örneğine özgüdür.
class AClass
  def initialize(name)
    @name = name
  end

  def who_is_owner
    puts "This is #{@name}. And Im the owner!"
  end
end

owner = AClass.new("Samet")
owner.who_is_owner

# 3. Class Variables
# Bir sınıfın tüm örnekleri ve sınıfın kendisi arasında paylaşılır. Örnekler ve sınıf yöntemleri tarafından erişilebilir ve değiştirilebilir.
class BankAccount
  @@total_customers = 0

  def initialize(customer)
    @customer = customer
    @@total_customers += 1
  end

  def welcome_message
    puts "Hello Mr/Mrs #{customer}. Welcome!"
  end

  def self.total_accounts
    @@total_customers
  end
end

customer1 = BankAccount.new("Alice")
customer2 = BankAccount.new("John")

puts BankAccount.total_accounts

# 4. Local Variables
# Yerel değişkenler tanımlandıkları blok, yöntem veya döngü ile sınırlıdır.
def show_local
  local_var = "I can only be accessible from here!"
  puts local_var
end

show_local
# puts local_var Hata fırlatır.

# 5. Constants Variables
# Ruby'de sabitler, program boyunca değişmeden kalması amaçlanan değerleri saklamak için kullanılır.

# 5.1 Global Sabitler: Herhangi bir sınıf veya modül dışında tanımlandığında, sabitlere global olarak erişilebilir.
MAX_CONNECTIONS = 5

# 5.2 Sınıf/Modül Sabitleri: Bir sınıf veya modül içinde tanımlandıklarında, bu kapsam içinde erişilebilirler ve kapsam çözümleme operatörü :: kullanılarak dışarıdan erişilebilirler.
class MathConstant
  PI = 3.141592
end

puts MathConstant::PI
