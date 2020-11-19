class GroupsController < ApplicationController
  before_action :set_group, only: [:edit, :update, :destroy]
  before_action :authorize_group, only: [:index, :new, :show, :edit, :update, :destroy]

  def index
    @groups = current_user.organization.groups
  end

  def new
    @group = Group.new
  end

  def create
    @group = current_user.organization.groups.new(group_params)

    if @group.save
      redirect_to groups_path, notice: "Group was successfully created!"
    else
      render :new, notice: "Try again please!"
    end
  end

  def edit
  end

  def update
    if @group.update(group_params)
      redirect_to groups_path, notice: "Group was successfully updated!"
    else
      render :edit
    end
  end

  def destroy
    @group.destroy
    redirect_to groups_path, alert: "Your group has been successfully destroyd."
  end

  private

  def set_group
    @group = Group.find(params[:id])
  end

  def group_params
    params.require(:group).permit(:name, :enable_payment)
  end

  def authorize_group
    authorize(@group || Group)
  end
end
