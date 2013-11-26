class SolutionsController < ApplicationController
  before_action :set_solution, only: [:show, :edit, :update, :destroy, :choose_solution]
  before_action :set_currencies
  before_filter :authenticate_user!, :except => [:show]
  #filter_resource_access

  # GET /solutions/1
  # GET /solutions/1.json
  def show
  end

  # GET /problems/:problem_id/solutions/new
  def new
    @solution = Solution.new
    @problem = Problem.find_by_id(params[:id])
    if (@problem.nil?) then
      redirect_to problem_url
    end
    @solution.email = current_user.email
    @currencies = Currency.all.map{ |c| [c.acronym, c.id] }
  end

  # GET /solutions/1/edit
  def edit
    @areas_of_knowlegde = AreasOfKnowledge.all.map{|a| [a.name,a.id]}
    @currencies = Currency.all.map{ |c| [c.acronym, c.id] }
  end

  # POST /solutions
  # POST /solutions.json
  def create
    @solution = Solution.new(solution_params)
    respond_to do |format|
      if @solution.save
        format.html { redirect_to @solution, notice: 'El aporte fue creado con exito.' }
        format.json { render action: 'show', status: :created, location: @solution }
      else
        flash[:error] = []
        @solution.errors.messages.each do |key, messages|
          messages.each do |message|
            flash[:error] << "Descripcion: #{message}." if key.to_s == "text"
            flash[:error] << "Presupuesto: #{message}." if key.to_s == "estimate"
            flash[:error] << "Telefono de contacto: #{message}." if key.to_s == "telephone"
            flash[:error] << "Telefono de compañia: #{message}." if key.to_s == "company_telephone"
            flash[:error] << "Email de contacto: #{message}." if key.to_s == "email"
          end
        end
        format.html { render action: 'new' }
        format.json { render json: @solution.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /solutions/1
  # PATCH/PUT /solutions/1.json
  def update
    respond_to do |format|
      if @solution.update(solution_params)
        format.html { redirect_to @solution, notice: 'El aporte fue modificado con exito.' }
        format.json { head :no_content }
      else
        flash[:error] = []
        @solution.errors.messages.each do |key, messages|
          messages.each do |message|
            flash[:error] << "Descripcion: #{message}." if key.to_s == "text"
            flash[:error] << "Presupuesto: #{message}." if key.to_s == "estimate"
            flash[:error] << "Telefono de contacto: #{message}." if key.to_s == "telephone"
            flash[:error] << "Telefono de compañia: #{message}." if key.to_s == "company_telephone"
            flash[:error] << "Email de contacto: #{message}." if key.to_s == "email"
          end
        end
        format.html { render action: 'edit' }
        format.json { render json: @solution.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /solutions/1
  # DELETE /solutions/1.json
  def destroy
    problem = @solution.problem
    @solution.destroy
    respond_to do |format|
      format.html { redirect_to problem_path(problem) }
      format.json { head :no_content }
    end
  end

  def choose_solution
    if current_user.nil? then
      redirect_to @solution.problem
    end
    
    if current_user.id != @solution.problem.user.id then 
      redirect_to @solution.problem
    end
    
    notification = Notification.new
    notification.solution_id = @solution.id
    notification.problem_id = @solution.problem.id
    notification.user_id = @solution.user.id
    notification.view = false
    
    respond_to do |format|
      if notification.save
        @solution.update_attributes(:notification_id => notification.id)
        
        mail = Notifier.send_notification(@solution)
        mail.deliver
        format.html {redirect_to @solution.problem, notice: 'Has escogido el aporte con exito'}
      else
        format.html {redirect_to @solution.problem, error: 'Hubo un error al escoger el aporte'}
      end
    end
  end

  def notification_check
    if !(User.db_connect?) then
      redirect_to root_path
    end
    @notifications = params[:notifications]

    @notifications.each do |notification|
      notification = Notification.find_by_id(notification)
      if !(notification.nil?) then
        notification.update_attributes(view: true)
      end
    end

    respond_to do |format|
      format.js
    end  
  end

  private

    def set_currencies
      @currencies = Currency.all.map{ |c| [c.acronym, c.id] }
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_solution
      @solution = Solution.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def solution_params
      solution = params.require(:solution).permit(:text, :estimate, :currency_id, :email, :telephone, :company, :company_telephone, :problem_id, :user_id)
      if (solution["estimate"] == "") then
        solution["currency_id"] = Currency.find_by_acronym_and_country("None","None").id
      end
      solution
    end
end
