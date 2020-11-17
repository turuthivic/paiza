require 'httparty'

class MambuApi
  @@base_uri = 'https://finplus.sandbox.mambu.com/api/clients'
  
  def auth
    {username: Rails.application.credentials.mambu[:username], 
     password: Rails.application.credentials.mambu[:password]}
  end

  def request_api(base_uri)
    response = HTTParty.get(
      @@base_uri,
      basic_auth: auth)

    return nil if response.code != 200
    json = JSON.parse(response.body)
  end
end