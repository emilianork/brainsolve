class RegistrationsController < Devise::RegistrationsController

	def create

		build_resource(sign_up_params)

    	if resource.save

      		yield resource if block_given?

      		if resource.active_for_authentication?
        		set_flash_message :notice, :signed_up
        		sign_up(resource_name, resource)
        		respond_with resource, :location => after_sign_up_path_for(resource)
      		else
        		set_flash_message :notice, :"signed_up_but_#{resource.inactive_message}"
        		expire_data_after_sign_in!
        		respond_with resource, :location => after_inactive_sign_up_path_for(resource)
      		end
    	else

      		clean_up_passwords resource
          flash[:error] = []
          resource.errors.messages.each do |key, messages|
            messages.each do |message|
            flash[:error] << "Email: #{message}." if key.to_s == "email"
            flash[:error] << "Apodo: #{message}." if key.to_s == "nickname"
            flash[:error] << "Contraseña: #{message}." if key.to_s == "password"
            flash[:error] << "Verifica contraseña: #{message[0..10] + "n las contraseñas"}." if key.to_s == "password_confirmation"
            flash[:error] << "Nombre(s): #{message}." if key.to_s == "first_name"
            flash[:error] << "Apellido(s) paterno: #{message}." if key.to_s == "second_name"
            flash[:error] << "Apellido(s) materno: #{message}." if key.to_s == "third_name"
            flash[:error] << "Telefono: #{message}." if key.to_s == "telephone"
            end
          end
      		respond_with resource
    	end
	end

end