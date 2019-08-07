class ApplicationController < ActionController::API
  before_action :ensure_json_request

  private

  def ensure_json_request
    return if request.headers["Accept"] =~ /vnd\.api\+json/
    render text: 'this application accepts only json requests', status: 406
  end
end
