class ApplicationController < ActionController::Base
endbefore_action :configure_permitted_parameters, if: :devise_controller?


end