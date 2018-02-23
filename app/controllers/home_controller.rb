class HomeController < ApplicationController
  #Devise
  before_action :authenticate_user! 
end
