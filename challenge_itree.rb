require 'date'
require 'time_diff'
# gem install time_diff

# Algoritmos
# 1
def salario(horasTrabajadas, salarioHora)
  if horasTrabajadas > 48
    horasExtra = horasTrabajadas - 48
    ((horasTrabajadas - horasExtra) * salarioHora) + (horasExtra * (1.5 * salarioHora))
  else
    horasTrabajadas * salarioHora
  end
end

# 2
def promedioNotas(listaNotas)
  listaNotas.inject(:+) / listaNotas.size
end

# 3
def infoPersonal
  signoZodiacal = { Aries: (Date.strptime('21-03', '%d-%m')..Date.strptime('20-04', '%d-%m')),
                    Tauro: (Date.strptime('21-04', '%d-%m')..Date.strptime('20-05', '%d-%m')),
                    Géminis: (Date.strptime('21-05', '%d-%m')..Date.strptime('20-06', '%d-%m')),
                    Cáncer: (Date.strptime('21-06', '%d-%m')..Date.strptime('20-07', '%d-%m')),
                    Leo: (Date.strptime('21-07', '%d-%m')..Date.strptime('20-08', '%d-%m')),
                    Virgo: (Date.strptime('21-08', '%d-%m')..Date.strptime('20-09', '%d-%m')),
                    Libra: (Date.strptime('21-09', '%d-%m')..Date.strptime('20-10', '%d-%m')),
                    Escorpio: (Date.strptime('21-10', '%d-%m')..Date.strptime('20-11', '%d-%m')),
                    Sagitario: (Date.strptime('21-11', '%d-%m')..Date.strptime('20-12', '%d-%m')),
                    Capricornio: (Date.strptime('21-12', '%d-%m')..Date.strptime('20-01', '%d-%m')),
                    Acuario: (Date.strptime('21-01', '%d-%m')..Date.strptime('20-02', '%d-%m')),
                    Piscis: (Date.strptime('21-02', '%d-%m')..Date.strptime('20-03', '%d-%m')) }

  puts "Ingrese fecha actual"
  fechaActual = Date.parse(gets.chomp)

  puts "Ingrese fecha de nacimiento"
  fechaNacimiento = Date.parse(gets.chomp)

  fechaZodiacal = Date.new(2022,fechaNacimiento.mon,fechaNacimiento.mday)

  edadPersona = Time.diff(fechaActual, fechaNacimiento, '%y, %M, %d')
  puts "Tu edad es #{edadPersona[:diff]}"

  numeroSuerte = fechaNacimiento.year.digits.sum
  while numeroSuerte > 9 do
    numeroSuerte = numeroSuerte - 9
  end

  puts "Tu numero de la suerte es #{numeroSuerte}"

  signoZodiacal.each{ |key, value| puts "Tu signo zodiacal es #{key}" if value.cover?(fechaZodiacal) }
end

# 4
def probabilidad(edad, estadoCivil, cantidadHijos, contratacion, tiempo)
  sumaProbabilidad = 0

  sumaProbabilidad += 5 if cantidadHijos > 2 && tiempo >= 12

  sumaProbabilidad += 15 if estadoCivil == 'casado' && tiempo >= 3

  sumaProbabilidad += 10 if estadoCivil == 'soltero' && tiempo >= 6

  sumaProbabilidad += 30 if edad < 35 && tiempo >= 6

  sumaProbabilidad += 5 if edad > 35 && tiempo >= 6

  sumaProbabilidad += 20 if edad > 35 && tiempo >= 12

  "#{sumaProbabilidad}% probabilidad"
end

# 5
def decisiones(edad, estadoCivil, cantidadHijos, contratacion, tiempo)
  porcentaje = probabilidad(edad, estadoCivil, cantidadHijos, contratacion, tiempo).split(/\W/).first.to_i

  if porcentaje < 20
    puts "El cliente debe ser aprobado, tiene #{edad} años, es #{estadoCivil} y con #{cantidadHijos} hijos, por ello tiene #{porcentaje}% de probabilidad"
  elsif 20 <= porcentaje && porcentaje <= 40
    puts "El cliente debe ser revisado manualmente, tiene #{edad} años, es #{estadoCivil} y con #{cantidadHijos} hijos, por ello tiene #{porcentaje}% de probabilidad"
  else
    puts "El cliente debe ser rechazado, tiene #{edad} años, es #{estadoCivil} y con #{cantidadHijos} hijos, por ello tiene #{porcentaje}% de probabilidad"
  end
end
