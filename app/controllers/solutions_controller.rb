class SolutionsController < ApplicationController
  before_action :set_solution, only: [:show, :edit, :update, :destroy, :choose_solution]
  before_filter :authenticate_user!, :except => [:show]
  filter_resource_access

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
    if current_user.id != @solution.problem.user.id then 
      redirect_to @solution.problem
    end
    
    notification = Notification.new
    notification.solution_id = @solution.id
    notification.problem_id = @solution.id
    notification.user_id = @solution.user
    notification.view = false
    
    respond_to do |format|
      if notification.save
        format.html {redirect_to @solution.problem, notice: 'Has escogido el aporte con exito'}
      else
        format.html {redirect_to @solution.problem, error: 'Hubo un error al escoger el aporte'}
      end
    end
  end

  private
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
