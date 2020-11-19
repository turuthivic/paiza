require 'base64'
module ClientHelper
  def get_details()
    output = Base64.decode64(
      'eyJET01BSU4iOiJmaW5wbHVzLnNhbmRib3gubWFtYnUuY29tIiwiQUxHT1JJVEhNIjoiaG1hY1NIQTI1NiIsIlRFTkFOVF9JRCI6ImZpbnBsdXMiLCJVU0VSX0tFWSI6IjhhODU4NmVlNzU2YTg2YzYwMTc1OWQ0Y2YxNzgzMDFlIn0'
      )
    array = output.split(",")
    count = 0; arr = []
    until count == array.length
      arr << array[count].split(":")
      count +=1
    end
    arr.to_h
  end
end