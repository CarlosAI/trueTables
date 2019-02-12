class WelcomeController < ApplicationController
  def index
  
  end

  def tabla
	  	if params["authenticity_token"].present?
	  		expresion = params["expresion"]
	  		expresion = expresion.downcase
	  		expresion = expresion.gsub(" ","")
	  		a = expresion.size
	  		parentesis_derecho = Array.new
	  		parentesis_izquierdo = Array.new
	  		letras = Array.new
	  		operadores = Array.new

	  		for i in(0..a-1)
				if expresion[i] == "("
					parentesis_izquierdo << expresion[i]
				elsif expresion[i] == ")"
					parentesis_derecho << expresion[i]
				elsif expresion[i] == "p" || expresion[i] == "q" || expresion[i] == "r" || expresion[i] == "s"
					letras << expresion[i]
				else
					operadores << expresion[i]
				end	
			end
			letras = letras.uniq
			puts "Los operadores son"
			puts operadores
			puts "´´´´´´´´´´´´"

			if parentesis_derecho.size == parentesis_izquierdo.size
				matriz = generar_tabla_basica(letras)
				puts "Aver una posicion"
				puts matriz.keys
				puts "++++++++"
				resultado = transformar_expresion(expresion)
				res = evaluar_expresion(resultado, letras, expresion, matriz)
				@resultado = true
				size = res.values.max_by { |a| a.length }.length
				@m = res.values.map { |a| a += [nil] * (size - a.length) }.transpose.insert(0, res.keys)
				@expresion = expresion
			else
				puts "Error"
				@resultado = false
			end
	  	else
	  		puts "No hay params"
	  		@resultado = "params"
	  	end
  end

  def expresion
	  	if params["authenticity_token"].present?
	  		puts "\n Los params son"
	  		puts params
	  		expresion_p = params["expr_p"]
	  		expresion_q = params["expr_q"]
	  		expresion_r = params["expr_r"]

	  		p_valor = params["p_v"]
	  		q_valor = params["q_v"]
	  		tipo = params["tipo"] if params["tipo"].present?
	  		@exp_f = expresion_r

	  		if tipo.present?
	  			if tipo == "and"
	  				puts "el tipo es"
	  				puts tipo
		  			if p_valor == q_valor
		  				@resultado = p_valor
		  			else
		  				@resultado = "Falso"
		  			end
		  		else
		  			if p_valor == q_valor && p_valor == "Falso"
		  				@resultado = "Falso"
		  			else
		  				@resultado = "Verdadero"
		  			end
		  		end	
	  		else
	  			puts "las frases son"
	  			expresion_p = expresion_p.downcase
	  			expresion_q = expresion_q.downcase
	  			expresion_r = expresion_r.downcase
	  			puts expresion_p
	  			puts "-----"
	  			expresion_nueva = expresion_r.gsub(expresion_p, "")
	  			expresion_nueva = expresion_nueva.gsub(expresion_q, "")
	  			puts "la nueva expresion es:"
	  			puts expresion_nueva 
	  			expresion_nueva = expresion_nueva.gsub(" ","")
	  			if expresion_nueva == "y"
	  				if p_valor == q_valor
		  				@resultado = p_valor
		  			else
		  				@resultado = "Falso"
		  			end
	  			else
	  				if p_valor == q_valor && p_valor == "Falso"
		  				@resultado = "Falso"
		  			else
		  				@resultado = "Verdadero"
		  			end
	  			end
	  		end
	  	else
	  		puts "sin params"
	  	end
  end

  def generar_tabla_basica(params)
	  	puts "SIMON CARNAL"
	  	
	  	numero = params.size
	  	v = {}

	  	if numero == 1
	  		p = [false,true]
	  		v["vector"] = p
	  	elsif numero == 2
	  		p = [false,true,false,true]
	  		q = [false,false,true,true]
	  		v["p"] = q
	  		v["q"] = p
	  	elsif numero == 3
	  		p = [false,true,false,true,false,true,false,true]
	  		q = [false,false,true,true,false,false,true,true]
	  		r = [false,false,false,false,true,true,true,true]
	  		v["p"] = r
	  		v["q"] = q
	  		v["r"] = p
	  	elsif numero == 4
	  		p = [false,true,false,true,false,true,false,true,false,true,false,true,false,true,false,true]
	  		q = [false,false,true,true,false,false,true,true,false,false,true,true,false,false,true,true]
	  		r = [false,false,false,false,true,true,true,true,false,false,false,false,true,true,true,true]
	  		s = [false,false,false,false,false,false,false,false,true,true,true,true,true,true,true,true]
	  		v["p"] = s
	  		v["q"] = r
	  		v["r"] = q
	  		v["s"] = p
	  	else
	  		puts "Mas de 5 letras"
	  	end

	  	#require 'matrix'
	  	#matrix = Matrix.columns([[1, 2, 3, 4], [4, 5, 6, 7]]) 
	  	#matrix = Matrix.columns(v["vector"])
	  	return v 
  end

  def transformar_expresion(expresion)
  		puts "vamos a resolver la exporesion"
  		a = expresion.size
  		pila = Array.new
  		resultado = Array.new
  		for i in(0..a-1)
				if expresion[i] == "("
					pila << expresion[i]
				elsif expresion[i] == "~" 
					temp = pila.pop
					pila << expresion[i]
					pila << temp
				elsif expresion[i] == "^" 
					temp = pila.pop
					pila << expresion[i]
					pila << temp
				elsif expresion[i] == "v" 
					temp = pila.pop
					pila << expresion[i]
					pila << temp
				elsif expresion[i] == "→" 
					temp = pila.pop
					pila << expresion[i]
					pila << temp
				elsif expresion[i] == "↔" 
					temp = pila.pop
					pila << expresion[i]
					pila << temp
				elsif expresion[i] == "p" || expresion[i] == "q" || expresion[i] == "r" || expresion[i] == "s"
					resultado << expresion[i]
				elsif expresion[i] == ")"
					a = true
					until a == false
						temp = pila.pop
						resultado << temp
						if pila.last == "("
							pila.pop
							a = false
						end
					end
				end	
		end
		for i in(0..pila.size-1)
			temp = pila.pop
			resultado << temp
		end
		puts "LA postifija es"
		puts resultado
		return resultado
  end

  def evaluar_expresion(postfija, letras, expresion, matriz)
  		puts "\n Entramos en evaluar_expresion \n"
  		puts postfija
  		puts letras
  		puts expresion
  		puts "\n HAsta aqui fue evaluar expresion \n"
  		size = matriz["p"].size
  		
  		veamos = Array.new
  		resultados = {}
  		for i in(0..size-1)
  			pila = Array.new
	  		pila << "quitar"
	  		#contador = 0
	  		pos = 0
	  		nuevo = nil
	  		until pila.empty?
	  			if pila[0] == "quitar"
	  				pila.pop
	  			end
	  			if postfija[pos] == "p" || postfija[pos] == "q" || postfija[pos] == "r" || postfija[pos] == "s"
	  				pila << postfija[pos]
	  			else
	  				operando = postfija[pos]
		  			if operando == "^"
		  				segundo = pila.pop
	  					primero = pila.pop
			  				res = matriz[primero][i] & matriz[segundo][i]
			  				nuevo = primero +"^" + segundo
			  				if resultados[nuevo].nil?
			  					resultados[nuevo] = []
			  				end
			  				if matriz[nuevo].nil?
			  					matriz[nuevo] = []
			  				end
			  				resultados[nuevo] << res
			  				matriz[nuevo] << res
		  			elsif operando == "v"
		  				segundo = pila.pop
	  					primero = pila.pop
		  				res = matriz[primero][i] | matriz[segundo][i]
		  				nuevo= primero +"v" + segundo
		  				if resultados[nuevo].nil?
		  					resultados[nuevo] = []
		  				end
		  				if matriz[nuevo].nil?
		  					matriz[nuevo] = []
		  				end
		  				matriz[nuevo] << res
		  				resultados[nuevo] << res
		  			elsif operando == "→"
		  				segundo = pila.pop
	  					primero = pila.pop
		  				puts "Entro a la flecha"
		  				nuevo = primero +"→" + segundo
		  				if resultados[nuevo].nil?
			  				resultados[nuevo] = []
		  				end
		  				if matriz[nuevo].nil?
		  					matriz[nuevo] = []
		  				end
		  				if matriz[primero][i] == true && matriz[segundo][i] == false
		  					res = false
			  				resultados[nuevo] << res
			  				matriz[nuevo] << res	
		  				else
		  					res = true
		  					resultados[nuevo] << res
		  					matriz[nuevo] << res	
		  				end
		  			elsif operando == "↔"
		  				segundo = pila.pop
	  					primero = pila.pop
		  				nuevo = primero +"↔" + segundo
		  				if resultados[nuevo].nil?
			  				resultados[nuevo] = []
		  				end
		  				if matriz[nuevo].nil?
		  					matriz[nuevo] = []
		  				end
		  				if matriz[primero][i] == matriz[segundo][i]
		  					res = true
		  					resultados[nuevo] << res
		  					matriz[nuevo] << res
		  				else
		  					res = false
		  					resultados[nuevo] << res
		  					matriz[nuevo] << res
		  				end
		  			elsif operando == "~"
		  				segundo = pila.pop
		  				res = !matriz[segundo][i]
		  				nuevo = "~" + segundo
		  				if resultados[nuevo].nil?
			  				resultados[nuevo] = []
		  				end
		  				if matriz[nuevo].nil?
		  					matriz[nuevo] = []
		  				end
		  				resultados[nuevo] << res
		  				matriz[nuevo] << res
			  		end
			  	end
	  			if pila.empty?
	  				puts "Ya terminamos"
	  			else
	  				if nuevo.present?
	  					pila << nuevo
	  				end
	  			end
	  			pos = pos + 1
	  		end
  		end
  		return matriz
  end

end
