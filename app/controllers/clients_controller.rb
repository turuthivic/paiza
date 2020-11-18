# /lib/mambu_api
require 'mambu_api' 
class ClientsController < ApplicationController
  before_action :authorize_client, except: :landing_page
  @@base_uri = 'https://finplus.sandbox.mambu.com/api/clients'
  @@users_uri = 'https://finplus.sandbox.mambu.com/api/users'
  
  def landing_page
    authorize_request
  end

  def index
    @clients = find_clients(@@base_uri)
  end

  def new
    render new
  end
  
  def create
    @client = find_clients(@@base_uri)
  end
  
  def show
    # @client = find_clients(@@base_uri).first
  end

private

  def find_clients(base_uri)
    api = MambuApi.new
    api.request_client_basic_auth(@@base_uri)
  end
  
  def authorize_request
    redirect_to clients_path if valid_url?
  end
  
  def valid_url?
    !!(request.url).match(/https:\/\/finplus.sandbox.mambu.com/)
  end
  
  def names
    ["turuthi"]
  end

  def authorize_client
    client = request_client_encoded_key(@@users_uri, user_key) 
    username = client["userName"]
    render landing_page unless names.include? username   
  end
  
  def request_client_encoded_key(uri, user_key)
    response = HTTParty.get(
      @@users_uri+"/#{user_key}",
      )
  end
end

