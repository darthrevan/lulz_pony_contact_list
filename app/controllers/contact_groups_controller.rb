class ContactGroupsController < ApplicationController
  respond_to :json

  def index
    respond_with ContactGroup.all
  end

  def show
    respond_with ContactGroup.find(params[:id])
  end

  def create
    respond_with ContactGroup.create(contact_group_params)
  end

  def update
    respond_with ContactGroup.update(params[:id], contact_group_params)
  end

  def destroy
    respond_with ContactGroup.destroy(params[:id])
  end

  private

  def contact_group_params
    params.require(:contact).permit(:name)
  end
end
