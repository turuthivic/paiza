require 'base64'
module ClientHelper
  def get_details
    values = Base64.decode64(
      'eyJET01BSU4iOiJmaW5wbHVzLnNhbmRib3gubWFtYnUuY29tIiwiQUxHT1JJVEhNIjoiaG1hY1NIQTI1NiIsIlRFTkFOVF9JRCI6ImZpbnBsdXMiLCJVU0VSX0tFWSI6IjhhODU4NmVlNzU2YTg2YzYwMTc1OWQ0Y2YxNzgzMDFlIn0'
      )
    domain          =   values.DOMAIN
    algorithm       =   values.ALGORITHM
    tenant          =   values.TENANT_ID
    user_key        =   values.USER_KEY
  end
end