# PROC CLASS

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


# == RUBY DOCUMENTATION ==

# PROC CLASS
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

# 1. CREATION
# Proc oluşturmak için birkaç yöntem vardır:

# 1.1 Proc sınıfı kurucusunu kullanın:
proc1 = Proc.new { |x| x ** 2 }

# 1.2 Proc.new'in kısaltması olarak Kernel#proc yöntemini kullanın:
proc2 = proc { |x| x ** 2 }

# 1.3 Bir kod bloğunun proc argümanına alınması (& işaretine dikkat edin):
def execute(&block)
  block.call
end

execute { puts "Hello World!" }

# 1.4 Kernel#lambda yöntemini kullanarak lambda semantiğine sahip bir proc oluşturun:
lambda1 = lambda { |x| x ** 2 }

# 1.5 Lambda proc literal sözdizimini kullanın (ayrıca lambda semantiğine sahip bir proc oluşturur):
lambda2 = -> (x) { x ** 2 }

# Not: -> ile oluşturulan lambdalar Proc sınıfının nesneleridir ve genellikle fonksiyonel programlama ve davranışı argüman olarak iletmek için kullanılır.
# Örnek: add = ->(a, b) { a + b } iki sayıyı toplayan bir lambda oluşturur.


# 2. LAMBDA AND NON-LAMBDA SEMANTICS
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


# 3. CONVERSION OF OTHER OBJECTS TO PROCS
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


# 4. PROC METHODS

# 4.1 Class Methods
proc3 = Proc.new { puts "Hello World!" }
proc3.call

# Not: Blok olmadan çağrılırsa ArgumentError yükseltir.

# 4.2 Instances Methods

# f << g => composed_proc : f ve g'nin bileşimini temsil eden yeni bir proc (composed_proc) oluşturur. Bileşim, g'nin çıktısının (argümanın iki katına çıkarılması) daha sonra f'ye girdi olarak aktarılması (sonucun karesinin alınması) anlamına gelir.
f = Proc.new { |x| x * x }
g = Proc.new { |x| x + x }

composed_proc = f << g
puts composed_proc.call(4)

# f >> g => composed_proc : f ve g'nin bileşimini temsil eden yeni bir proc (composed_proc) oluşturur. Bileşim, f'nin çıktısının (argümanın karesinin alınması) daha sonra g'ye girdi olarak aktarılması (sonucun iki katına çıkarılması) anlamına gelir.
f1 = Proc.new { |x| x * x }
g1 = Proc.new { |x| x + x }

composed_proc1 = f1 >> g1
puts composed_proc1.call(4)

# arity : Bir proc'un beklediği "zorunlu" argüman sayısı hakkında bilgi verir.
puts proc {}.arity
puts proc {|a|}.arity
puts proc { |a, b| }.arity
puts proc { |*a| }.arity
puts proc { |b, *a| }.arity # -n-1 n: zorunu method

# eql? : İki kod bloğu yalnızca ve yalnızca aynı kod bloğundan oluşuyorsa aynıdır.
proc4 = proc { "Hello" }
proc5 = proc { "Hello" }

puts proc4.eql?(proc5)

# lambda? : Bir Proc nesnesi lambda ise true değerini döndürür. lambda değilse false.
proc6 = lambda { puts "Hello World!" }
proc6.call
puts proc6.lambda?
