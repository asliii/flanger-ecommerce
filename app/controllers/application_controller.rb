class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception #protect_from_forgery
  include CurrentCart #module include ediyor
  before_action :set_cart
end
