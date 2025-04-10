class PagesController < ApplicationController
  def home
  end

  def about
  end

  def contact
  end

  def submit_contact
    # Acá puedes hacer algo con los datos, como imprimirlos en consola:
    puts "Nombre: #{params[:name]}"
    puts "Email: #{params[:email]}"
    puts "Mensaje: #{params[:message]}"

    # Mostrar mensaje de éxito al usuario
    flash[:notice] = "Thank you for your message, we will contact you soon."
    redirect_to contact_path
  end
end
