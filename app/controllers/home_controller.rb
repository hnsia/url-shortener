class HomeController < ApplicationController
  def index
    @ip = request.remote_ip
    if Rails.env.production?
      @country = request.location.country
      @city = request.location.city
    else
      @country = "home"
      @city = "bedroom"
    end
    print 
  end

  # GET '/[:shortkey]', final shortened url to redirect to target path
  def show
    @url = Url.find_by(shortened_key: params[:shortkey])
    ip = request.remote_ip
    if Rails.env.production?
      location = Geocoder.search(ip)
      coordinates = Visit.coords_to_str(location.first.coordinates)
      country = request.location.country
      city = request.location.city
    else
      coordinates = Visit.coords_to_str([4.2105, 101.9758])
      country = "home"
      city = "bedroom"
    end
    detected_location = "#{city}, #{country}"
    @visit = @url.visits.create(geocoordinates: coordinates, geolocation: detected_location)
    
    target_site = @url.target_url
    redirect_to target_site, allow_other_host: true
  end
end
