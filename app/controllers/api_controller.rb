class ApiController < ApplicationController
  protect_from_forgery with: :null_session
  self.responder = ApplicationResponder
  respond_to :json
end
