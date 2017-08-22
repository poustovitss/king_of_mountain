class PagesController < ApplicationController
  before_action :authenticate_user!, except: [:home]
  layout 'home'

  def home; end
end
