class UsersController < ApplicationController
  before_action :set_user, only: %i[ show edit update destroy ]

  # GET /users or /users.json
  def index
    @users = User.all
  end

  # GET /users/1 or /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  def grade
    @city = City.find(params[:city_id])
    @user = User.find(params[:id])
    @attractions = @city.attractions
    @grades = []
    @attractions.each do |a|
      xgrade = a.grades.where(user_id: @user.id).first
      if !xgrade then xgr = ' ' else xgr = xgrade.grade end
      @grades[a.id] = {'name_attraction'=>a.name_attraction, 'grade'=>xgr}
    end
  end

  def city_grade
    @user = User.find(params[:id])
    @city = City.find(params[:city_id])
    @attractions = @city.attractions
    @grades = []
    @attractions.each do |a|
      xgrade = a.grades.where(user_id: @user.id).first
      if !xgrade then xgr = ' ' else xgr = xgrade.grade end
      @grades[a.id] = {'name_attraction'=>a.name_attraction, 'grade'=>xgr}
    end
  end

  def city_save
    @user = User.find(params[:id])
    @city = City.find(params[:city_id])
    oceny = params['oceny']
    @city.attractions.each do |attraction|
      if attraction.users.where(id: @user.id).count()>0
        attraction.users.destroy(@user.id)
      end
      @xgr = Grade.new
      @xgr.user_id = @user.id
      @xgr.attraction_id = attraction.id
      @xgr.grade = oceny[attraction.id.to_s].to_f
      @xgr.save
    end
    redirect_to grade_user_path(@user.id, @city.id)
  end

  def nocity_grade
    @user = User.find(params[:id])
    @city = City.find(params[:city_id])
  end

  # POST /users or /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to user_url(@user), notice: "Użytkownik został w poprawny sposób dodany do bazy" }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1 or /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to user_url(@user), notice: "Użytkownik został z powodzniem zaktualizowany" }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1 or /users/1.json
  def destroy
    @user.destroy!

    respond_to do |format|
      format.html { redirect_to users_url, notice: "Użytkownik został z powodzniem usunięty" }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:name_user, :email, :password, city_ids: [])
    end
end
