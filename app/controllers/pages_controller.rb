class PagesController < ApplicationController
  before_action :authenticate!, only: [:restricted]

  caches_page :index
  caches_action :restricted

  def index
  end

  def expire_page
    # expire_page action: 'index'
    flash[:notice] = "Cleared Cache try now"
    # redirect_back root_path
    # expire_page :index
    # redirect_to root_path
    redirect_back(fallback_location: root_path)
  end

  def restricted
  end

  private

  def authenticate!
    params[:admin] == 'true'
  end

end
