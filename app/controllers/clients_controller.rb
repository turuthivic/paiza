# /lib/mambu_api
require 'mambu_api' 
class ClientsController < ApplicationController
  before_action :authorize_client, except: :landing_page
  @@base_uri = 'https://finplus.sandbox.mambu.com/api/'
#   @@users_uri = 'https://finplus.sandbox.mambu.com/api/users'
  
  def landing_page
    # authorize_request
    # @user_key = helpers.get_details[:user_key]
    @user_key = helpers.get_details
  end

  def index
    @clients = find_clients(@@base_uri)
  end

  def new
    render new
  end
  
  def create
    @client = find_clients(@@base_uri+"clients")
  end
  
  def show
    # @client = find_clients(@@base_uri).first
  end

private

  def find_clients(base_uri)
    api = MambuApi.new
    api.request_api(@@base_uri+"clients")
  end
  
  def authorize_request
    redirect_to clients_path if valid_url?
  end
  
  def valid_url?
    # extract the signed url
    # !!(request.url).match(/https:\/\/finplus.sandbox.mambu.com/)
    tenant = helpers.get_details[:tenant]
    true if tenant == "finplus"
  end
  
  def names
    ["turuthi"]
  end

  def authorize_client
    client = request_client_encoded_key
    username = client["username"]
    render landing_page unless names.include? username
  end
  
  def request_client_encoded_key
     # get_details from client helper
     user_key = helpers.get_details[:user_key].to_s
     api = MambuApi.new
     response = api.request_api(@@base_uri+"users/"+user_key)
  end
end

