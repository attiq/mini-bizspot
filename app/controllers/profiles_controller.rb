class ProfilesController < ApplicationController

  before_filter :authenticate_user!

  before_filter :set_profile, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @profiles = Profile.all
    respond_with(@profiles)
  end

  def show
    respond_with(@profile)
  end

  def new
    @profile = Profile.new
    respond_with(@profile)
  end

  def edit
  end

  def create
    @profile = Profile.new(params[:profile])
    @profile.save
    respond_with(@profile)
  end

  def update
    @profile.update_attributes(params[:profile])
    respond_with(@profile)
  end

  def destroy
    @profile.destroy
    respond_with(@profile)
  end

  private
  def set_profile
    @profile = current_user.profile
  end
end
