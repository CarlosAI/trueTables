class PreubaClaseJob < ApplicationJob
  queue_as :default

  def perform(id)
	    puts "Entro en PreubaClaseJob"
	    puts "El id es"
	    puts id
	    carro = User.where("id"=>id)
	    if carro.present?
	    	a = 200
	    else
	    	a = 404
	    end
	    hola(12)
  end

  def hola(numero)
  	puts "hola"
  end
end
