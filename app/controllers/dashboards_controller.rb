class DashboardsController < ApplicationController
  def show
    @packages = Package.all
  end
end
