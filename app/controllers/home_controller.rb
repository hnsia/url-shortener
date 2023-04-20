class HomeController < ApplicationController
  def index
  end

  def show
    @url = Url.find_by(shortened_key: params[:shortkey])
    target_site = @url.target_url
    redirect_to target_site, allow_other_host: true
  end
end
