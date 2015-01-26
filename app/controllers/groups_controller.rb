class GroupsController < ApplicationController
  
  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)

    respond_to do |format|
      if @group.save
        format.html { redirect_to @group, notice: 'Group was successfully created.' }
        format.json { render :show, status: :created, location: @group }
      else
        format.html { render :new }
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @group = Group.find(params[:id])
    @group.destroy
    respond_to do |format|
      format.html { redirect_to groups_url, notice: 'Group was successfully destroyed.' }
      format.json { head :no_content }
    end
  end  

  def show
    @group = Group.find(params[:id])
    @users = User.all.where(:group == @group.name)
  end

  def index
    @groups = Group.all
  end

  def edit
    @group = Group.find(params[:id])
  end

private
    def group_params
      params.require(:group).permit(:name)
    end

end
