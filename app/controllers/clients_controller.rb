# /lib/mambu_api
require 'mambu_api' 
class ClientsController < ApplicationController
  $base_uri = 'https://finplus.sandbox.mambu.com/api/'

  def landing_page
    # authorize_request
    @link = request.url
  end
  
  def permission_denied; end

  def index
    @clients = find_clients
  end

  def new
    render new
  end
  
  def create
    @client = find_clients($base_uri+"clients")
  end
  
  def show
    # @client = find_clients($base_uri).first
  end

private

  def find_clients
    api = MambuApi.new
    api.request_api($base_uri+"clients")
  end
  
  def authorize_request
    valid_tenant_domain_and_user? ? (redirect_to clients_path) : (redirect_to permission_denied_path)
  end
  
  def valid_tenant_domain_and_user?
    tenant = helpers.get_details["\"TENANT_ID\""].gsub /[{"}]/, ""
    domain = helpers.get_details["{\"DOMAIN\""].gsub /[{"}]/, ""
    true if tenant == "finplus" && domain == "finplus.sandbox.mambu.com" && authorize_client?
  end
  
  def names
    ["turuthi"]
  end

  def authorize_client?
    client = fetch_user
    username = client["username"]
    true if names.include? username
  end
  
  def fetch_user
     # get_details from client helper
     user_key = helpers.get_details["\"USER_KEY\""].gsub /[{"}]/, ""
     api = MambuApi.new
     response = api.request_api($base_uri+"users/"+user_key)
  end
end

