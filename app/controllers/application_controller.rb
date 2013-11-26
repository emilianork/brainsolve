class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :configure_permitted_parameters, if: :devise_controller?
  helper_method :current_role

  helper_method :view_notifications
  helper_method :aportadores
  helper_method :problematicos
  

  def current_role
    if current_user.nil? then
      @current_role = nil
    else
      @current_role ||= current_user.role
    end
    return @current_role
  end
  
  def aportadores
    if @aportadores.nil?

    problems = current_user.problems
    solutions = []
    problems.each do |problem|
      solutions.push(problem.solutions)
    end

    solutions = solutions.flatten

    aportadores_id = Hash.new

    solutions.each do |x|
      if aportadores_id[x.user_id].nil? then
        aportadores_id[x.user_id] = 1
      else
        aportadores_id[x.user_id] += 1
      end
    end

    aportadores = aportadores_id.to_a

    aportadores = aportadores.sort{|x,y| x[1] <=> y[1]}.reverse

    aportadores = aportadores.map {|x| User.find(x[0])}

    @aportadores = aportadores

    return @aportadores
  else
    return @aportadores
  end
  end


    def problematicos

    if @problematicos.nil?
      solutions = current_user.solutions

      problems = solutions.map{|x| x.notification}
      problems = problems.keep_if {|x| !x.nil?}

      problems = problems.map{ |x| x.problem}



      problematicos_id = Hash.new

      problems.each do |x|
        if problematicos_id[x.user_id].nil? then
          problematicos_id[x.user_id] = 1
        else
          problematicos_id[x.user_id] += 1
        end
      end

    problematicos = problematicos_id.to_a

    problematicos  = problematicos.sort{|x,y| x[1] <=> y[1]}.reverse

    problematicos  = problematicos .map {|x| User.find(x[0])}

    @problematicos = problematicos 

    else
      return @problematicos
    end
  end


  def view_notifications
    if current_user.nil? then
      @notifications ||= []
      return @notifications
    end
    
    if current_role == "problematic" then
      @notifications ||= []
      return @notifications
    end
    
    if current_role == "creative"
      @notifications ||= current_user.notifications.where(:view => false).to_a
      return @notifications
    end
  end
  
  protected
  
  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit( :email, :password,:password_confirmation,
      :nickname, :first_name,:second_name, :third_name, :role, :telephone) }
  end
  
  def permission_denied
    flash[:error] = "Lo siento, no tienes permitido ingresar a esta página."
    redirect_to root_path
  end
end
