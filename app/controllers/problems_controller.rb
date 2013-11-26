class ProblemsController < ApplicationController
  before_action :set_problem, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!, :except => [:show, :index]
  filter_resource_access
   before_action :set_areas_of_knowledge

  # GET /problems
  # GET /problems.json
  def index
    @problems = Problem.search(params[:search]).order(created_at: :desc).paginate(:per_page => 10, :page => params[:page])
  end

  # GET /problems/1
  # GET /problems/1.json
  def show
    @solutions = Solution.where(problem_id: params[:id]).order(created_at: :desc).paginate(:per_page => 10, :page => params[:page])
  end

  # GET /problems/new
  def new
    @problem = Problem.new
    @problem.contact = current_user.email
  end

  # GET /problems/1/edit
  def edit
  end

  # POST /problems
  # POST /problems.json
  def create
    @problem = Problem.new(problem_params)
    respond_to do |format|
      if @problem.save
        format.html { redirect_to @problem, notice: 'El problema fue creado satisfactoriamente' }
        format.json { render action: 'show', status: :created, location: @problem }
      else
        flash[:error] = []
        @problem.errors.messages.each do |key, messages|
          messages.each do |message|
            flash[:error] << "Titulo: #{message}." if key.to_s == "title"
            flash[:error] << "Telefono de contacto: #{message}." if key.to_s == "telephone"
            flash[:error] << "Email de contacto: #{message}." if key.to_s == "contact"
            flash[:error] << "Descripcion: #{message}." if key.to_s == "description"
          end
        end
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
        format.html { redirect_to @problem, notice: 'El problema fue actualizado satisfactoriamente' }
        format.json { head :no_content }
      else
        flash[:error] = []
        @problem.errors.messages.each do |key, messages|
          messages.each do |message|
            flash[:error] << "Titulo: #{message}." if key.to_s == "title"
            flash[:error] << "Telefono de contacto: #{message}." if key.to_s == "telephone"
            flash[:error] << "Email de contacto: #{message}." if key.to_s == "contact"
            flash[:error] << "Descripcion: #{message}." if key.to_s == "description"
          end
        end
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
      if request.env["HTTP_REFERER"].nil? then
        format.html { redirect_to root_url }
      else
        format.html { redirect_to :back }
      end
      format.json { head :no_content }
    end
  end

  private

    def set_areas_of_knowledge
       @areas_of_knowlegde = AreasOfKnowledge.all.map{|a| [a.name,a.id]}
    end

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
