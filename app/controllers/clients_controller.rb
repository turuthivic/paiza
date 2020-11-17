# /lib/mambu_api
require 'mambu_api' 
class ClientsController < ApplicationController
  before_action :authorize_client
  @@base_uri = 'https://finplus.sandbox.mambu.com/api/clients'
  

  def landing_page
    redirect_to clients_path
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
    api.request_api(@@base_uri)
  end
  
  def authorize_client
    get_client_id()
  end
  
  def get_client_id(base64)
    url_link = request.fullpath.split(".")
  end
end