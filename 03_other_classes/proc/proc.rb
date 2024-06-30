# Proc Class

# Ruby'deki Proc sınıfı, bir değişkende saklanabilen ve çalıştırılabilen bir kod bloğunu temsil eder. Bu, kodu kapsüllemenin ve daha sonra aktarılabilen ve çalıştırılabilen bir nesne olarak ele almanın bir yoludur. Bu, yeniden kullanılabilir ve modüler kod oluşturmak için kullanışlıdır.

# 1. Proc Nesnesi Oluşturma
# Proc.new yöntemini veya proc yöntemini kullanarak bir Proc nesnesi oluşturabilirsiniz:

my_proc = Proc.new { puts "Hi! I came from a Proc Object." }
my_proc2 = proc { puts "I also came from another Proc Object." } # Kernel


# 2. Proc Nesnesini Yürütme
# Call yöntemini kullanarak bir Proc nesnesini çalıştırabilirsiniz:

my_proc.call
my_proc2.call


# 3. Argümanları Proc'a Geçirme
# Bir Proc nesnesini çağırdığınızda ona argümanlar iletebilirsiniz:

my_proc3 = Proc.new { |parameter| puts parameter }
my_proc3.call("Hey. Its me!")

my_proc4 = proc { |scalar, *values| values.map { |value| puts value*scalar } }
my_proc4.call(9, 1, 2, 3)


# 4. Proc'u Yöntemlerle Kullanma
# Bir Proc nesnesini bir yönteme aktarabilir ve bu yöntem içinde çağırabilirsiniz:

def my_method(proc_object)
  proc_object.call("Samet")
end

my_proc5 = proc { |name| puts "Hi #{name}!"}
my_method(my_proc5)


# 5. Proc vs Lambda
# Ruby'de Proc nesnelerinin iki ana türü vardır: Proc ve lambda. Davranışlarında bazı farklılıklar vardır:

# 5.1 Argüman Kontrolü:
# Proc: Bağımsız değişken sayısını kesinlikle kontrol etmez. Ekstra bağımsız değişkenler yok sayılır ve eksik bağımsız değişkenler nil ile doldurulur.

# Lambda: Bağımsız değişken sayısını kesin olarak kontrol eder. Bağımsız değişken sayısı yanlışsa hata verir.

my_proc6 = Proc.new { |x, y| puts "#{x}, #{y}" }
my_proc6.call(1)

# my_proc7 = lambda { |x, y| puts "#{x}, #{y}" }
# my_proc7.call(1)

# # 5.2 Return Davranışı:
# Proc: return bir Proc içinde kullanıldığında, çevreleyen yöntemden veya bloktan çıkar.
# Lambda: return bir lambda içinde kullanıldığında, yalnızca lambda'dan çıkar.

def proc_test
  my_proc = Proc.new { return puts "proc_test inside" }
  my_proc.call
  puts "proc_test outside."
end

proc_test

def lambda_test
  my_lambda = lambda { return puts "lambda_test inside" }
  my_lambda.call
  puts "lambda_test outside"
end

lambda_test


# 6. Kullanım Alanları
# Callbacks: Proc'lar genellikle bazı olay veya koşullara yanıt olarak çalıştırılan kod blokları olan geri aramalar olarak kullanılır.

# Fonksiyonel Programlama: Procs, fonksiyonların argüman olarak geçirilmesine ve diğer fonksiyonlardan döndürülmesine olanak tanıyan fonksiyonel programlama teknikleri için gereklidir.

# Closures: Proc'lar çevreleyen kapsamdaki değişkenleri yakalayabilir, bu da onları kapanışlar oluşturmak için kullanışlı hale getirir.

# Numaralandırılabilir Yöntemler: Proc'lar sıklıkla map, select, reject gibi Enumerable metotlarla kullanılır.

numbers = [1, 2, 3, 4, 5]
doubler = Proc.new { |number| number * 2 }
doubled_numbers = numbers.map(&doubler)
puts doubled_numbers.inspect

# Not: Ruby'deki "&" sembolü, bir Proc veya lambda'yı bir bloğa dönüştürmek için kullanılır, bu daha sonra bir blok bekleyen metotlara geçirilebilir. Bu, bir Proc nesneniz olduğunda ve onu Enumerable modülündekiler gibi normalde bir blok alan metotlarla kullanmak istediğinizde kullanışlıdır (örneğin, map, each, select, vb.)


# Peki, methodlar varken neden Proc nesnesine ihtiyaç duyarız? İşte bazı nedenleri:
# Esneklik:
# Proc: Bir metoda kolayca farklı kod parçaları aktarabilir ve metodun kendisini değiştirmeden davranışını değiştirebilirsiniz.
# Yöntem: Davranış sabittir ve metodu değiştirmeden kolayca değiştirilemez.

# Yeniden kullanılabilirlik:
# Proc: Bir Proc'u bir kez oluşturabilir ve birden fazla yerde kullanabilirsiniz.
# Yöntem: Her yöntem belirli bir isme bağlıdır ve kolayca yeniden kullanılamaz.

# Dinamik Davranış:
# Proc: Çalışma zamanında farklı proc'lar geçirerek hangi kodun çalıştırılacağına karar verebilirsiniz.
# Yöntem: Yürütülen kod, metot tanımı sırasında belirlenir ve değişmez.

# Gecikmeli Yürütme:
# Proc: Bir Proc içindeki kod, siz onu açıkça çağırana kadar yürütülmez.
# Yöntem: Yöntem çağrıldığında kod hemen yürütülür.

def execute_proc(my_proc, name = "Samet")
  my_proc.call(name)
end

greet_proc = Proc.new { |name| puts "Hello, #{name}!" }
farewell_proc = Proc.new { |name| puts "GoodBye #{name}!" }

