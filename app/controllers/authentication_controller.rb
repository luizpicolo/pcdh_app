class AuthenticationController < ApplicationController
  before_action :authenticate_user!
  layout 'authentication'
end
