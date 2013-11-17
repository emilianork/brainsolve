class ProblemsController < ApplicationController
  before_action :set_problem, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!, :except => [:show, :index]
  filter_resource_access

  # GET /problems
  # GET /problems.json
  def index
    #@problems = Problem.order(created_at: :desc).paginate(:per_page => 5, :page => params[:page])
    #@problems = Problem.search(params[:search])#.order(created_at: :desc).paginate(:per_page => 5, :page => params[:page])
    @problems = Problem.search(params[:search]).order(created_at: :desc).paginate(:per_page => 5, :page => params[:page])

  end

  # GET /problems/1
  # GET /problems/1.json
  def show
    @solutions = Problem.find(params[:id]).solutions
  end

  # GET /problems/new
  def new
    @problem = Problem.new
    @areas_of_knowlegde = AreasOfKnowledge.all.map{|a| [a.name,a.id]}
    @problem.contact = current_user.email
  end

  # GET /problems/1/edit
  def edit
    @areas_of_knowlegde = AreasOfKnowledge.all.map{|a| [a.name,a.id]}
  end

  # POST /problems
  # POST /problems.json
  def create
    @problem = Problem.new(problem_params)
    respond_to do |format|
      if @problem.save
        format.html { redirect_to @problem, notice: 'Problem was successfully created.' }
        format.json { render action: 'show', status: :created, location: @problem }
      else
        format.html { render action: 'new' }
        format.json { render json: @problem.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /problems/1
  # PATCH/PUT /problems/1.json
  def update
    respond_to do |format|
      if @problem.update(problem_params.permit!)
        format.html { redirect_to @problem, notice: 'Problem was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @problem.errors, content_type: 'text/json' }
      end
    end
  end

  # DELETE /problems/1
  # DELETE /problems/1.json
  def destroy
    @problem.destroy
    respond_to do |format|
      format.html { redirect_to problems_url }
      format.json { head :no_content }
    end
  end

  private

    # Use callbacks to share common setup or constraints between actions.
    def set_problem
      @problem = Problem.find_by_id(params[:id])
      if @problem.nil? then
        redirect_to root_path
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def problem_params
      params.require(:problem).permit(:title, :contact, :description, :telephone, :areas_of_knowledge_id, :user_id)
    end
end
