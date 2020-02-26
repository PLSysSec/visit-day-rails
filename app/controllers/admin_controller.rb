class AdminController < ApplicationController
  before_action :require_admin!
  def home
  end
end