execute_proc(greet_proc)
execute_proc(farewell_proc)


# == RUBY DOCUMENTATION ==

# Proc Class
# Bir Proc nesnesi, yerel bir değişkende saklanabilen, bir metoda veya başka bir Proc'a aktarılabilen ve çağrılabilen bir kod bloğunun kapsüllenmesidir. Proc Ruby'de temel bir kavramdır ve fonksiyonel programlama özelliklerinin çekirdeğidir.

square = Proc.new { |x| puts x ** 2 }
square.call(3)

# Shorthands:
square.(3)
square[3]

# Proc nesneleri closure'lardır, yani oluşturuldukları bağlamın tamamını hatırlar ve kullanabilirler.
def gen_times(factor)
  Proc.new { |n| puts n * factor }
end

times3 = gen_times(3)
times5 = gen_times(5)

puts times3
puts times5

times3.call(12)
times5.call(12)

# 1. Creation
# Proc oluşturmak için birkaç yöntem vardır:

# 1.1 Proc sınıfı kurucusunu kullanın:
proc1 = Proc.new { |x| x ** 2 }

# 1.2 Proc.new'in kısaltması olarak Kernel#proc yöntemini kullanın:
proc2 = proc { |x| x ** 2 }

# 1.3 Bir kod bloğunun proc argümanına alınması (& işaretine dikkat edin):
def make_proc(&block)
  block
end

make_proc { |x| x ** 2 }

# 1.4 Kernel#lambda yöntemini kullanarak lambda semantiğine sahip bir proc oluşturun:
lambda1 = lambda { |x| x ** 2 }

# 1.5 Lambda proc literal sözdizimini kullanın (ayrıca lambda semantiğine sahip bir proc oluşturur):
lambda2 = -> (x) { x ** 2 }

# Not: -> ile oluşturulan lambdalar Proc sınıfının nesneleridir ve genellikle fonksiyonel programlama ve davranışı argüman olarak iletmek için kullanılır.
# Örnek: add = ->(a, b) { a + b } iki sayıyı toplayan bir lambda oluşturur.


# 2. Lambda and non-lambda semantics
# Proc'lar iki çeşittir: lambda ve lambda olmayan (normal proc'lar). Farklılıklar şunlardır:

# Lambda'larda return ve break bu lambda'dan çıkış anlamına gelir;
# Lambda olmayan proc'lerde return, bağalamdaki yöntemden çıkış anlamına gelir (ve yöntemin dışında çağrılırsa LocalJumpError atar);

# Lambdalarda, argümanlar yöntemlerde olduğu gibi ele alınır: katı, yanlış eşleşen argüman numarası için ArgumentError fırlatır.
# Normal proc'lar argümanları daha cömert bir şekilde kabul eder: eksik argümanlar nil ile doldurulur, proc'un birden fazla argümanı varsa tek Array argümanları ayrıştırılır ve fazladan argümanlarda hata oluşmaz.

arr = [[1, 2], [3, 4]]

p = proc { |x, y| x }
l = lambda { |x, y| x }

begin
sample1 = arr.map(&p)
sample2 = arr.map(&l)
rescue ArgumentError => e
  puts e.message
end

puts sample1.inspect
puts sample2.inspect


# 3. Conversion of other objects to procs
# to_proc yöntemini uygulayan herhangi bir nesne & operatörü tarafından bir proc'ye dönüştürülebilir ve iterator'lar tarafından tüketilebilir.

# 3.1 Converting a Symbol to a Proc:
names = ["Alice", "Juan", "Oliver"]

uppercase_names = names.map(&:upcase)
puts uppercase_names.inspect

# 3.2 Converting a Method to a Proc
def multiply_by_two(n)
  n * 2
end

method_to_proc = method(:multiply_by_two).to_proc

result = [1, 2, 3].map(&method_to_proc)
puts result.inspect

# 3.3 Defining Custom to_proc on a Class
class Adder
  def initialize(add)
    @add = add
  end

  def to_proc
    proc { |number| number + @add }
  end
end

adder = Adder.new(5)
result1 = [1, 2, 3].map(&adder)
puts result1.inspect


# 4. Orphaned Procs
# "Öksüz proc", Ruby'de belirli bir bağlamda tanımlanmış ancak daha sonra orijinal bağlamdaki değişkenlerin ve bağların artık mevcut olmadığı farklı bir bağlamda kullanılan bir Proc nesnesini tanımlamak için kullanılan bir terimdir. Bu beklenmedik davranışlara veya hatalara yol açabilir çünkü proc artık var olmayan değişkenlere erişmeye çalışabilir.

# Ruby'de, bir proc oluşturulduğunda, tanımlandığı geçerli kapsamı (yerel değişkenler, sabitler ve metotlar dahil) yakalar. Eğer bu proc'u daha sonra farklı bir kapsamda çağırırsanız, yine de orijinal kapsamındaki değişkenlere erişmeye çalışacaktır. Bu değişkenler mevcut değilse, hatalarla karşılaşabilirsiniz.

def create_proc
  x = 10
  proc { x }
end

my_proc8 = create_proc.call

puts create_proc # Niye call metodu kullandığını anla diye.
puts my_proc8

def another_context
  my_proc8.call
end

begin
  another_context
rescue NameError => e
  puts e.message
end

# Orphaned Proc'lardan Kaçınma
# Öksüz proc'larla ilgili sorunları önlemek için proc'un tanımlandığı bağlamın çağrıldığında hala erişilebilir olmasını sağlayabilirsiniz. İşte birkaç strateji:

class MyClass
  def initialize
    @x = 10
  end

  def my_proc
    proc { @x }
  end
end

obj = MyClass.new
p = obj.my_proc
puts p.call

def deneme
  p.call
end

deneme
